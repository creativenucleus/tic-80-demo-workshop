local SIN=math.sin
local COS=math.cos
local ABS=math.abs

T=0
function TIC()
	cls()
	for i=1,10 do
		local t=T*.1+i*.2
		drawSin(10,10,50,50,t,i)
		drawCos(70,10,50,50,t,i)
		drawSinCos(130,10,50,50,t,i)
		drawSinAbs(190,10,50,50,t,i)
		drawSin2Cos(10,80,50,50,t,i)
		drawSinYCosY(70,80,50,50,t,i)
	end
 
	T=T+1
end

function drawSin(x,y,w,h,t,c)
	local px=x+w/2
	local py=y+h/2+SIN(t)*h/2
	circ(px,py,3,c)
end

function drawCos(x,y,w,h,t,c)
	local px=x+w/2
	local py=y+h/2+COS(t)*h/2
	circ(px,py,3,c)
end

function drawSinCos(x,y,w,h,t,c)
	local px=x+w/2+SIN(t)*w/2
	local py=y+h/2+COS(t)*h/2
	circ(px,py,3,c)
end

function drawSinAbs(x,y,w,h,t,c)
	local px=x+w/2
	local py=y+h-ABS(COS(t)*h)
	circ(px,py,3,c)
end

function drawSin2Cos(x,y,w,h,t,c)
	local px=x+w/2+SIN(t)*h/2
	local py=y+h/2-COS(t*2)*h/2
	circ(px,py,3,c)
end

function drawSinYCosY(x,y,w,h,t,c)
	local px=x+w/2
	local py=y+h/2+SIN(t)*w/4+SIN(t*2)*w/4
	circ(px,py,3,c)
end

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

