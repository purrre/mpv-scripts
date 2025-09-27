# mpv-scripts
A collection of custom Lua scripts I made for enhancing the [MPV media player](https://mpv.io).

## Launcher
I created a simple launcher using batch that creates a random playlist with songs you specify. Simply run `launcher.bat`

View the mpv docs [here](https://mpv.io/manual/stable/)

Add any additional flags you might need. If you're running this alongside [Music Presence](https://github.com/ungive/discord-music-presence/), you will probably need to add the flag `--media-controls=yes`

## Installation
1. Navigate to MPV’s configuration directory (typically located at `\AppData\Roaming\mpv\` on Windows).  
2. Create a `scripts` folder if it doesnt exist.  
3. Place the Lua scripts inside the `scripts` folder.  
4. Launch MPV. the scripts will load automatically.  

## Scripts
### top_plays
Tracks your most frequently played songs in MPV by storing playback history (scrobbles).  
- Displays the top 5 tracks by default (customizable).
- Only counts tracks that play for longer than 10 seconds (customizable)
- Open the menu with **`Ctrl + P`**.

## Coming
### Time Listened
How long you've played media

### Top Artists
Your most played artists

### Information Hub
Easily customizable hub that shows all statistics and information in one place, easy to add on to.

### Genres
Your most played Genres. Will only be effective if the `Genre` metadata is filled in your files.
