#!/bin/bash

input_folder="./img/ProjectScreenshots/"
output_folder="./img/ConvertedProjectScreenshots/"

# Ensure the output folder exists
mkdir -p "$output_folder"

# Loop through the input folder and convert images
for file in "$input_folder"*
do
    if [ -f "$file" ]
    then
        filename=$(basename "$file")
        output_file="${output_folder}${filename%.*}.webp"

        # Check if the input file is an image file
        file_type=$(file -b --mime-type "$file")
        if [[ $file_type == image/* ]]; then
            convert "$file" -resize 400x "$output_file"
            echo "Converted $filename to $output_file"
        else
            echo "Skipped $filename (not an image file)"
        fi
    fi
done
