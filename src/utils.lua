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
*       CIRCLE = PAUSE               *
*       CROSS = SELECT               *
*       UP = MOVE UP                 *
*       DOWN = MOVE DOWN             *
*       L = SCREEN OFF               *
*       R = SCREEN ON                *
*       WLAN SWITCH -> = LOOP ON     *
*       WLAN SWITCH <- = LOOP OFF    *
*                                    *
**************************************

]]

function readSongsFromFolder(songsList)

end

-- Remove .mp3 from file name
function removeExtention(file_name)
  return string.gsub(file_name, ".mp3", "")
end

function checkForSongs()

  if #files.listfiles(__SONGS_DIR) == 0 then
    os.message("No music found, please add music to songs folder.")
    os.exit()
  end
end

return {
  checkForSongs = checkForSongs,
  removeExtention = removeExtention
}
