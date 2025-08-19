local utils = require 'mp.utils'
local msg = require 'mp.msg'

local home = os.getenv("APPDATA") or os.getenv("HOME")
local playcount_file = home .. "/mpv_playcounts.json"

local function show_top_played()
    local file = io.open(playcount_file, "r")
    if not file then
        mp.osd_message("No playcount data found.")
        return
    end

    local content = file:read("*a")
    file:close()

    local data = utils.parse_json(content)
    if not data or next(data) == nil then
        mp.osd_message("No playcount data found.")
        return
    end

    local entries = {}
    for path, count in pairs(data) do
        table.insert(entries, {path = path, count = count})
    end

    table.sort(entries, function(a,b) return a.count > b.count end)

    local max_to_show = 5
    local msg_lines = {"Top played tracks:"}

    for i=1, math.min(max_to_show, #entries) do
        local filename = entries[i].path:match("[^\\/]+$") or entries[i].path
        table.insert(msg_lines, string.format("%d. %s - %d plays", i, filename, entries[i].count))
    end

    mp.osd_message(table.concat(msg_lines, "\n"), 10)
end

mp.add_key_binding("Ctrl+p", "show_playcounts", show_top_played)
