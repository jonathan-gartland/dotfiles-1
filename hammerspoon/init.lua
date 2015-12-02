
-- TODO:
-- 1) Done - Use Spectacle's keyboard shortcuts
-- 2) DONE - Add shortcuts for play, pause, step for iTunes
-- 3) Move FireFox to second monitor using hs.application.watcher
-- 4) start_iterm() will fail with an error if iTerm isn't running.
-- 5) Keyboard shortcut to kill all Firefox instances
-- 6) Add keybinding to switch between audiodevices.  Use hs.audiodevice.allOutputDevices() to get all output devices.

-- Set up hotkey combinations
local ctrl_opt_shift = {"ctrl", "alt", "shift"}
local opt_cmd_ctrl = { "alt", "cmd", "ctrl"}
local cmd_opt_shift = {"cmd", "alt", "shift"}

-- Set grid size
hs.grid.GRIDWIDTH  = 12
hs.grid.GRIDHEIGHT = 12
hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0

-- Set window animation off. It's much smoother
hs.window.animationDuration = 0

-- Set volume increments
local volumeIncrement = 5

function toggle_muted()
    local output_device = hs.audiodevice.defaultOutputDevice()
    local is_muted = output_device:muted()
    output_device:setMuted(not is_muted)

    is_muted = output_device:muted()
    if is_muted then
        hs.alert.show("Muted")
    else
        hs.alert.show("Unmuted")
    end
end

function set_volume(vol_delta)
    local output_device = hs.audiodevice.defaultOutputDevice()
    local current_volume = hs.audiodevice.current().volume

    -- hs.alert.show('vol_delta ' .. vol_delta)
    -- hs.alert.show('current_vol ' .. current_volume)

    -- extra_vol_delta = volumeIncrement - (current_volume % volumeIncrement)
    -- hs.alert.show("extra_vol_delta " .. extra_vol_delta, 1)

    new_volume = current_volume + vol_delta
    -- hs.alert.show("new_volume " .. new_volume, 1)

    -- new_volume = current_volume + vol_delta
    -- hs.alert.show("2new_volume " .. new_volume, 1)

    -- local new_volume = current_volume + (volumeIncrement - (current_volume % volumeIncrement)) + vol_delta;
    -- hs.alert.show("new_volume " .. new_volume, 1)

    output_device:setVolume(new_volume)
    -- hs.alert.show("Volume: " .. output_device:volume(), 1)
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

function inspect(label, var)
    -- print(label .. ": " .. hs.inspect(var))
end

function _move_window_right(f, max)
    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    inspect("f", f)
    return f
end

function _move_window_left(f, max)
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    inspect("f", f)
    return f
end

function _move_window_up(f, max)
    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2
    inspect("f", f)
    return f
end

function _move_window_down(f, max)
    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    inspect("f", f)
    return f
end

function move_window_within_grid(new_grid_fn)
    if hs.window.focusedWindow() then
        hs.grid.adjustFocusedWindow(new_grid_fn)
    else
        hs.alert.show("No active window")
    end
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

function itunes_action(itunes_action_fn, msg)

  is_playing1 = hs.itunes.isPlaying()
  itunes_action_fn()
  is_playing2 = hs.itunes.isPlaying()

  if msg == nil then
    if is_playing1 == true and is_playing2 == false then
      msg = 'Stop'
    elseif is_playing1 == false and is_playing2 == true then
      msg = 'Play'
    else
      msg = ''
    end
  else
    msg = ''
  end

  hs.alert.show(msg)

end

-- function _move_window_left(grid)
--     inspect("grid", grid)
--     return grid
-- end

-- function _move_window_right(grid)
--     inspect("grid", grid)
--     return grid
-- end

-- function _move_window_up(grid)
--     inspect("grid", grid)
--     return grid
-- end

-- function _move_window_down(grid)
--     inspect("grid", grid)
--     return grid
-- end


hs.hotkey.bind(opt_cmd_ctrl, 'return', function () start_iterm() end)

-- hs.hotkey.bind(ctrl_opt_shift, ';', function() hs.grid.snap(hs.window.focusedWindow()) end)
-- hs.hotkey.bind(ctrl_opt_shift, "'", function() hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap) end)

-- hs.hotkey.bind(opt_cmd_ctrl,      '=', function() hs.grid.adjustWidth(1)   end)
-- hs.hotkey.bind(opt_cmd_ctrl,      '-', function() hs.grid.adjustWidth(-1)  end)
-- hs.hotkey.bind(cmd_opt_shift, '=', function() hs.grid.adjustHeight(1)  end)
-- hs.hotkey.bind(cmd_opt_shift, '-', function() hs.grid.adjustHeight(-1) end)

