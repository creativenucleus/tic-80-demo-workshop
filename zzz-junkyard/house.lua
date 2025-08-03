function TIC()
	cls(11)

	grassY=90

	t=time()/600
	x=120+math.sin(-t)*100
	y=grassY+20+math.cos(t)*80

	drawSun(x,y)

	rect(0,grassY,240,136-grassY,6)
	rect(80,40,80,60,3)
	tri(70,40,170,40,120,10,1)

	for x=0,240,6 do
	 if x<140 or x>160 then
			line(x,80,x,110,1)
		end
	end
	line(140,80,160,110,2)

 text="jtruk made this"
 x=80+math.sin(t)*60
 y=125
	print(text,x+1,y+1,0)
	print(text,x,y,12)
end

function drawSun(x,y)
	circ(x,y,22,4)
	circ(x,y,20,12)
end

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

