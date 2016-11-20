local composer = require( "composer" )
local crypto = require("crypto")
local scene = composer.newScene()
local json = require("json")

local serverResponse

function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen



end

function scene:show( event )
	composer.removeScene("signin")
    local sceneGroup = self.view
    local phase = event.phase
    

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
		
		
		local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)
		
		local myText = display.newText( "New Username:", display.contentWidth/2, display.contentHeight/2.25 + 5,300, 50, 8 )
		myText:setFillColor( 0, 0, 0 )
		sceneGroup:insert(myText)
		

        local signIn = display.newRect(display.contentWidth/2, display.contentHeight/2+ 400, 200, 75)
        signIn:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(signIn)
		
        local signInText = display.newText("Register", display.contentWidth/2+30, display.contentHeight/2 + 400, 200, 50)
        signInText:setFillColor(0,0,0)
        sceneGroup:insert(signInText)
		
		
		local signInText2 = display.newText("Reenter Password:", display.contentWidth/2+10, display.contentHeight/2 + 250, 300, 100)
        signInText2:setFillColor(0,0,0)
        sceneGroup:insert(signInText2)

        local titleOfApp = display.newText("Register User", display.contentWidth/2 ,200)
        titleOfApp.size = 110
        titleOfApp:setFillColor(0,0,0)
        sceneGroup:insert(titleOfApp)
		
		local Ptext = display.newText( "New Password:", display.contentWidth/2, display.contentHeight/2 + 175, 300, 230 )
		Ptext:setFillColor( 0, 0, 0)
		sceneGroup:insert(Ptext)








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

Password = native.newTextField( display.contentWidth/2, display.contentHeight/2+ 150, display.contentWidth/2, 75)
Password:addEventListener( "userInput", textListener )
sceneGroup:insert(Password)

PasswordCheck = native.newTextField( display.contentWidth/2, display.contentHeight/2+ 325, display.contentWidth/2, 75)
Password:addEventListener( "userInput", textListener )
sceneGroup:insert(PasswordCheck)


options =
{
   Password = Password.text,
   userName = userName.text,
    
    params = {
        userName, 
        Password,
        session_ID
    }
}

function signIn:tap(event)
    print("tap")
    local x = crypto.digest(crypto.md5,userName.text)
    local y = crypto.digest(crypto.md5,userName.text)


    local function networkListener( event )
        if ( event.isError ) then
            print( "Network error: ", event.response )
        else
            serverResponse = json.decode(event.response)
            print ( "RESPONSE: " .. serverResponse["session_id"])
            if(serverResponse["Logged in"] == "Logged in") then
                userName:removeSelf()
                Password:removeSelf()
                options.params.session_ID = serverResponse["session_id"]
                composer.gotoScene("MainMenu", options)
            elseif serverResponse == "Invalid username or password" then
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
