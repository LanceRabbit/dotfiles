#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract information from Claude Code JSON
user=$(whoami)
host=$(hostname -s)
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')
model=$(echo "$input" | jq -r '.model.display_name')
datetime=$(date "+%a %b %d, %H:%M")

# Shorten home directory to ~
home="$HOME"
short_dir="${current_dir/#$home/~}"

# Get current working directory for git operations
cd "$current_dir" 2>/dev/null || true

# Git branch info (replaces oh-my-zsh git_prompt_info)
git_branch=$(git -c gc.auto=0 branch --show-current 2>/dev/null || echo '')
if [ -n "$git_branch" ]; then
	git_info="$git_branch"
else
	git_info=""
fi

# Total cost
total_cost=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')

# Context usage percentage
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Build context bar and color
if [ -n "$used_pct" ]; then
	# Round to integer
	used_int=$(printf "%.0f" "$used_pct")

	# Choose color based on percentage: green < 70, yellow 70-90, red >= 90
	if [ "$used_int" -lt 70 ]; then
		ctx_color="\033[0;32m"   # green
	elif [ "$used_int" -lt 90 ]; then
		ctx_color="\033[0;33m"   # yellow
	else
		ctx_color="\033[0;31m"   # red
	fi

	# Build a 10-block progress bar
	filled=$(( used_int / 10 ))
	empty=$(( 10 - filled ))
	bar=""
	for i in $(seq 1 $filled); do bar="${bar}█"; done
	for i in $(seq 1 $empty);  do bar="${bar}░"; done

	ctx_display="${ctx_color}${bar} ${used_int}%\033[0m"
else
	ctx_display="\033[0;90m(no data)\033[0m"
fi

# Build cost display
if [ -n "$total_cost" ]; then
	cost_fmt=$(printf "%.4f" "$total_cost")
	cost_display="\033[0;90m$\033[0m\033[1;37m${cost_fmt}\033[0m"
else
	cost_display="\033[0;90m$-.----\033[0m"
fi

# Styled to match xiong-chiamiov-plus theme colors:
# Blue bold box-drawing, green user, grey @, cyan host, white path, yellow datetime
# Line 1: ┌─[user@host] - [~/path] - [Day Mon DD, HH:MM]
printf "\033[0;34m\033[1m┌─[\033[0m\033[1;32m%s\033[1;30m@\033[0;36m%s\033[0;34m\033[1m]\033[0m - \033[0;34m\033[1m[\033[1;37m%s\033[0;34m\033[1m]\033[0m - \033[0;34m\033[1m[\033[0;33m%s\033[0;34m\033[1m]\033[0m\n" \
	"$user" "$host" "$short_dir" "$datetime"

# Line 2: └─[model] <git_branch> | ctx: <bar> | $cost
printf "\033[0;34m\033[1m└─[\033[0;90m%s\033[0;34m\033[1m]\033[0m <%s> \033[0;34m|\033[0m ctx: " \
	"$model" "$git_info"
printf "${ctx_display}"
printf " \033[0;34m|\033[0m "
printf "${cost_display}\n"
