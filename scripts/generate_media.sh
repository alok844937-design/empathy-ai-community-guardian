#!/usr/bin/env bash
# Helper script (run locally or in CI) to render SVG -> MP4/GIF and generate a Lottie JSON (if using After Effects or bodymovin)
# Requires: headless browser (puppeteer) or imagemagick + gifsicle + ffmpeg.
# This script provides a simple ffmpeg-based conversion if you can render SVG frames first.
# For best quality: use a headless Chromium script to capture the SVG at 30fps for 12-15s, then ffmpeg to assemble.

OUT_DIR=assets
SVG=assets/hero_story.svg
DURATION=15
FPS=30
WIDTH=1200
HEIGHT=600
TMP=tmp_frames

mkdir -p $TMP $OUT_DIR

echo "1) If you have puppeteer: render the inline SVG to PNG frames at ${FPS}fps for ${DURATION}s into $TMP."
echo "2) If you already have frame-0000.png ... frame-XXXX.png then run:"
echo "   ffmpeg -framerate ${FPS} -i ${TMP}/frame-%05d.png -c:v libx264 -pix_fmt yuv420p -crf 18 -r ${FPS} ${OUT_DIR}/empathy_demo.mp4"
echo "3) To create an optimized GIF (looping):"
echo "   ffmpeg -i ${OUT_DIR}/empathy_demo.mp4 -vf 'fps=15,scale=960:-1:flags=lanczos' -loop 0 ${OUT_DIR}/empathy_demo.gif"
echo "4) For smaller GIFs, use gifsicle to optimize further."
echo ""
echo "If you want me to render these files for you, tell me and I'll generate them and commit to the animated-readme branch."