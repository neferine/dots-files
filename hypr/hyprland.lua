require("monitors")
require("settings")
require("keybinds")
require("rules")

local ok, _ = pcall(require, "pywal")
if not ok then
    hl.exec_cmd("nohup wal -i /home/crop/Pictures/wallpapers/flo.png -n &>/dev/null & disown")
end

hl.on("hyprland.start", function()
    hl.exec_cmd("nohup waybar &>/dev/null & disown")
    hl.exec_cmd("nohup awww-daemon &>/dev/null & disown")
    hl.exec_cmd("nohup /home/crop/.config/hypr/scripts/set-wallpaper.sh &>/dev/null & disown")
    hl.exec_cmd("nohup hypridle &>/dev/null & disown")

end)
