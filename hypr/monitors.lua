-- Laptop display
hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "0x0",
    scale    = "1",
})

-- Auto-detect any additional monitors (right of primary)
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto-right",
    scale    = "auto",
})

-- Re-apply config on hotplug
hl.on("monitor.added", function(data)
    hl.monitor({
        output   = data.name,
        mode     = "preferred",
        position = "auto-right",
        scale    = "auto",
    })
end)
