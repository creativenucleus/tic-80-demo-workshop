# Intro

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

## Primitives and structures

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

## Sin/Cos

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

- (https://demozoo.org/productions/130155/)[Intrinsic Gravity / ^Still]
	Geometric, colour play.
- (https://demozoo.org/productions/2/)[State of the Art / ^Spaceballs)
	- 1992 Amiga. Photosensitivity warning.
- (https://demozoo.org/productions/202831/)[Eon / ^The Black Lotus]
- (https://demozoo.org/productions/277304/)[VX2 / ^Spectrals]
- (https://demozoo.org/productions/67521/)[ix / ^Moppi]
- (https://demozoo.org/productions/342211/)[Remnants / ^Alcatraz]
	- 256b
- (https://demozoo.org/productions/342223/)[GhostNOP / ^Futurs' and ^Pulpo Corrosivo]
	- Amstrad CPC
- (https://demozoo.org/productions/342435/)[Empires / ^Conspiracy]
	- Bokeh / fluid / FOV.
- (https://demozoo.org/productions/327586/)[Legend of Sisyphus / ^ASD]
	- Mocap. Nudity.
- (https://demozoo.org/productions/316180/)[Batman Rises / ^Batman Group]
	- Amiga OCS
- (https://demozoo.org/productions/322662/)[Mechasm / ^Fairlight]
- (https://demozoo.org/productions/322396/)[In Color / ^Darklite and ^Offence]
	- Spectrum 128k
- (https://demozoo.org/productions/325859/)[Replay / ^SMFX]
	 - Atari ST
- (https://demozoo.org/productions/322661/)[The Interloper / ^MFX]
- (https://demozoo.org/productions/4910/)[Masagin / ^Farbrausch and ^Neuro]
- (https://demozoo.org/productions/313312/)[Come Together / ^Melon Dezign]