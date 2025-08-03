# Drawing in TIC-80, using the Lua language

This a short tutorial to introduce some basics. It is designed to give a nice shape for a workshop (30-90 minutes, depending on capability and how much you'd like to play around) or something to follow for a basic self-start.

It covers:
- The structure of a program.
- Running a program.
- Built-in functions.
- The basic shapes you can draw with TIC-80.
- Some control structures (`if` statements and `for` loops)
- User-defined functions.

It may be helpful to first read about the capabilities of TIC-80 (link to come) and how to install and customise (link to come).

```lua
-- comments look like this
```

## The minimum viable program

```lua
function TIC()
end
```

## Built in functions and indenting for your sanity

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

-- 240x136

## Nested functions

```lua
function TIC()
    -- Clear screen, and sky background
    cls(11)

    drawSun(200,30) 

    -- Ground
    rect(0,80,240,60,14)

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
end

function drawSun(x,y)
    circ(x,y,15,4)
    local eyeY=y-3
    drawEye(x-6,eyeY)
    drawEye(x+6,eyeY)
end

function drawEye(x,y)
	circ(x,y,5,12)
	circ(x,y,3,0)
end
```
