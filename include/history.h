/* ===============================================================
 * C module for tracking the history of a command line.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

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
    struct termios new_term_settings;
    struct termios old_term_settings;
    const char* prefix;
} history_t;

#ifdef __cplusplus
extern "C" {
#endif
    void init_history(history_t* history, const char* prefix);
    int get_input_char(history_t* history);
    void restore_term(history_t* history);
    void set_term(history_t* history);
#ifdef __cplusplus
}
#endif

#endif

/*
 * OSR library for LLVM. Copyright (C) 2015 Daniele Cono D'Elia
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 3 of the License, or (at your option) any
 * later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
*/