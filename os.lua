while true do
buttons.read()
if img then img:blittint(0,0,color.green) end

infoef0=os.infoef0()
infoms0=os.infoms0()

screen.print(35,20,"CFW : "..os.cfw(),0.6)
screen.print(250,20,"Work path : "..files.cdir(),0.6)
screen.print(35,35,"Nick : "..os.nick())
screen.print(250,35,"Password : "..os.password(),0.6)
screen.print(35,50,"Language : "..os.language())
screen.print(250,50,"CableTV "..os.cabletv(),0.6)
screen.print(35,65,"MAC : "..os.mac(),0.6)

if type(infoef0) == "number" then
screen.print(35,80,"ef0 : "..infoef0,0.6)
else
screen.print(35,80,"ef0 Total : "..infoef0.max,0.6)
screen.print(35,95,"ef0 Free : "..infoef0.free,0.6)
screen.print(35,110,"ef0 Used : "..infoef0.used,0.6)
end

if type(infoms0) == "number" then
screen.print(35,125,"ms0 : "..infoms0,0.6)
else
screen.print(35,125,"MS Total : "..infoms0.max,0.6)
screen.print(35,140,"MS Free : "..infoms0.free,0.6)
screen.print(35,155,"MS Used : "..infoms0.used,0.6)
end

screen.print(35,170,"Date : "..os.getdate(),0.6)
screen.print(35,185,"CPU/BUS : "..os.cpu().."/"..os.bus(),0.6)

screen.print(35,200,"RAM: "..os.ram().."    Total "..os.totalram(),0.6)
screen.print(12,220,"Press [] Reset HB / Press O back to XMB",0.6)

if buttons.square then os.restart() end
if buttons.circle then os.exit() end

screen.print(15,240,"Press START to return ") 
if buttons.start then dofile("script.lua") end

screen.flip()
end
