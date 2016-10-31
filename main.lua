


local signIn = display.newRect(display.contentWidth/2, display.contentHeight/2+ 200, 200, 75)
signIn:setFillColor(0,1,0)

local signIn = display.newText("Sign In ", display.contentWidth/2+50, display.contentHeight/2+ 200, 200, 75)
signIn:setFillColor(0,0,1)

local forgotPassword = display.newText("forgot Password?", 100,1100,200,100)


local Register = display.newText("Register", 600,1100,200,100)




local titleOfApp = display.newText("Title", display.contentWidth/2 ,200)
titleOfApp.size = 110


local defaultField

local function textListener( event )

    if ( event.phase == "began" ) then
        -- User begins editing "defaultField"

    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
        print( event.target.text )

    elseif ( event.phase == "editing" ) then
        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )
    end
end

-- Create text field
userName = native.newTextField( display.contentWidth/2, display.contentHeight/2, display.contentWidth/2, 75)
userName:addEventListener( "userInput", textListener )

Password = native.newTextField( display.contentWidth/2, display.contentHeight/2+ 100, display.contentWidth/2, 75)
Password:addEventListener( "userInput", textListener )








