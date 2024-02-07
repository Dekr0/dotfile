#!/usr/bin/env bash

tmux new -ds node -c ~/work_codebase/dev/lp/lpfirm_backend
tmux new -ds next -c ~/work_codebase/dev/lp/frontend/
tmux new -ds nvim -c ~/work_codebase/dev/lp/

tmux switch-client -t "nvim"

