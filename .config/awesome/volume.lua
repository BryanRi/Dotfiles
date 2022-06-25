-- https://web.archive.org/web/20130928001745/http://awesome.naquadah.org/wiki/Volume_control_and_display
local wibox = require("wibox")
local awful = require("awful")
 
volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")
 
function update_volume(widget)
   local fd = io.popen("amixer -D pulse get Master")
   local status = fd:read("*all")
   fd:close()
 
   -- local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
   local volume = string.match(status, "(%d?%d?%d)%%")
   volume = string.format("% 3d", volume)
 
   status = string.match(status, "%[(o[^%]]*)%]")

   if string.find(status, "on", 1, true) then
       -- For the volume numbers
       volume = "🔉" .. volume .. "%"
   else
       -- For the mute button
       volume = "🔇" .. volume .. "M"
       
   end
   widget:set_markup(volume)
end
 
update_volume(volume_widget)
 
-- timer now updates on keypress, see rc.lua (Audio buttons)
