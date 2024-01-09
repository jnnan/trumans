#!/bin/bash

# Directory containing the MP4 files
DIRECTORY="./"

# Iterate over all .mp4 files in the DIRECTORY
for FILE in "$DIRECTORY"/*.mp4; do
  # Check if the file is a regular file
  if [ -f "$FILE" ]; then
    # Use ffmpeg to re-encode the video file
    # The original file will be overwritten
    ffmpeg -i "$FILE" -c:v libx264 -crf 30 -y "${FILE%.mp4}_compressed.mp4" && mv "${FILE%.mp4}_compressed.mp4" "$FILE"
  fi
done

echo "All files have been re-encoded."
