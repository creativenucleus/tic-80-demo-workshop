T=0

function TIC()
    for y=0,135 do
        for x=0,239 do
            local c=math.sin(y/19+x/15)+math.sin(x/40+T/12)
            c=c+math.cos(x/12+y/21)+math.sin(y/10+T/10)
            c=c+math.sin(T/100)^2
            c=1+(14*c)
            pix(x,y,c)
        end
    end
  
    T=T+1
end

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

