@echo off

:: Path to the mpv exe
set "MPV_PATH="
:: Path to the folder with your music. will scramble ALL contents inside, so be specific.
set "MUSIC_DIR="

echo Start MPV with %MUSIC_DIR%?
pause

start "" "%MPV_PATH%" --shuffle "%MUSIC_DIR%"
exit
