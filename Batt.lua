function onBackupEeprom(address,err)
screen.print(10,5,"Saving address : "..address.."  Errors: "..err,0.7)
screen.flip()
end

while true do
buttons.read()
if img then img:blittint(0,0,color.blue) end

	screen.print(12,20,"Press L/R Backup/Restore Eeprom to ms0:/eeprom.bin: "..tostring(back),0.6)
	screen.print(12,35,"Battery "..tostring(batt.exists()),0.6)
	screen.print(170,35,"Press Triangle Battery to NORMAL "..tostring(res),0.6)
	screen.print(170,50,"Press X Battery to PANDORA "..tostring(res),0.6)
	screen.print(170,65,"Press O Battery to AUTOBOOT "..tostring(res),0.6)
	screen.print(12,50,"Battery Cargando: "..tostring(batt.charging()),0.6)
	screen.print(12,65,"Battery: "..batt.lifepercent().." %",0.6)
	screen.print(12,80,"Battery (minutos): "..batt.lifetimemin(),0.6)
	screen.print(12,95,"Battery (hr:min): "..batt.lifetime(),0.6)
	screen.print(12,110,"Battery Temp °C: "..batt.temp(),0.6)
	screen.print(12,125,"Battery Volts: "..batt.volt(),0.6)
	screen.print(12,140,"Battery Remain Capacity : "..batt.remaincap(),0.6)
	screen.print(12,155,"Battery Full Capacity: "..batt.fullcap(),0.6)
	screen.print(12,170,"Battery Baja: "..tostring(batt.low()),0.6)
	screen.print(12,185,"Battery Serial: "..batt.serial(),0.6)
	screen.print(12,200,"Battery Modo: "..batt.mode(),0.6)

	if buttons.l then back = batt.backup("ms0:/eeprom.bin") end
	if buttons.r then back = batt.restore("ms0:/eeprom.bin") end

	if buttons.triangle then res = batt.tonormal() end
	if buttons.cross then res = batt.topandora() end
	if buttons.circle then res = batt.toautoboot() end

	screen.print(15,240,"Press START to return ")
	if buttons.start then dofile("script.lua") end

screen.flip()
end