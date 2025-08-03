# Drawing in TIC-80, using the Lua language

This a short tutorial to introduce some basics. It is designed to give a nice shape for a workshop (30-90 minutes, depending on capability and how much you'd like to play around) or something to follow for a basic self-start.

It covers:
- The structure of a program.
- Running a program.
- Built-in functions.
- The basic shapes you can draw with TIC-80.
- The colour palette.
- Some control structures (`if` statements and `for` loops).
- User-defined functions.
- Time and basic animation.
- Modulo (`%`)
- Sine and Cosine functions.

It may be helpful to first read about [the capabilities of TIC-80](../about-tic-80.md) and how to [install and customise it](../setup-tic-80.md)

## Comments

We'll sprinkle some comments in the code to signpost or explain bits of the functionality.

Comments start with two minus signs (`--`). TIC-80 will print them in a different colour (by default: dark grey)

```lua
-- Comments look like this

-- You might like to run your comments over a few lines if they'd
-- otherwise run off the width of the screen
```

You can choose to add your own comments, or remove the ones I've written, without affecting how the program runs.

There's an art to knowing when to comment - too much commenting can confuse the code, but there should be enough so that someone new (or yourself in a year's time) can quickly understand what it does or any unusual-looking decisions. As a short-hand rule, don't comment any code that explains itself.

## The editor window

xxx Run the default code
xxx Clear the default code
xxx Other tools (if you accidentally switch)

## Errors and the minimum viable program

TIC-80 will check whether some specific functions are defined in your code and handle them specially. The only one that's necessary is `TIC`. This must be spelt exactly, and written in capitals.

Without this function (or if you've misspelt it), running the program will give you a little unhappy error.

Try this so that you can become familiar with errors! They look a bit confusing, but most of the time they give clues as to how to investigate and solve them.

The important thing is not to be anxious about errors in TIC-80. They just tell you that something isn't right and that your program had to stop running. They may look angry but they're actually helpful!

`'function TIC()...' isn't found :(`

```lua
function TIC()
end
```

## Built in functions and indenting for your sanity

It's sometimes a bit unexpected for people, but the way you layout your code is very important, so that you can get visual clues as to how bits of the code are grouped together.

You can use spaces or tabs. (xxx)

For example, code within a function is indented by one space.
Code within a control structure (an `if` or a `for` - we'll come on to these - is indented by one space)

Comments should also be indented so that they neatly match the code they reference. You'll develop your own style for this.

```lua
function TIC()
	cls()
end
```

```lua
function TIC()
	cls(11)
end
```

## Drawing something

The screen is 240 pixels wide by 136 pixels high. (Pixels = "picture element" - it's a grid of coloured dots that makes the image)

## Draw order

The program runs sequentially in the TIC function. Whatever you tell it to do higher up will be done first - You can define functions wherever you like, but they won't be executed until you call them. 

## Nested functions

## The full scene

```lua
local T=0

function TIC()
	-- Clear screen, and sky background
	cls(11)

	-- Some clouds
	for i=1,4 do
		local x=(-T*.6+i*60)%240
		local y=20+i*5 
		drawCloud(x,y)
	end
	
	-- A chatty sun
	local x=T%240
	local y=30+math.sin(T*.1)*10
	drawSun(x,y) 

	-- Ground
	rect(0,80,240,60,14)

	-- Trees
	for x=10,240,20 do
		trib(x,65,x-5,85,x+5,85,5)
	end

	-- House
	rect(50,50,100,50,13)

	-- Roof
	tri(40,50,160,50,100,20,1)

	-- Fence
	for x=5,240,10 do
		if x<180 or x>210 then
			line(x,90,x,110,12)
		end
	end

	-- Gate
	line(180,90,210,110,12)
	
	-- Sign it!
	print("JTRUK",210,129,12)
	
	T=T+1
end

function drawSun(x,y)
	circ(x,y,15,4)

	local eyeY=y-3
	drawEye(x-6,eyeY)
	drawEye(x+6,eyeY)

	local mouthH=3+math.sin(T*.2)*2
	ellib(x,y+8,8,mouthH,2)
end

function drawEye(x,y)
	circ(x,y,5,12)
	circ(x,y,3,0)
end

function drawCloud(x,y)
	elli(x,y,20,8,12)
end
```

![An animation of the house scene](drawing/house-scene.gif)

## Loading and saving

folder

gif

xxx