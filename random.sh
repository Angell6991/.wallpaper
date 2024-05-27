#!/bin/bash
wallpaper_dir="/home/angell/Imágenes/.wallpaper/Escritorio"  # Reemplaza con la ruta a tu carpeta de fondos
wallpapers=($wallpaper_dir/*)
wallpaper=${wallpapers[RANDOM % ${#wallpapers[@]}]}
nitrogen --set-zoom-fill --random $wallpaper 
