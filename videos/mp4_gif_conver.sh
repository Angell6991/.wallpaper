#!/bin/bash

# sudo pacman -S ffmpeg gifski bc

input="input.mp4"
output="output.gif"

# Obtener fps, width y height
fps=$(ffprobe -v 0 -of csv=p=0 -select_streams v:0 -show_entries stream=r_frame_rate "$input")
width=$(ffprobe -v 0 -of csv=p=0 -select_streams v:0 -show_entries stream=width "$input")
height=$(ffprobe -v 0 -of csv=p=0 -select_streams v:0 -show_entries stream=height "$input")

# Extraer frames según fps original
ffmpeg -i "$input" -vf fps="$fps" frame_%04d.png

# Convertir a GIF
gifski --fps $(echo $fps | bc) --width $width --height $height --output "$output" frame_*.png

# Limpiar
rm frame_*.png

echo "GIF creado: $output"
