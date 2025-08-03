# Drawing in TIC-80, using the Lua language

This a short tutorial to introduce some basics. It is designed to give a nice shape for a workshop (30-90 minutes, depending on capability and how much you'd like to play around) or something to follow for a basic self-start.

It covers:
- Comments in code.
- The structure of a program.
- Running a program.
- Built-in functions.
- The basic shapes you can draw with TIC-80.
- The colour palette.
- Some control structures (`if` statements and `for` loops).
- User-defined functions.
- Time and basic animation.
- Modulo (`%`)
- Using the sine function to animate over time.

It may be helpful to first read [about TIC-80](../about-tic-80.md) and how to [install and customise it](../setup-tic-80.md)

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

## The code editor window

When you first start TIC-80, you'll get a command line, and a suggestion to type 'help' (and press enter).

Press 'Esc` to switch to the Code Editor.

The Code Editor will contain some starter code, which will include:

```lua
function TIC()
```

### Run the default code

To run this code, press CTRL-R (or equivalent on your OS).

[Assuming you have configured Dev Mode](../setup-tic-80.md) you can press `ESC` to stop the program and switch back into the code editor.

You should get used to this flow. You'll be using it a lot! 

### Other editors

TIC-80 includes a few tools; for designing 2D graphics and sound. We won't be using this, but you can switch between them with the F2-F5 keys to take a look. Most importantly, F1 returns you to the code editor if you accidentally switch.

## Errors and the minimum viable program

### Clear the default code

You should remove the default example code. You can do this by selecting all (CTRL-A or your OS' equivalent) and pressing the `backspace` key

### Errors

TIC-80 will check whether some specific functions are defined in your code and handle them specially. The only one that's necessary is `TIC`. This must be spelt exactly, and written in capitals.

Without this function (or if you've misspelt it), running the program will give you a little unhappy error.

Try this so that you can become familiar with errors! They look a bit confusing, but most of the time they give clues as to how to investigate and solve them.

The important thing is not to be anxious about errors in TIC-80. They just tell you that something isn't right and that your program had to stop running. They may look angry but they're actually (supposed to be) helpful!

Trying to run without `TIC()` shows the following error:

`'function TIC()...' isn't found :(`

### Create the TIC function

Update the code in the editor to read:

```lua
function TIC()
end
```

If you run that program, it will look like nothing is happening, but your code is running - you haven't instructed TIC-80 to clear the screen, so it is still showing whatever was there before - the code in the Code Editor.

## Indenting (for your sanity) and Built-in functions

The way you layout your code is very important, so that you can get visual clues as to how bits of the code are grouped together.

Mostly, spacing doesn't matter to the computer in Lua - it's just for you.

We use newlines to try to keep one useful thing to each row of code, and spaces to line up grouped things in columns.

For the latter - horizontal spacing - You can use spaces or tabs. Tabs in TIC-80 are one space, so you won't see any difference between spaces and tabs, but you might do if you copy the code elsewhere, which is a bit annoying!

Coders develop their own styles and try to match them when working together. I'll suggest my style here, but you're welcome to use your own.

I indent code within a function by one space.

Code within a control structure (an `if` or a `for` - we'll come on to these - is also indented by one space)

Comments should be indented so that they neatly match, by column, the code they reference.

We'll start by clearing the screen, so modify the code to be:

```lua
function TIC()
	cls()
end
```

When you run that, the code from the code editor should be wiped from the screen. Pressing `ESC` will return you to the editor again. 

`cls` is one of TIC-80's built-in functions. You must provide the brackets, and some functions take arguments. `cls` is a bit unusual in that it takes an optional argument, a colour index. If you don't include a number, it'll default to 0, which is black, but you can try other numbers from 1 to 15 to wipe the whole screen to a single colour, e.g. light blue for sky:

```lua
function TIC()
	cls(11)
end
```

## Drawing Shapes

We'll cover a few built-in functions that allow you to draw on the screen:

- `pix`
- `rect`
- `line`
- `tri`
- `circ`
- `rectb`, `trib` and `circb`
- `print`

We'll start with the smallest...

### pix(x,y, colour)

A pixel is a "picture element", and can be set to one of TIC-80's 16 colours.

The screen is made from a grid of pixels - coloured dots that form the image.

TIC-80's screen is 240 pixels wide by 136 pixels high.

You can set a pixel by calling the `pix` function. This takes three arguments, `x` (the horizontal position of the pixel in the grid, from 0-239), `y` (the vertical position, from 0-135), and a colour index (between 0 and 15).

Try setting a pixel on the screen:

```lua
function TIC()
	-- Clear the screen to a sky-coloured background
	cls(11)

	-- Set a pixel in the centre of the screen to white 
	pix(120,68, 12)
end
```

## Draw order

The program runs sequentially in the TIC function. Whatever you tell it to do higher up will be done first - You can define functions wherever you like, but they won't be executed until you call them. 

## Nested functions

## The full scene

```lua
local T=0

function TIC()
	-- Clear the screen to a sky-coloured background
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