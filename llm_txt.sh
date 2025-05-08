#!/bin/bash

VERSION="1.1.0"
TITLE="LLM_TXT & LLM_TREE Generator"
AUTHOR="Chris Engelhard"
EMAIL="chris@chrisengelhard.nl"
WEBSITE="https://www.chrisengelhard.nl"
COMPANY="Digi4Care"
_DATE="2025-05-06"

output_file="llm_txt.txt"
output_tree_file="llm_tree.txt"
rm -f "$output_file" "$output_tree_file"

extensions=("*.*")
exclude_dirs=(".vscode" ".git" ".qodo")
exclude_files=("kubeconfig" "llm_txt.txt" "llm_tree.txt" "llm_txt.sh" ".gitignore")

ext_pattern=$(IFS='|'; echo "${extensions[*]}")
exclude_pattern_dirs=$(IFS='|'; echo "${exclude_dirs[*]}")
exclude_pattern_files=$(IFS='|'; echo "${exclude_files[*]}")
exclude_pattern="$exclude_pattern_dirs|$exclude_pattern_files"

# Genereer boomstructuur met tree, filter bytes eruit
tree_output=$(tree -a -P "$ext_pattern" -I "$exclude_pattern" --du --noreport 2>/dev/null | sed -E 's/\[[^]]*\]  //g')

echo "$tree_output" > "$output_tree_file"

# Genereer de find-opdracht met juiste uitsluitingen
find_cmd="find . -type f"  # Voeg -type f toe om alleen bestanden te vinden
for dir in "${exclude_dirs[@]}"; do
    find_cmd+=" -not -path \"*/$dir/*\""
done
for file in "${exclude_files[@]}"; do
    find_cmd+=" -not -name \"$file\""
done

# Voeg de extensies toe aan de find-opdracht
ext_expr=""
for ext in "${extensions[@]}"; do
    if [[ -z "$ext_expr" ]]; then
        ext_expr="-name \"$ext\""
    else
        ext_expr="$ext_expr -o -name \"$ext\""
    fi
done

# Voeg de extensie filter toe aan de find-opdracht
find_cmd+=" \\( $ext_expr \\)"

# Zoek de bestanden, exclusief directories en bestanden uit de uitsluitingen
mapfile -t files < <(eval "$find_cmd" | sort)

# Voeg de inhoud van de bestanden toe aan het output bestand
for file in "${files[@]}"; do
    {
        printf -- "------------------------ %s ------------------------\n" "$file"
        cat "$file"
        printf "\n"
    } >> "$output_file"
done


clear
printf -- "--------------------------------------------------------------------------------\n"
printf -- "--- %s --- Version: %s\n" "$TITLE" "$VERSION"

printf -- "--------------------------------------------------------------------------------\n"
printf -- "--- Author: %s <%s>\n" "$AUTHOR" "$EMAIL"
printf -- "--- Website: %s\n" "$WEBSITE"
printf -- "--- Copyright: © %s %s\n" "$(date +'%Y')" "$COMPANY"
printf -- "--------------------------------------------------------------------------------\n"

printf -- "--- Boomstructuur geschreven naar %s\n" "$output_tree_file"
printf -- "--- Inhoud bestanden geschreven naar %s\n" "$output_file"