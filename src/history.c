#include "history.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <termios.h>    // termios, TCSANOW, ECHO, ICANON
#include <unistd.h>     // STDIN_FILENO

void init_history(history_t* history, const char* prefix) {
    history->max_valid_index = -1;
    history->write_index = 0;
    history->last_written = -1;
    history->oldest_written = 0;
    history->last_read = -1;
    history->current_cmd_len = 0;
    history->is_typing = 1;
    history->last_retrieved = -1;
    history->eof = 0;
    history->prefix = prefix;

    /* Hack current terminal to disable cooked buffered stdin. Credits:
     * http://stackoverflow.com/questions/1798511/how-to-avoid-press-enter-with-any-getchar
     * http://www.gnu.org/software/libc/manual/html_node/Noncanon-Example.html */
    if (tcgetattr(STDIN_FILENO, &history->old_term_settings) == -1) {
        perror("Cannot fetch current parameters for the terminal");
        exit(EXIT_FAILURE);
    }
    struct termios new_term_settings = history->old_term_settings;

    /* We will disable two options:
     * - ICANON (takes care that one line at a time will be processed)
     * - ECHO (automatically echoes the input back to the terminal) */
    new_term_settings.c_lflag &= ~(ICANON | ECHO);
    new_term_settings.c_cc[VMIN] = 1;
    new_term_settings.c_cc[VTIME] = 0;
    if (tcsetattr(STDIN_FILENO, TCSAFLUSH, &new_term_settings) == -1) { // was: TCSANOW
        perror("Cannot change current parameters for the terminal");
        exit(EXIT_FAILURE);
    }
}

static void handle_arrow(history_t* h) {
    #define UNEXPECTED(c) do { \
            fprintf(stderr, "Error: can't handle ASCII code %d returned by the OS. Exiting...\n", c); \
            exit(EXIT_FAILURE); \
        } while (0);

    int up;

    int c = getchar();
    if (c != 91) UNEXPECTED(c);
    c = getchar();
    if (c == 65) { // UP: go backward in the history
        up = 1;
    } else if (c == 66) { // DOWN: go forward in the history
        up = 0;
    } else if (c == 67 || c == 68) { // RIGHT || LEFT
        return;
    } else {
        UNEXPECTED(c);
        return;
    }
    #undef UNEXPECTED

    if (h->max_valid_index == -1) return; // init only (buffer is empty)

    int read_index;

    if (!up && (h->last_read == -1 || h->last_read == h->last_written)) {
        read_index = h->last_read; // cannot go forward
    } else if (up && h->last_read == h->oldest_written) {
        read_index = h->last_read; // cannot go backward
    } else {
        if (up) { // backward
            if (h->last_read == -1) {
                read_index = h->last_written;
            } else {
                read_index = h->last_read;
                if (--read_index < 0) read_index = HISTORY_LEN - 1; // safe: see last_read != oldest_written above
            }
        } else { // forward
            read_index = (h->last_read + 1) % HISTORY_LEN;
        }

        h->last_read = read_index;
    }

    printf("\r%c[2K%s", 27, h->prefix); // reset current row
    fflush(stdout);

    int i;
    h->current_cmd_len = h->history_cmd_len[read_index];
    for (i = 0; i < h->history_cmd_len[read_index]; ++i) {
        putchar(h->history_cmd[read_index][i]);
        h->current_cmd[i] = h->history_cmd[read_index][i];
    }
}

int get_input_char(history_t* history) {
    if (history->is_typing) {
        //printf("%s", history->prefix);
        //fflush(stdout);
        history->current_cmd_len = 0;
        int keep_reading = 1;
        while (keep_reading) {
            // check on current_cmd_len
            int c = getchar();
            switch (c) {
                case 4:
                        // EOF
                        keep_reading = 0;
                        history->eof = 1;
                        history->current_cmd[history->current_cmd_len++] = '\n'; // future fetches
                        putchar('\n');
                        break;
                case 27:
                        // arrow or other "cooked" key
                        handle_arrow(history);
                        break;
                case 127:
                        // backspace
                        if (history->current_cmd_len > 0) {
                            history->current_cmd_len--;
                            printf("\b \b");
                            fflush(stdout);
                        }
                        break;
                case '\n':
                        keep_reading = 0;
                        putchar(c);
                        break;
                default:
                        history->current_cmd[history->current_cmd_len++] = c;
                        putchar(c);
            }
        }

        history->is_typing = 0;
        history->last_retrieved = -1;

        history->history_cmd_len[history->write_index] = history->current_cmd_len;
        memcpy(history->history_cmd[history->write_index], history->current_cmd, history->current_cmd_len);
        history->last_written = history->write_index;
        if (history->max_valid_index < HISTORY_LEN - 1) {
            history->max_valid_index++;
        } else {
            history->oldest_written = (history->oldest_written + 1) % HISTORY_LEN;
        }
        history->last_read = -1;
        history->write_index = (history->write_index + 1) % HISTORY_LEN;

        return get_input_char(history);
    } else {
        if (history->eof == 1 && history->last_retrieved == history->current_cmd_len - 2) {
            history->eof = 0;
            history->is_typing = 1;
            return EOF;
        }
        int ret = history->current_cmd[++history->last_retrieved];
        if (history->last_retrieved == history->current_cmd_len) {
            history->is_typing = 1;
            return '\n';
            //return get_input_char(history);
        } else {
            return ret;
        }
    }
}

void restore_term(history_t* history) {
    if (tcsetattr(STDIN_FILENO, TCSANOW, &history->old_term_settings) == -1) {
        perror("Cannot change current parameters for the terminal");
        exit(EXIT_FAILURE);
    }
}
