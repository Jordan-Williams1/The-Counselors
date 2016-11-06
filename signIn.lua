
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------



-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen



end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

       



       local signIn = display.newRect(display.contentWidth/2, display.contentHeight/2+ 200, 200, 75)
signIn:setFillColor(0,1,0)

local signInText = display.newText("Sign In ", display.contentWidth/2+50, display.contentHeight/2 + 215, 200, 75)
signInText:setFillColor(0,0,0)

local forgotPassword = display.newText("forgot Password?", display.contentWidth-display.contentWidth+100, display.contentHeight-50 ,200,100)


local Register = display.newText("Register", display.contentWidth-25, display.contentHeight-10 ,200,100)


local titleOfApp = display.newText("Title", display.contentWidth/2 ,200)
titleOfApp.size = 110





local defaultField

local function textListener( event )

    if ( event.phase == "began" ) then
        -- User begins editing "defaultField"

    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
       
        -- once the user inputs their user name then we can use it.
        if userName.text == "jordan" then
            print("ok")
            Password.text = "ok"
        end

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



local options =
{
   Password = Password.text,
   userName = userName.text,
    
    params = {
        userName, 
        Password
    }
}

function signIn:tap(event)
    composer.gotoScene("MainMenu", options)
    signIn:removeSelf()
    signInText:removeSelf()
    forgotPassword:removeSelf()
    Register:removeSelf()
    titleOfApp:removeSelf()
    userName:removeSelf()
    Password:removeSelf()
    
    --myButton:removeEventListener( "touch", myTouchListener )
end



signIn:addEventListener("tap", signIn)

    

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

        



    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end

 





-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
