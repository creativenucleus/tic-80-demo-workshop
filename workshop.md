# Workshop Schedule

## Intro

- Make sure everyone has a running version of TIC-80 (part way down [tic-80 Create page](https://tic80.com/create))
- Anyone susceptible to photosensitity
- Outline of workshop
    - Become familiar with TIC-80
        - Drawing primitives
        - sin/cos
        - poke palette
        - full screen effect
	- History of the demoscene
    - Showcasing some demoscene things
    - Jumping off points
- Level of programming experience (above 7 / below 3)
- Anyone know about the demoscene?

## Switch Dev mode on

If Dev mode is off (the default), when you hit ESC, you're taken to a menu. When dev mode is off, it takes you back into the command line, or editor.

- Run a program (Ctrl-R)
- Hit ESC to break program
- Select (options) in menu
- Move up to 'Dev Mode' and switch it on.
- Select Back
- Press Esc

## Learning Stuff

### Primitives and structures

`cls, rect, tri, circ, line, elli, pix, print`
(rectb, trib, circb, ellib)

`function, for, var, if`

```lua
function TIC()
    T=time()/500

	cls(8)

    for i=0,30 do
        x=(i^7)%240
        y=(i^5)%68
        pix(x,y,12)
    end

	circ(	
		120+math.sin(T)*100,
		90-math.cos(T)*80,
		20,
		4)

	rect(0,68,240,68,6)

	rect(50,40,80,60,2)
	tri(40,40, 90,10, 140,40, 1)
	
	for x=10,230,10 do
        if x<150 or x>=180 then
            drawPicket(x)
        end
	end			
end

function drawPicket(x)
	line(x,90, x,110, 12)
end
```

### Sin/Cos

```lua
local ATAN2=math.atan2
local PI=math.pi
local TAU=PI*2
local SIN=math.sin

function TIC()
	T=time()

 	for y=0,135 do
		for x=0,239 do
			local p=y*240+x
			local dx=120-x
			local dy=68-y
			local d=(dx^2+dy^2)^.5
			local a=(ATAN2(dy,dx)+PI)/TAU
			poke4(p,a*16+T*.001)
		 end
 	end
end
```

