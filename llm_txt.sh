#!/bin/bash

VERSION="1.2.0"
TITLE="LLM_TXT Generator"
AUTHOR="Chris Engelhard"
EMAIL="chris@chrisengelhard.nl"
WEBSITE="https://www.chrisengelhard.nl"
COMPANY="Digi4Care"
_DATE="2025-05-08"

output_file="llm_txt.txt"
rm -f "$output_file"

# File and directory filters
extensions=("*.*")
exclude_dirs=(".vscode" ".git" ".qodo")
exclude_files=("kubeconfig" "llm_txt.txt" "llm_txt.sh" ".gitignore")

ext_pattern=$(IFS='|'; echo "${extensions[*]}")
exclude_pattern_dirs=$(IFS='|'; echo "${exclude_dirs[*]}")
exclude_pattern_files=$(IFS='|'; echo "${exclude_files[*]}")
exclude_pattern="$exclude_pattern_dirs|$exclude_pattern_files"

# Generate directory tree and clean up byte info
tree_output=$(tree -a -P "$ext_pattern" -I "$exclude_pattern" --du --noreport 2>/dev/null | sed -E 's/\[[^]]*\]  //g')

# Start writing to output file
{
    echo "------------------------ PROJECT TREE ------------------------"
    echo "$tree_output"
    echo ""
} >> "$output_file"

# Build the find command to include file extensions and exclude paths
find_cmd="find . -type f"
for dir in "${exclude_dirs[@]}"; do
    find_cmd+=" -not -path \"*/$dir/*\""
done
for file in "${exclude_files[@]}"; do
    find_cmd+=" -not -name \"$file\""
done

# Filter by extension
ext_expr=""
for ext in "${extensions[@]}"; do
    if [[ -z "$ext_expr" ]]; then
        ext_expr="-name \"$ext\""
    else
        ext_expr="$ext_expr -o -name \"$ext\""
    fi
done
find_cmd+=" \\( $ext_expr \\)"

# Collect and sort files
mapfile -t files < <(eval "$find_cmd" | sort)

# Append file contents
for file in "${files[@]}"; do
    {
        printf -- "------------------------ %s ------------------------\n" "$file"
        cat "$file"
        printf "\n"
    } >> "$output_file"
done

# Final terminal output
clear
printf -- "--------------------------------------------------------------------------------\n"
printf -- "--- %s --- Version: %s\n" "$TITLE" "$VERSION"
printf -- "--------------------------------------------------------------------------------\n"
printf -- "--- Author: %s <%s>\n" "$AUTHOR" "$EMAIL"
printf -- "--- Website: %s\n" "$WEBSITE"
printf -- "--- Copyright: © %s %s\n" "$(date +'%Y')" "$COMPANY"
printf -- "--------------------------------------------------------------------------------\n"
printf -- "--- Combined structure and file content written to %s\n" "$output_file"
