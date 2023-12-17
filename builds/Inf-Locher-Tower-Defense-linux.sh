#!/bin/sh
echo -ne '\033c\033]0;InfLocher Tower Defense\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Inf-Locher-Tower-Defense-linux.x86_64" "$@"
