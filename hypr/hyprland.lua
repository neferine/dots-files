require("monitors")
require("settings")
require("keybinds")
require("rules")

local ok, pywal = pcall(require, "pywal")
if ok and pywal then
    hl.config({
        group = {
            col = {
                border_active   = pywal.groupBorderActive,
                border_inactive = pywal.groupBorderInactive,
            },
            groupbar = {
                text_color          = pywal.groupbarText,
                text_color_inactive = pywal.groupbarTextInactive,
                col = {
                    active   = pywal.groupbarBgActive,
                    inactive = pywal.groupbarBgInactive,
                },
            },
        },
    })
else
    hl.exec_cmd("nohup wal -i /home/crop/Pictures/wallpapers/flo.png -n &>/dev/null & disown")
end

hl.on("hyprland.start", function()
    hl.exec_cmd("nohup waybar &>/dev/null & disown")
    hl.exec_cmd("nohup awww-daemon &>/dev/null & disown")
    hl.exec_cmd("nohup /home/crop/.config/hypr/scripts/set-wallpaper.sh &>/dev/null & disown")
    hl.exec_cmd("nohup hypridle &>/dev/null & disown")

end)
