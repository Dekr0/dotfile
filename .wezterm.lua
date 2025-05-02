local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font_size = 24.0

local scheme = wezterm.get_builtin_color_schemes()['zenbones_dark']
scheme.background = '#1c1917'
config.color_schemes = {
    ['zenbones_dark'] = scheme
}
config.color_scheme = 'zenbones_dark'

config.font = wezterm.font_with_fallback {
    'Iosevka',
    italic = false,
    enable_bold = false,
}

config.font_rules = {
    {
        intensity = 'Bold',
        italic = false,
        font = wezterm.font_with_fallback {
            'Iosevka',
            italic = false,
            stretch = 'Normal',
            weight = 'Regular',
        }
    },
    {
        intensity = 'Bold',
        italic = false,
        font = wezterm.font_with_fallback {
            'Iosevka',
            italic = false,
            stretch = 'Normal',
            weight = 'Regular',
        }
    }
}

config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.colors = {
    tab_bar = {
        background = 'rgba(0, 0, 0, 0)'
    }
}

config.key_map_preference = 'Physical'
config.keys = {
    { key = '1', mods = 'CTRL', action = wezterm.action.ActivateTab(0) },
    { key = '2', mods = 'CTRL', action = wezterm.action.ActivateTab(1) },
    { key = '3', mods = 'CTRL', action = wezterm.action.ActivateTab(2) },
    { key = '4', mods = 'CTRL', action = wezterm.action.ActivateTab(3) },
    { key = '5', mods = 'CTRL', action = wezterm.action.ActivateTab(4) },
    { key = '6', mods = 'CTRL', action = wezterm.action.ActivateTab(5) },
    { key = '7', mods = 'CTRL', action = wezterm.action.ActivateTab(6) },
    { key = '8', mods = 'CTRL', action = wezterm.action.ActivateTab(7) },
    { key = '9', mods = 'CTRL', action = wezterm.action.ActivateTab(8) },
    { key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTabRelative(1)  },
    { key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
    { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentTab { confirm = false } },
    {
        key = 'f',
        mods = 'CTRL|ALT',
        action = wezterm.action.SpawnCommandInNewTab {
            args = { 'shutil', '--wezterm_activate_tab' },
        }
    },
    {
        key = 'n',
        mods = 'CTRL|ALT',
        action = wezterm.action.SpawnCommandInNewTab {
            args = { 'shutil', '--wezterm_new_tab' }
        }
    },
    {
        key = 's',
        mods = 'CTRL|ALT',
        action = wezterm.action.SpawnCommandInNewTab {
            args = { 'shutil', '--wezterm_new_sessions' }
        }
    },
    {
        key = 'p',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ShowLauncher
    },
    {
        key = 's',
        mods = 'CTRL|ALT|SHIFT',
        action = wezterm.action.SpawnCommandInNewTab {
            args = { 'shutil', '--wezterm_create_session_profile' }
        }
    },
    { 
        key = 't', 
        mods = 'CTRL|ALT|SHIFT',
        action = wezterm.action.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end)
        }
    }
}

config.launch_menu = {
    {
        args = { 'shutil', '--wezterm_activate_tab' },
    },
}

config.max_fps = 144

config.enable_scroll_bar = false

config.window_decorations = 'NONE'
config.window_padding = {
    top = 1,
    left = 1,
    right = 1,
    bottom = 1,
}

return config
