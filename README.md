# mpv-scripts
A collection of custom Lua scripts I made for enhancing the [MPV media player](https://mpv.io).

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
