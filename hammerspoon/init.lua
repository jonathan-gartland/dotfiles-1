
-- TODO
-- 1) Use Spectacle's keyboard shortcuts
-- 2) Add shortcuts for play, pause, step for iTunes


-- Set up hotkey combinations
local ctril_opt_shift = {"ctrl", "alt", "shift"}
local opt_cmd_ctril = { "alt", "cmd", "ctrl"}
local cmd_opt_shift = {"cmd", "alt", "shift"}

-- Set grid size.
hs.grid.GRIDWIDTH  = 12
hs.grid.GRIDHEIGHT = 12
hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0

-- Set window animation off. It's much smoother.
hs.window.animationDuration = 0

-- Set volume increments
local volumeIncrement = 5

function toggle_muted()
    local output_device = hs.audiodevice.defaultOutputDevice()
    local is_muted = output_device:muted()
    output_device:setMuted(not is_muted)

    is_muted = output_device:muted()
    hs.alert.show("is_muted: " .. tostring(is_muted), 1)
end

function set_volume(vol_delta)
    local output_device = hs.audiodevice.defaultOutputDevice()
    local current_volume = hs.audiodevice.current().volume
    output_device:setVolume(current_volume + vol_delta)
    hs.alert.show("Volume: " .. output_device:volume(), 1)
end

function start_iterm()
    local iterm = hs.appfinder.appFromName("iTerm")
    iterm:selectMenuItem({"Shell", "New Window"})
    return iterm
end

function get_focused_window()
    if hs.window.focusedWindow() then
        return hs.window.focusedWindow()
    end
end

function win_full_screen(win)
    win:toggleFullScreen()
end

function win_toggle_maximize(win)
    win:maximize()
end

function move_focused_window(fn)
    print(fn)

    window = get_focused_window()

    if window == nil then
        hs.alert.show("No active window")
    else
        fn(window)
    end
end

hs.hotkey.bind(opt_cmd_ctril, 'return', function () start_iterm() end)

-- hs.hotkey.bind(ctril_opt_shift, ';', function() hs.grid.snap(hs.window.focusedWindow()) end)
-- hs.hotkey.bind(ctril_opt_shift, "'", function() hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap) end)

-- hs.hotkey.bind(opt_cmd_ctril,      '=', function() hs.grid.adjustWidth(1)   end)
-- hs.hotkey.bind(opt_cmd_ctril,      '-', function() hs.grid.adjustWidth(-1)  end)
-- hs.hotkey.bind(cmd_opt_shift, '=', function() hs.grid.adjustHeight(1)  end)
-- hs.hotkey.bind(cmd_opt_shift, '-', function() hs.grid.adjustHeight(-1) end)

-- hs.hotkey.bind(cmd_opt_shift, 'left',  function() hs.window.focusedWindow():focusWindowWest()  end)
-- hs.hotkey.bind(cmd_opt_shift, 'right', function() hs.window.focusedWindow():focusWindowEast()  end)
-- hs.hotkey.bind(cmd_opt_shift, 'up',    function() hs.window.focusedWindow():focusWindowNorth() end)
-- hs.hotkey.bind(cmd_opt_shift, 'down',  function() hs.window.focusedWindow():focusWindowSouth() end)

hs.hotkey.bind(opt_cmd_ctril, 'M', hs.grid.maximizeWindow)

-- move window to next screen
hs.hotkey.bind(opt_cmd_ctril, 'N', hs.grid.pushWindowNextScreen)

-- move window to prev screen
hs.hotkey.bind(opt_cmd_ctril, 'P', hs.grid.pushWindowPrevScreen)

-- move window left
-- hs.hotkey.bind(opt_cmd_ctril, 'J', hs.grid.pushWindowLeft)
-- move window down
-- hs.hotkey.bind(opt_cmd_ctril, 'K', hs.grid.pushWindowDown)
-- move window up
-- hs.hotkey.bind(opt_cmd_ctril, 'L', hs.grid.pushWindowUp)
-- move window right
-- hs.hotkey.bind(opt_cmd_ctril, ';', hs.grid.pushWindowRight)

hs.hotkey.bind(opt_cmd_ctril, 'U', hs.grid.resizeWindowTaller)
hs.hotkey.bind(opt_cmd_ctril, 'O', hs.grid.resizeWindowWider)
hs.hotkey.bind(opt_cmd_ctril, 'I', hs.grid.resizeWindowThinner)
hs.hotkey.bind(opt_cmd_ctril, 'Y', hs.grid.resizeWindowShorter)

hs.hotkey.bind(ctril_opt_shift, 'space', hs.itunes.displayCurrentTrack)
hs.hotkey.bind(ctril_opt_shift, 'P',     hs.itunes.play)
hs.hotkey.bind(ctril_opt_shift, 'O',     hs.itunes.pause)
hs.hotkey.bind(ctril_opt_shift, 'N',     hs.itunes.next)
hs.hotkey.bind(ctril_opt_shift, 'I',     hs.itunes.previous)

hs.hotkey.bind(cmd_opt_shift, ']', function() set_volume( volumeIncrement ) end)
hs.hotkey.bind(cmd_opt_shift, '[', function() set_volume( -1 * volumeIncrement ) end)
hs.hotkey.bind(cmd_opt_shift, '\\', function() toggle_muted() end)

-- hs.hotkey.bind(cmd_opt_shift, 'j', function() move_focused_window(hs.window.focusWindowWest) end)
-- hs.hotkey.bind(cmd_opt_shift, 'k', function() move_focused_window(hs.window.focusWindowEast) end)
-- hs.hotkey.bind(cmd_opt_shift, 'l', function() move_focused_window(hs.window.focusWindowSouth) end)
-- hs.hotkey.bind(cmd_opt_shift, ';', function() move_focused_window(hs.window.focusWindowNorth) end)


function _move_window_left(f, max)
    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    return f
end

function _move_window_right(f, max)
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    return f
end

function _move_window_up(f, max)
    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2
    return f
end

function _move_window_down(f, max)
    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    return f
end

function move_window_on_screen(new_frame_fn)
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()
        win:setFrame(new_frame_fn(f, max))
    else
        hs.alert.show("No active window")
    end
end

hs.hotkey.bind(opt_cmd_ctril, 'j', function() move_window_on_screen(_move_window_left) end)
hs.hotkey.bind(opt_cmd_ctril, 'k', function() move_window_on_screen(_move_window_down) end)
hs.hotkey.bind(opt_cmd_ctril, 'l', function() move_window_on_screen(_move_window_up) end)
hs.hotkey.bind(opt_cmd_ctril, ';', function() move_window_on_screen(_move_window_right) end)

function reload_config(files)
    hs.reload()
    hs.alert.show("Config loaded")
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Hammerspoon, at your service.", 3)
