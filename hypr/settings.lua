-- Environment variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Adwaita:dark")

-- Look and feel
hl.config({
    general = {
        gaps_in          = 0,
        gaps_out         = 0,

        border_size      = 0,

        col              = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing    = false,

        layout           = "dwindle",
    },

    decoration = {
        rounding         = 0,
        rounding_power   = 0,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow           = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur             = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = false,
        animation = {
            "fade, 1, 3, default"
        },
    },
})

-- Input
hl.config({
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",

        follow_mouse = 1,

        sensitivity  = 0,

        touchpad     = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- Misc
hl.config({
    misc = {
        force_default_wallpaper  = -1,
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
    },
})

-- Layouts
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

-- Group / tabs
hl.config({
    group = {
        col = {
            border_active   = "rgba(33ccffee)",
            border_inactive = "rgba(595959aa)",
        },
        groupbar = {
            height              = 22,
            font_size           = 12,
            font_family         = "Iosevka Nerd Font",
            indicator_height    = 0,
            indicator_gap       = 0,
            gaps_in             = 2,
            gaps_out            = 0,
            gradients           = true,
            rounding            = 0,
            gradient_rounding   = 0,
            text_color          = "rgb(ffffff)",
            text_color_inactive = "rgba(ccccccaa)",
            col                 = {
                active   = "rgba(33ccffcc)",
                inactive = "rgba(303030cc)",
            },
        },
    },
})
