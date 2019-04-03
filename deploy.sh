#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t aafu # if using a theme, replace with `hugo -t <YOURTHEME>`

# Copy the contents of public into ericjohnsondev.github.io
for f in *; do cp -rf "$f" ../ericjohnsondev.github.io/; done

# CD into project
cd ../ericjohnsondev.github.io

# Add all newly copied changes
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..

echo "Done :D"
