local SIN=math.sin
local ATAN2=math.atan2
local PI=math.pi
local TAU=PI*2
T=0

function TIC()
	for y=0,135 do
		for x=0,239 do
			local dx=x-120
			local dy=y-68
			local a=ATAN2(dy,dx)
			local d=(dx^2+dy^2)^.5
			local c=8+SIN(a-T*.1+d)*7
			pix(x,y,c)
		end
	end

	local text="jtruk"
	local x=200
	local y=124
	print(text,x+1,y+1,2)
	print(text,x,y,12)

	T=T+1
end

function BDR(y)
	local t=T
	for i=1,15 do
		local a=0x3fc0+i*3
		local r=128+math.sin(y/100+i*.1+t/30)*127
		local g=128+math.sin(1+y/113+i*.12+t/31)*127
		local b=128+math.sin(2+y/126+i*.13+t/32)*127
		poke(a,r)
		poke(a+1,g)
		poke(a+2,b)
	end
end

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

