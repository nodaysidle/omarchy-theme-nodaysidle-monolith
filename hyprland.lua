-- nodaysidle Monolith — Hyprland Configuration (Lua)
-- Brutalist Stealth Monochrome & High-Contrast Chalk White

local active_border_color = {
  colors = {
    "rgb(ffffff)", -- Pure Bone White
    "rgb(ededed)", -- Chalk White
    "rgb(888890)", -- Graphite Transition
    "rgb(222226)", -- Slate Drop
  },
  angle = 110,
}

local inactive_border_color = {
  colors = {
    "rgb(222429)", -- Darkened Charcoal Weave
    "rgb(050505)", -- Onyx Ground
  },
  angle = 90,
}

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
    gaps_in = 6,
    gaps_out = { top = 4, right = 10, bottom = 10, left = 10 },
    border_size = 2,
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
      border_locked_active = active_border_color,
      border_locked_inactive = inactive_border_color,
    },

    groupbar = {
      col = {
        active = "rgba(255, 255, 255, 0.20)",
        inactive = "rgba(5, 5, 5, 0.85)",
      },
      text_color = "rgb(ededed)",
      text_color_inactive = "rgba(136, 136, 144, 0.60)",
      blur = true,
      gradient_rounding = 6,
    },
  },

  decoration = {
    rounding = 10,
    rounding_power = 2.8,

    active_opacity = 0.98,
    inactive_opacity = 0.72, -- Strong contrast between active and background windows

    dim_inactive = true,
    dim_strength = 0.25,
    dim_special = 0.35,

    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      noise = 0.02,
      contrast = 1.0,
      brightness = 0.90,
      vibrancy = 0.05,
      new_optimizations = true,
    },

    shadow = {
      enabled = true,
      range = 16,
      render_power = 2,
      color = "rgba(0, 0, 0, 0.70)",
    },
  },
})

-- Monolith Snappy Snapping Curve
hl.curve("monolithSnap", { type = "bezier", points = { { 0.12, 0.98 }, { 0.25, 1.00 } } })

hl.animation({ leaf = "borderangle", enabled = false })
hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 3.0,
  bezier = "monolithSnap",
})

hl.animation({ leaf = "layersIn", enabled = true, speed = 2.4, bezier = "monolithSnap", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.8, bezier = "monolithSnap", style = "fade" })

o.window({ tag = "terminal" }, { tag = "-default-opacity", opacity = "0.98 0.75" })
o.window({ tag = "default-opacity" }, { opacity = "0.98 0.75" })
o.window({ class = "com.mitchellh.ghostty" }, { opacity = "0.98 0.75" })
o.window({ title = "^Herdr.*" }, { opacity = "0.98 0.75" })

hl.layer_rule({ match = { namespace = "^(omarchy-bar|omarchy-notifications|omarchy-osd|omarchy-reminders)$" }, blur = true })
