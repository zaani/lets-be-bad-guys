#!/bin/bash
# Simple grep script for Git Bash (no colors)

echo "########################################"
echo " Simple grep scanner"
echo "########################################"
echo ""

# keywords to search for
keywords=(
  "password"
  "secret"
  "DEBUG"
  "api_key"
  "token"
  "eval("
  "exec("
)

for word in "${keywords[@]}"
do
  echo "========================================"
  echo "Searching for: $word"
  echo "----------------------------------------"

  # check if matches exist
  matches=$(grep -r -n --exclude-dir=.git -E "$word" .)

  if [ -n "$matches" ]; then
    echo "$matches" | while IFS= read -r line; do
      echo "  $line"
    done
  else
    echo "  No matches found."
  fi

  echo ""
done

echo "########################################"
echo " All done."
echo "########################################"
