#!/bin/bash

output_file="llm_txt.txt"
output_tree_file="llm_tree.txt"
rm -f "$output_file" "$output_tree_file"

extensions=("*.yml" "*.ini" "*.j2" "*.cfg" "*.txt")
exclude_dirs=(".vscode" ".git" ".qodo" "proxmox-pve1")
exclude_files=("kubeconfig" "llm_txt.txt")

ext_pattern=$(IFS='|'; echo "${extensions[*]}")
exclude_pattern_dirs=$(IFS='|'; echo "${exclude_dirs[*]}")
exclude_pattern_files=$(IFS='|'; echo "${exclude_files[*]}")
exclude_pattern="$exclude_pattern_dirs|$exclude_pattern_files"

# Genereer boomstructuur met tree, filter bytes eruit
tree_output=$(tree -a -P "$ext_pattern" -I "$exclude_pattern" --du --noreport 2>/dev/null | sed -E 's/\[[^]]*\]  //g')

echo "$tree_output" > "$output_tree_file"

# Vind bestanden met find (zoals eerder)
find_cmd="find ."
for dir in "${exclude_dirs[@]}"; do
    find_cmd+=" -not -path \"*/$dir/*\""
done
for file in "${exclude_files[@]}"; do
    find_cmd+=" -not -name \"$file\""
done

ext_expr=""
for ext in "${extensions[@]}"; do
    if [[ -z "$ext_expr" ]]; then
        ext_expr="-name \"$ext\""
    else
        ext_expr="$ext_expr -o -name \"$ext\""
    fi
done

find_cmd+=" \\( $ext_expr \\)"

mapfile -t files < <(eval "$find_cmd" | sort)

# Append inhoud bestanden
for file in "${files[@]}"; do
    {
        printf -- "------------------------ %s ------------------------\n" "$file"
        cat "$file"
        printf "\n"
    } >> "$output_file"
done

echo "Boomstructuur geschreven naar $output_tree_file"
echo "Inhoud bestanden geschreven naar $output_file"