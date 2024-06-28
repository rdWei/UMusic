savedata,mje,status,result="","","",""
datos= "Soy tus datos guradados :D"

while true do
buttons.read()
if img then	img:blittint(0,0,color.violet) end

screen.print(15,15,"Savedata: "..tostring(savedata))
screen.print(15,30,"Datos guardados: "..tostring(mje))
screen.print(15,45,"Presiona X para usar la funcion data.save()")
screen.print(15,60,"Presiona O para usar la funcion data.load()")
screen.print(15,75,"Presiona Triangulo para usar la funcion data.delete()")

if buttons.cross then
	savedata = data.save(datos,"OneLua","ONELUA","Savedata Titulo","Datos Guardados por ONElua",0,"ICONOS/")
elseif buttons.circle then
	mje = data.load("ONELUA",0)--1 autoload
elseif buttons.triangle then
	savedata = data.delete("ONELUA")
	mje=""
end

screen.print(15,240,"Return to SCRIPT press START")
if buttons.start then dofile("script.lua") end

screen.flip()
end
