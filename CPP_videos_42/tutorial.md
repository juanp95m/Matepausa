# Tutorial: Video to Markdown Conversion

This tutorial outlines the manual steps to convert video tutorials into markdown files with code snippets, as automated by the `process_single_cpp_dir.fish` script.

## 1. Create a Directory for Frames

For each video file (e.g., `my_video.mp4`), create a directory to store the extracted frames.

```bash
mkdir my_video_frames
```

## 2. Extract Frames with `ffmpeg`

Use `ffmpeg` to extract relevant frames from the video. The following command selects frames with significant scene changes and saves them as PNG images.

```bash
ffmpeg -i my_video.mp4 -vf "select='gt(scene,0.01)',scale=1920:-1" -vsync vfr -q:v 2 my_video_frames/frame_%03d.png
```

- `-i my_video.mp4`: Specifies the input video file.
- `-vf "select='gt(scene,0.01)'"`: A video filter that selects frames where the scene change is greater than a threshold of 0.01.
- `-vsync vfr`: Sets the video sync method to variable frame rate.
- `-q:v 2`: Sets the quality scale for the output images.
- `my_video_frames/frame_%03d.png`: The output pattern for the frame images.

## 3. Extract Text with `tesseract`

Use `tesseract` OCR to extract text and code from the frames. This command processes all PNG files in the `my_video_frames` directory and appends the extracted text to a single output file.

```bash
for f in my_video_frames/*.png; do \
  tesseract "$f" stdout >> codigo_extraido.txt; \
done
```

- `for f in my_video_frames/*.png`: Loops through all PNG files in the frames directory.
- `tesseract "$f" stdout`: Runs `tesseract` on each frame and prints the output to standard output.
- `>> codigo_extraido.txt`: Appends the extracted text to `codigo_extraido.txt`.

## 4. Generate Subtitles with `whisper` (Optional)

If you need to generate subtitles, you can use `whisper`.

```bash
whisper my_video.mp4 --model medium --language English
```

This will generate a `my_video.srt` file (and other formats).

## 5. (Optional) Combine with Subtitles


If you have a subtitle file (e.g., `my_video.srt`), you can manually combine its content with the `codigo_extraido.txt` file to create a more comprehensive markdown tutorial.
