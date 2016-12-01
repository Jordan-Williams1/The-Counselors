
local composer = require( "composer" )
local crypto = require("crypto")
local scene = composer.newScene()
local json = require("json")
local widget = require("widget")

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local serverResponse
local session_ID
local options

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
        composer.removeScene("register")
       
        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)

        --local signIn = display.newRect(display.contentWidth/2, display.contentHeight/2+ 200, 200, 75)
        --signIn:setFillColor(0.372549, 0.619608, 0.627451)
        --sceneGroup:insert(signIn)

         -- Create the widget
		local signIn = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "signIn",
		        defaultFile = "signIn.png",
		        onEvent = handleButtonEvent
		    }
		)

		signIn.x = display.contentWidth/2 
		signIn.y = display.contentHeight/2+ 200
		sceneGroup:insert(signIn)

        --local signInText = display.newText("Sign In ", display.contentWidth/2+50, display.contentHeight/2 + 215, 200, 75)
        --signInText:setFillColor(0,0,0)
        --sceneGroup:insert(signInText)

        local forgotPassword = display.newText("Forgot Password?", display.contentWidth-display.contentWidth+100, display.contentHeight-50 ,200,100)
        forgotPassword:setFillColor(0,0,0)
        sceneGroup:insert(forgotPassword)

        local regButton = display.newRect(display.contentWidth-70, display.contentHeight-30, 200, 75)
        regButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(regButton)

        local Register = display.newText("Register", display.contentWidth-60, display.contentHeight-10 ,200,100)
        Register:setFillColor(0,0,0)
        sceneGroup:insert(Register)

        
        local titleOptions = {
            text = "Discipline App for Parents", 
            x = display.contentWidth/2,
            y = display.contentHeight/4,
            width = display.contentWidth-20,
            height = 400,
            align = "center"
        }

        local titleOfApp = display.newText(titleOptions)
        titleOfApp.size = 110
        titleOfApp:setFillColor(0,0,0)
        sceneGroup:insert(titleOfApp)







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
sceneGroup:insert(userName)
userName.text = "testMaster"
--userName.text = "testSub"

Password = native.newTextField( display.contentWidth/2, display.contentHeight/2+ 100, display.contentWidth/2, 75)
Password:addEventListener( "userInput", textListener )
sceneGroup:insert(Password)
Password.text = "testMaster"
--Password.text = "testSub"

		local function goRegister(event)
			userName:removeSelf()
			Password:removeSelf()
            print("tap")
            composer.gotoScene("register", options) 
        end

        regButton:addEventListener("tap",goRegister)

options =
{
   Password = Password.text,
   userName = userName.text,
    
    params = {
        userName = userName.text, 
        Password = Password.text,
        session_ID
    }
}

function signIn:tap(event)
    print("tap")
    local x = crypto.digest(crypto.md5,userName.text)
    local y = crypto.digest(crypto.md5,Password.text)
    signIn.isVisible = false

    local function networkListener( event )
        if ( event.isError ) then
            print( "Network error: ", event.response )
            signIn.isVisible = true
        else
            serverResponse = json.decode(event.response)
            print ( "RESPONSE: " .. serverResponse["session_id"])
            if(serverResponse["Logged in"] == "Logged in") then
                options.params.session_ID = serverResponse["session_id"]
                composer.gotoScene("MainMenu", options)
            elseif serverResponse == "Invalid username or password" then
                signIn.isVisible = true
                local alert = native.showAlert("Login Error","Invalid username or password.",{"OK"})
                
            end
        end
    end
    local URL = "http://35.161.136.208/Login.php?loginUsername="..x.."&loginPassword="..y
    -- Access server via post
    network.request( URL, "GET", networkListener)   

    --signIn:removeSelf()
    --signInText:removeSelf()
    --forgotPassword:removeSelf()
    --Register:removeSelf()
    --titleOfApp:removeSelf()
    
    
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
