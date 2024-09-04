local SIN,COS,PI=math.sin,math.cos,math.pi
local ATAN2=math.atan2
local TAU=PI*2
local MIN,MAX=math.min,math.max

local ANIM_MUL=0.01
local I_ANIM_MUL_MIN=1
local I_ANIM_MUL_MAX=8
local I_ANIM_MUL=2
local ANIM_T=0
local ANIM_D=50
local ANIM_X=70
local ANIM_Y=ANIM_D+10

local STAGES={
    {
        title="TARGET",
        func=function()
            drawTarget(true, false)
            drawHTick(ANIM_X, getAnimYPos(0))

            printValues(true, false, false)
        end,
        incT=false,
    },
    {
        title="SIN(y)",
        func=function()
            drawTarget(true, false)
            drawHTick(ANIM_X, getAnimYPos(ANIM_T))

            printValues(true, false, false)
        end,
        incT=true,
    },
    {
        title="SIN(y) with trail",
        func=function()
            drawTarget(true, false)
            drawHTrail(ANIM_T, MIN(ANIM_T,ANIM_X))
            drawHTick(ANIM_X, getAnimYPos(ANIM_T))

            printValues(true, false, false)
        end,
        incT=true,
    },
    {
        title="TARGET 2",
        func=function()
            drawTarget(true, true)
            local x = getAnimXPos(0)
            local y = getAnimYPos(0)
            drawVTick(x,y)

            printValues(false, true, false)
        end,
        incT=false,
    },
    {
        title="COS(x)",
        func=function()
            drawTarget(true, true)
            drawVTick(getAnimXPos(ANIM_T),ANIM_Y)

            printValues(false, true, false)
        end,
        incT=true,
    },
    {
        title="CIRCLE",
        func=function()
            drawTarget(true, true)
            drawHTick(ANIM_X,getAnimYPos(ANIM_T))
            drawVTick(getAnimXPos(ANIM_T),ANIM_Y)
            circb(getAnimXPos(ANIM_T),getAnimYPos(ANIM_T),8,12)

            printValues(true, true, false)
        end,
        incT=true,
    },
    {
        title="CIRCLE with trail",
        func=function()
            drawTarget(true, true)
            drawCircTrail(ANIM_T, MIN(ANIM_T,200))
            drawHTick(ANIM_X,getAnimYPos(ANIM_T))
            drawVTick(getAnimXPos(ANIM_T),ANIM_Y)
            circb(getAnimXPos(ANIM_T),getAnimYPos(ANIM_T),8,12)

            printValues(true, true, false)
        end,
        incT=true,
    },
    {
        title="ATAN2",
        func=function()
            drawTarget(true, true)
            drawHTick(ANIM_X,getAnimYPos(ANIM_T))
            drawVTick(getAnimXPos(ANIM_T),ANIM_Y)
            circb(getAnimXPos(ANIM_T),getAnimYPos(ANIM_T),8,12)

            printValues(true, true, true)
        end,
        incT=true,
    },
}

local ISTAGE=1

function TIC()
    cls()
    poke(0x3FFB,0) -- cursor begone

    if btnp(0) then -- up
        I_ANIM_MUL=MIN(I_ANIM_MUL+1,I_ANIM_MUL_MAX)
    elseif btnp(1) then -- down
        I_ANIM_MUL=MAX(I_ANIM_MUL-1,I_ANIM_MUL_MIN)
    end

    if btnp(3) then -- right
        ISTAGE=MIN(ISTAGE+1,#STAGES)
        ANIM_T=0
    elseif btnp(2) then -- left
        ISTAGE=MAX(ISTAGE-1,1)
        ANIM_T=0
    end

    local stage=STAGES[ISTAGE]
    stage.func()

    local text="<=   " .. stage.title .. "   =>"
    local w=print(text,0,150)
    print(text,120-w/2,128,14)

    print(I_ANIM_MUL .. "x", 210,128,14)

    if stage.incT then
        ANIM_T=ANIM_T+1
    end
end

function drawTarget(doHoriz, doVert)
    local hairD=5
    if doHoriz then
        local y0=ANIM_Y-ANIM_D
        local y1=ANIM_Y+ANIM_D
        line(ANIM_X-hairD,y0, ANIM_X+hairD,y0,2)
        line(ANIM_X-hairD,y1, ANIM_X+hairD,y1,2)
        line(ANIM_X,y0, ANIM_X,y1,2)

        print("-1", ANIM_X+10,y0-2,2)
        print("1", ANIM_X+10,y1-2,2)
    end

    if doVert then
        local x0=ANIM_X-ANIM_D
        local x1=ANIM_X+ANIM_D
        line(x0,ANIM_Y-hairD, x0,ANIM_Y+hairD,6)
        line(x1,ANIM_Y-hairD, x1,ANIM_Y+hairD,6)
        line(x0,ANIM_Y, x1,ANIM_Y,6)

        print("-1", x0-4, ANIM_Y+8, 6)
        print("1", x1-2, ANIM_Y+8, 6)
    end

    circ(ANIM_X,ANIM_Y,3,9)
    print("0",ANIM_X+10,ANIM_Y-2,9)
end

function drawHTrail(pos,d)
    for i=1,d do
        local x=ANIM_X-i
        local y=getAnimYPos(pos-i)
        circb(x,y,2,15)
    end
end

function drawCircTrail(pos,d)
    for i=1,d do
        local x=getAnimXPos(pos-i)
        local y=getAnimYPos(pos-i)
        circb(x,y,2,15)
    end
end

function getAnimMul()
    return ANIM_MUL*I_ANIM_MUL
end

function getAnimXPos(pos)
    return ANIM_X+COS(pos*getAnimMul())*ANIM_D
end

function getAnimYPos(pos)
    return ANIM_Y+SIN(pos*getAnimMul())*ANIM_D
end

function drawHTick(x,y)
    tri(x-5,y, x-8,y-3, x-8,y+3, 4)
    tri(x+5,y, x+8,y-3, x+8,y+3, 4)
end

function drawVTick(x,y)
    tri(x,y-5, x-3,y-8, x+3,y-8, 5)
    tri(x,y+5, x-3,y+8, x+3,y+8, 5)
end

function printValues(doPrintSin, doPrintCos, doPrintAtan2)
    local a=math.fmod(ANIM_T*getAnimMul(), TAU)
    local aUnit=a/TAU

    local px=140

    local str=string.format("angle: %.2f",a)
    print(str,px,10,12)

    if doPrintSin then
        local str=string.format("SIN(angle) = %.2f", SIN(a))
        print(str,px,30,12)
    end

    if doPrintCos then
        local str=string.format("COS(angle) = %.2f", COS(a))
        print(str,px,50,12)
    end

    if doPrintAtan2 then
        local str=string.format("ATAN2(sa,ca) = %.2f", ATAN2(SIN(a), COS(a)))
        print(str,px,70,12)
    end
end

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>
