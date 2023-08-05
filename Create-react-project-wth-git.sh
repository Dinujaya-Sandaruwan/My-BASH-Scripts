#!/bin/bash

# Function to print yellow colored text
print_yellow() {
  echo -e "\e[93m$1\e[0m"
}

# Step 1
cd "/media/dinujaya/Server/React/"

# Step 2
print_yellow "Please enter the project name:"
read PROJECT_NAME

# Step 3
print_yellow "Creating your React project using VITE..."
npm init vite@latest $PROJECT_NAME -- --template react-ts

# Step 4
cd "$PROJECT_NAME"

# Step 5
print_yellow "Installing Node Modules..."
npm i

# Step 6
print_yellow "Initializing a git repository..."
git init

# Step 7
print_yellow "Adding project name to README.md..."
echo "# $PROJECT_NAME" > README.md

# Step 8
print_yellow "Adding all files to the staging area..."
git add .

# Step 9
print_yellow "Adding the first commit to the main branch..."
git commit -m "Initial commit"

# Step 10
print_yellow "Creating a new branch from the main branch..."
git branch build/alpha

# Step 11
print_yellow "Creating another new branch from the main branch..."
git branch build/beta

# Step 12
print_yellow "Switching to 'build/beta' branch..."
git switch build/beta

# Step 13
print_yellow "Creating a remote repository on GitHub..."
curl -X POST -H "Authorization: token <!--YOUR TOKEN HERE -->" -d '{"name": "'"$PROJECT_NAME"'", "private": true, "auto_init": true}' https://api.github.com/user/repos

# Step 14
print_yellow "Adding a remote origin for git with Project Name..."
git remote add origin git@github.com:Dinujaya-Sandaruwan/"$PROJECT_NAME".git

# Step 15
print_yellow "Pushing local changes to the remote repository..."
#git push -u origin main
#git push -u origin build/alpha
#git push -u origin build/beta
#git push --all origin
git push -u origin --all --force


# Step 16
print_yellow "Opening the current path in VSCode..."
code .

# Step 17
print_yellow "Opening the current path in the terminal..."
gnome-terminal --working-directory=$(pwd)

echo "All done!"
