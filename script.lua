-- Made with <3 by rdWei
-- GitHub: https://github.com/rdWei

-- Import utils
local utils = require("src.utils")

-- Append all files in /songs folder
local songs = files.listfiles(__SONGS_DIR)

-- Load color plette
color.loadpalette()

-- Check if there are songs in /songs
checkForSongs()

-- Current song selected by Up / Down button
local current_selection = 1

-- Check if loop is active or not
local isLooping = false

-- Set the current song name to NONE
local current_songs_name = "NONE"

-- Load the first song in /songs dir, just to initialize song variable
song = sound.load(string.format("songs/%s", songs[1].name))

-- Declare pause var
local isPaused = false

local isStarted = false

local autoPlay = false

max = #songs

local min = 1

if #songs > 15 then
  max = 16
end

local oldmax = max

local isScreenOn = true

old_h_state = 0

-- Main  loop
while true do
  buttons.read()

  -- Check if screen is ON
  while not isScreenOn do
    buttons.read()
    if buttons.held.r then
      isScreenOn = true
    end
    -- Copy for play in background 
    if isStarted and not isPaused and not sound.playing(song) and autoPlay then
      if current_selection == #songs then
        current_selection = 0
      end
      current_selection = current_selection + 1
      song = sound.load(string.format("songs/%s", songs[current_selection].name))
      sound.vol(song, 100)
      sound.play(song, 1)
    end

    utils.sleep(1)
  end

  -- Clear screen whit black color
  screen.clear(color.black)

  -- Print battery percentage

  batt_perc = batt.lifepercent()


  screen.txtbgcolor(color.magenta)
  screen.txtcolor(color.white)
  screen.consolexy(50, 1)
  screen.consoleprint(string.format(":: BAT %s%s ::", batt_perc, "%"))
  utils.normal()

  -- Set position on top-left corner
  screen.consolexy(0, 0)

  -- Set color to normal [bg = black, txt = white]
  utils.normal()
  
  -- Print ascii art + version + help message
  screen.consoleprint(__ASCII_ART)
  
  -- Move to x = 1 and y = 9 and print current playing  song
  screen.consolexy(1, 9)
  screen.txtbgcolor(color.red)
  screen.txtcolor(color.white)
  screen.consoleprint(string.format(":: Now playng: %s ::", current_songs_name))

  -- Move to x = 1 and y = 11 and print if loop is on or off
  screen.consolexy(1, 11)
  screen.txtbgcolor(color.navy)
  screen.txtcolor(color.white)
  if isLooping then
    screen.consoleprint(":: LOOP: ON ::")
  else
    screen.consoleprint(":: LOOP: OFF ::")
  end

  -- Print if song is paused or not
  
  if isPaused then
    screen.consolexy(50, 7)
    screen.txtbgcolor(color.navy)
    screen.txtcolor(color.white)
    screen.consoleprint(":: SONG PAUSED ::")
  end

  -- Set color to normal and print 3 song
  utils.normal()

  local c = min
  local k = 1
  for i = min, max do
    
    -- Control Limit

    utils.normal()
    screen.consolexy(1, 13+k)
    if c == current_selection then
      screen.consoleprint("> ")
      utils.rev()
    else
      screen.consoleprint("  ")
      utils.normal()
    end
    screen.consoleprint(string.format("%s", songs[i].name))
    utils.normal()
    if i == current_selection then
      screen.consoleprint(" <")
    end
    k = k + 1
    c = c + 1
  end

  -- Print autoplay
  if autoPlay then
    screen.consolexy(18, 11)
    screen.txtcolor(color.white)  
    screen.txtbgcolor(color.navy)
    screen.consoleprint(":: AUTOPLAY: ON ::")
  else
    screen.consolexy(18, 11)
    screen.txtcolor(color.white)  
    screen.txtbgcolor(color.navy)
    screen.consoleprint(":: AUTOPLAY: OFF ::")
  end


  -- Event Handling


  if buttons.cross then
    isStarted = true
    help_message = false
    isPaused = false
    current_songs_name = removeExtention(songs[current_selection].name)
    everPlayed = true
    song = sound.load(string.format("songs/%s", songs[current_selection].name))
    sound.vol(song, 100)
    sound.play(song, 1)
  elseif buttons.l then
    isScreenOn = false
    help_message = false
    screen.display(0)
  elseif buttons.r then
    isScreenOn = true
    help_message = false
    screen.display(1)
  elseif buttons.up then
    help_message = false
    if current_selection < min + 1 and current_selection ~= 1 then
      max = max - 1
      min = min - 1
    end
    if current_selection ~= 1 then
      current_selection = current_selection - 1
    end
  elseif buttons.down then
    help_message = false

    if current_selection > max - 1 and current_selection ~= #songs then
      max = max + 1
      min = min + 1
    end

    if current_selection ~= #songs then
      current_selection = current_selection + 1
    end
  elseif buttons.circle then
    help_message = false
    sound.pause(song)
    isPaused = not isPaused
  elseif buttons.start then
    help_message = not help_message
  elseif buttons.square then
    if autoPlay then
      -- Print Warning
      autoPlay = false
    else
      if isLooping then
        screen.consolexy(0, 0)
        screen.txtcolor(color.black)
        screen.txtbgcolor(color.yellow)
        screen.consoleprint(__TOGGLE_LOOP_WARNING)
        screen.flip()
        utils.sleep(2)
      else
        autoPlay = true
      end
    end
  end


  if buttons.wlan then
    if not sound.looping(song) then
      sound.loop(song)
      isLooping = true
      autoPlay = false
    end
  elseif not buttons.wlan then
    if sound.looping(song) then
      sound.loop(song)
      isLooping = false
    end
  end

  -- Print if headphone are connected
  current_h_state = hw.headphone()
  screen.consolexy(50, 5)
  screen.txtcolor(color.white)
  screen.txtbgcolor(color.magenta)
  if current_h_state  == 1 then
    screen.consoleprint(":: HEADPHONE ::")
  else
    screen.consoleprint(":: STEREO ::")
  end

  -- Print Volume percentage
  vp = hw.volume()
  screen.consolexy(50, 3)
  screen.txtcolor(color.white)
  screen.txtbgcolor(color.magenta)
  if vp < 30 then 
    screen.consoleprint(string.format(":: VOL %s%s ::", vp, "%"))
  else
    screen.consoleprint(":: VOL MAX ::")
  end
  -- Print help message
  if help_message then
    screen.consolexy(0, 0)
    screen.txtcolor(color.black)  
    screen.txtbgcolor(color.yellow)
    screen.consoleprint(__HELP_MESSAGE)
  end


  -- Refresh screen
  screen.flip()

  if isStarted and not isPaused and not sound.playing(song) and autoPlay then
    if current_selection == #songs then
      current_selection = 0
    end
    current_selection = current_selection + 1
    song = sound.load(string.format("songs/%s", songs[current_selection].name))
    sound.vol(song, 100)
    sound.play(song, 1)
  end

end

