-- utils.lua

-- Description: This file contains utility functions used throughout the project.
--              These include common operations like string manipulation, data formatting,
--              and other helper functions to facilitate code reuse.


__SONGS_DIR = "songs"

__ASCII_ART = [[
  _    _ __  __           _      
 | |  | |  \/  |         (_)     
 | |  | | \  / |_   _ ___ _  ___ 
 | |  | | |\/| | | | / __| |/ __|
 | |__| | |  | | |_| \__ \ | (__ 
  \____/|_|  |_|\__,_|___/_|\___| v0.1.0

 Press <START> for help.

]]

__HELP_MESSAGE = [[

************* HELP MESSAGE ***********
*                                    *
*   PAUSE         : CIRCLE           *
*   SELECT        : CROSS            *
*   MOVE UP       : UP               *
*   MOVE DOWN     : DOWN             *
*   SCREEN OFF    : L                *
*   SCREEN ON     : R                *
*   LOOP ON       : WLAN SWITCH ->   *
*   LOOP OFF      : WLAN SWITCH <-   *
*   SQUARE        : AUTOPLAY ON/OFF  *
*                                    *
**************************************

]]

__TOGGLE_LOOP_WARNING = [[
================================================
** DISABLE LOOP MODE BEFORE ENABLING AUTOPLAY **
================================================
]]

__H_CONNECTED = [[
%%%%%%%%%%%%%%%%%%%%%
%HEADPHONE CONNECTED%
%%%%%%%%%%%%%%%%%%%%%
]]

function readSongsFromFolder(songsList)

end

-- Remove .mp3 from file name
function removeExtention(file_name)
  return string.gsub(file_name, ".mp3", "")
end

function checkForSongs()

  if #files.listfiles(__SONGS_DIR) == 0 then
    os.message("No song found, please add at least one song in /songs folder")
    os.exit()
  end
end

local function sleep(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end

local function normal() 
  screen.txtbgcolor(color.black)
  screen.txtcolor(color.white)
end
local function rev() 
  screen.txtbgcolor(color.white)
  screen.txtcolor(color.black)
end

return {
  checkForSongs = checkForSongs,
  removeExtention = removeExtention,
  sleep = sleep,
  rev = rev,
  normal = normal
}
