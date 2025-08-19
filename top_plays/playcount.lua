local utils = require 'mp.utils'
local msg = require 'mp.msg'

local playcount_file = (os.getenv("APPDATA") or os.getenv("HOME")) .. "/mpv_playcounts.json"
local playcounts = {}
local start_time = nil
local current_path = nil

local function load_counts()
    local file = io.open(playcount_file, "r")
    if file then
        local content = file:read("*a")
        file:close()
        local parsed = utils.parse_json(content)
        if parsed then
            playcounts = parsed
        end
    end
end

local function save_counts()
    local file = io.open(playcount_file, "w+")
    if file then
        file:write(utils.format_json(playcounts))
        file:close()
    end
end

mp.register_event("start-file", function()
    start_time = mp.get_time()
    current_path = mp.get_property("path")
end)

local function track_end()
    if not current_path or not start_time then return end
    local play_duration = mp.get_time() - start_time
    if play_duration >= 10 then
        playcounts[current_path] = (playcounts[current_path] or 0) + 1
        msg.info("Played " .. current_path .. " for " .. math.floor(play_duration) .. " seconds. Count: " .. playcounts[current_path])
        save_counts()
    else
        msg.info("Skipped " .. current_path .. " (played for only " .. math.floor(play_duration) .. " seconds)")
    end
    current_path = nil
    start_time = nil
end

mp.register_event("end-file", track_end)
mp.register_event("shutdown", track_end)

load_counts()