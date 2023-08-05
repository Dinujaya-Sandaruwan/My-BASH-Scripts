#!/bin/bash

# Function to print text in light green color
function print_light_green() {
  echo -e "\033[1;32m$1\033[0m"
}

# Step 01: Go to the target directory
cd "/media/dinujaya/Server/React/" || exit 1

echo ""

# Step 02: List all folders and select one
PS3="$(print_light_green "Select a folder to open in Visual Studio Code: ")"

folders=($(find . -maxdepth 1 -type d -printf "%P\n"))
select folder in "${folders[@]}"; do
    if [[ -n "$folder" ]]; then
        # Open the selected folder in Visual Studio Code
        code "/media/dinujaya/Server/React/$folder"
        break
    else
        echo "Invalid selection. Please try again."
    fi
done