hs.hotkey.bind(cmd_opt_shift, 'left',  function() hs.window.focusedWindow():focusWindowWest()  end)
hs.hotkey.bind(cmd_opt_shift, 'right', function() hs.window.focusedWindow():focusWindowEast()  end)
hs.hotkey.bind(cmd_opt_shift, 'up',    function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(cmd_opt_shift, 'down',  function() hs.window.focusedWindow():focusWindowSouth() end)

-- maximize window
hs.hotkey.bind(cmd_opt_shift, 'M', hs.grid.maximizeWindow)
-- move window to next screen
hs.hotkey.bind(cmd_opt_shift, 'N', hs.grid.pushWindowNextScreen)
-- move window to prev screen
hs.hotkey.bind(cmd_opt_shift, 'P', hs.grid.pushWindowPrevScreen)
-- move window left
-- hs.hotkey.bind(cmd_opt_shift, 'J', hs.grid.pushWindowLeft)
-- -- move window down
-- hs.hotkey.bind(cmd_opt_shift, 'K', hs.grid.pushWindowDown)
-- -- move window up
-- hs.hotkey.bind(cmd_opt_shift, 'L', hs.grid.pushWindowUp)
-- -- move window right
-- hs.hotkey.bind(cmd_opt_shift, ';', hs.grid.pushWindowRight)

hs.hotkey.bind(cmd_opt_shift, 'j', function() move_window_on_screen(_move_window_left) end)
hs.hotkey.bind(cmd_opt_shift, 'k', function() move_window_on_screen(_move_window_down) end)
hs.hotkey.bind(cmd_opt_shift, 'l', function() move_window_on_screen(_move_window_up) end)
hs.hotkey.bind(cmd_opt_shift, ';', function() move_window_on_screen(_move_window_right) end)

hs.hotkey.bind(opt_cmd_ctrl, 'U', hs.grid.resizeWindowTaller)
hs.hotkey.bind(opt_cmd_ctrl, 'O', hs.grid.resizeWindowWider)
hs.hotkey.bind(opt_cmd_ctrl, 'I', hs.grid.resizeWindowThinner)
hs.hotkey.bind(opt_cmd_ctrl, 'Y', hs.grid.resizeWindowShorter)
hs.hotkey.bind(opt_cmd_ctrl, 'L', function()
        hs.caffeinate.lockScreen()
        itunes_action(hs.itunes.playpause, nil)
    end)

-- audio related keybindings
hs.hotkey.bind(ctrl_opt_shift, 'space', hs.itunes.displayCurrentTrack)
hs.hotkey.bind(ctrl_opt_shift, 'P', function() itunes_action(hs.itunes.playpause, nil) end)
hs.hotkey.bind(ctrl_opt_shift, 'N', function() itunes_action(hs.itunes.next, 'Next') end)
hs.hotkey.bind(ctrl_opt_shift, 'I', function() itunes_action(hs.itunes.previous, 'Previous') end)

hs.hotkey.bind(ctrl_opt_shift, ']', function() set_volume( volumeIncrement ) end)
hs.hotkey.bind(ctrl_opt_shift, '[', function() set_volume( -1 * volumeIncrement ) end)
hs.hotkey.bind(ctrl_opt_shift, '\\', function() toggle_muted() end)

-- hs.hotkey.bind(ctrl_opt_shift, 'space', function() hs.spotify.displayCurrentTrack() end)
-- hs.hotkey.bind(ctrl_opt_shift, 'P', function() spotify(hs.itunes.play, itunes_stop_or_start) end)
-- hs.hotkey.bind(ctrl_opt_shift, 'N', function() spotify(hs.itunes.next, 'Next') end)
-- hs.hotkey.bind(ctrl_opt_shift, 'I', function() spotify(hs.itunes.previous, 'Previous') end)

-- rename to shift_focus
-- hs.hotkey.bind(cmd_opt_shift, 'j', function() move_focused_window(hs.window.focusWindowWest) end)
-- hs.hotkey.bind(cmd_opt_shift, 'k', function() move_focused_window(hs.window.focusWindowEast) end)
-- hs.hotkey.bind(cmd_opt_shift, 'l', function() move_focused_window(hs.window.focusWindowSouth) end)
-- hs.hotkey.bind(cmd_opt_shift, ';', function() move_focused_window(hs.window.focusWindowNorth) end)


-- hs.hotkey.bind(cmd_opt_shift, 'j', function() move_window_within_grid(_move_window_left) end)
-- hs.hotkey.bind(cmd_opt_shift, 'k', function() move_window_within_grid(_move_window_down) end)
-- hs.hotkey.bind(cmd_opt_shift, 'l', function() move_window_within_grid(_move_window_up) end)
-- hs.hotkey.bind(cmd_opt_shift, ';', function() move_window_within_grid(_move_window_right) end)

-- hs.hotkey.bind(opt_cmd_ctrl, 'z', function()

-- hs.mjomatic.go({
-- "CCCCCCCCCCCCCCCCCCCCCCCC",
-- "CCCCCCCCCCCCCCCCCCCCCCCC",
-- "SSSSSSSSSSSSSSSSSSSSSSSS",
-- "SSSSSSSSSSSSSSSSSSSSSSSS",
-- "",
-- "C Google Chrome",
-- "S Sublime Text 3"})

-- end)


function reload_config(files)
    hs.reload()
    hs.alert.show("Config loaded")
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/init.lua", reload_config):start()
hs.alert.show("Hammerspoon, at your service.", 3)

-- appwatcher = hs.application.watcher.new(function(name, event_type, app)
--     -- inspect("name", name)
--     -- inspect("event_type", event_type)
--     -- inspect("app", app)

--     if name == "Firefox" then
--         print("calling unhide, hide")
--         local pid = app:pid()
--         print(pid)
--         app:unhide()
--         app:hide()
--     end
-- end)
-- appwatcher:start()



function print_r ( t )
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end
