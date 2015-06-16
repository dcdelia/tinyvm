#ifndef TINYVM_HISTORY_H
#define TINYVM_HISTORY_H

#define MAX_CMD_LEN 512
#define HISTORY_LEN 5

#include <termios.h>

typedef struct history_s {
    unsigned char history_cmd[HISTORY_LEN][MAX_CMD_LEN];
    unsigned short history_cmd_len[HISTORY_LEN];
    unsigned char current_cmd[MAX_CMD_LEN];
    int max_valid_index;
    int write_index;
    int last_written;
    int oldest_written;
    int last_read;
    int current_cmd_len;
    int is_typing;
    int last_retrieved;
    int eof;
    struct termios old_term_settings;
    const char* prefix;
} history_t;

#ifdef __cplusplus
extern "C" {
#endif
    void init_history(history_t* history, const char* prefix);
    int get_input_char(history_t* history);
    void restore_term(history_t* history);
#ifdef __cplusplus
}
#endif

#endif
