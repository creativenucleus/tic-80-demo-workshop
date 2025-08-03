local T=0
local SIN=math.sin
local COS=math.cos
local ATAN2=math.atan2
local POLAR={}

function R(a,b,r)
	return COS(r)*a-SIN(r)*b, SIN(r)*a+COS(r)*b
end

function BOOT()
	cls()
	drawLogo(120,68,30)
	POLAR=toPolar()
end

function BDR(y)
	vbank(0)
	for i=1,15 do
		local r=i/15*255
		local g=127+SIN(y*.03-T*.03)*127
		local b=255-(i/15*255)
		rgb(i,r,g,b)
	end
end

function TIC()
	poke(0x3ffb,0)
	vbank(0)
	local zoom=1.1+SIN(T*.01)*.8
	local spin=COS(T*.04)*2+COS(T*.03)*2
	plotPolar(POLAR,spin,zoom)

	vbank(1)
	local txt="Peckham Digital"
	local x,y=40,115
	print(txt,x-1,y-1,14,false,2)
	print(txt,x+1,y+1,13,false,2)
	print(txt,x,y,12,false,2)
	T=T+1
end

function drawLogo(xc,yc,sc)
	local coR=sc
	local ciR=sc*.5
	circ(xc,yc,coR,12)
	circ(xc,yc,ciR,0)
	local barW=sc*.6
	local barH=sc*2.75
	rect(xc-coR-barW,yc-sc,barW,barH,12)
	rect(xc+coR,yc-barH+sc,barW,barH,12)
end

function toPolar()
	local o={} 
	for dx=-120,119 do
		for dy=-68,67 do
			o[#o+1]={
				a=ATAN2(dy,dx),
				d=(dx^2+dy^2)^.5,
				c=pix(120+dx,68+dy)
			}
		end
	end
	return o
end

function plotPolar(o,spin,zoom)
	for i=1,#o do
		local p=o[i]
		local d=p.d*zoom
		local x=COS(p.a)*d
		local y=SIN(p.a)*d
		local spinP=spin+p.d*SIN(T*.01)*.1
		x,y=R(x,y,spinP)
		local c=(p.c>0) and p.d/5 or 0
		pix(120+x,68+y,c)
	end
end

function rgb(i,r,g,b)
	local a=16320+i*3
	poke(a,r)
	poke(a+1,g)
	poke(a+2,b)
end

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

