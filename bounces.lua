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

-- <TILES>
-- 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

