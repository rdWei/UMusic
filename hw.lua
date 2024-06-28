mje1=hw.region()
mje2=hw.getmodel()
mje3=hw.gen()
mje4=hw.pandora()
mje5=hw.board()
mje6=hw.nand()

mut="none"
while true do
buttons.read()
if img then img:blittint(0,0,color.yellow) end

screen.print(12,20,"Bayron : "..hw.baryon(),0.6)
screen.print(12,35,"Tachyon : "..hw.tachyon(),0.6)
screen.print(12,50,"Pommel : "..hw.pommel(),0.6)
screen.print(12,65,"Fuseid : "..hw.fuseid(),0.6)
screen.print(12,80,"Fusecfg : "..hw.fusecfg(),0.6)
screen.print(12,95,"Kirk : "..hw.kirk(),0.6)
screen.print(12,110,"Spock : "..hw.spock(),0.6)
screen.print(12,125,"Nand Seed (scramble): "..hw.nandseed(),0.6)
screen.print(12,140,"OFW initial : "..hw.ofwinitial(),0.6)

screen.print(12,155,"Region : "..tostring(mje1),0.6)
screen.print(12,170,"Modelo : "..tostring(mje2),0.6)
screen.print(12,185,"Gen PSP : "..tostring(mje3),0.6)
screen.print(12,200,"Make Pandora : "..tostring(mje4),0.6)
screen.print(12,215,"Board : "..tostring(mje5),0.6)
screen.print(12,230,"Size NAND : "..tostring(mje6),0.6)

screen.print(230,20,"Vol : "..hw.volume(),0.6)
screen.print(230,35,"Mute : "..hw.mute().." SetMute: "..mut,0.6)

screen.print(230,50,"Headphone : "..hw.headphone(),0.6)
screen.print(230,65,"Audio Out : "..hw.audioout(1),0.6)--0 Headphones /1 Speakers
screen.print(230,80,"Led : "..hw.led(2,0),0.6)

screen.print(230,240,"Press X set to MUTE",0.6)
if buttons.cross then mut=hw.mute(1) end
 
screen.print(12,248,"Press START to return ")
if buttons.start then dofile("script.lua") end

screen.flip()
end
