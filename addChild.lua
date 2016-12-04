local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
local json = require("json")

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


local session

-- show()
function scene:show( event )
    composer.removeScene("mainMenu")
    composer.removeScene("newChildDescription")
    local sceneGroup = self.view
    local phase = event.phase
    if (not event.params) then 
        session = "null session"
        print("Session: "..session)
    else
        session = event.params.session_ID
        print("Session: "..session)
    end

    Soptions =
    {
        params = {
            session_ID = session
        }
    }    

    if (event.params) then
        Soptions.params.userName = event.params.userName 
        Soptions.params.Password = event.params.Password
    end

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)

        local pickText = display.newText("Manage Children", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText:setFillColor(0,0,0)
        sceneGroup:insert(pickText)

        local backButtonNew = widget.newButton(
            {
                --width = 500,
                --heigth = 500,
                id = "backButtonNew",
                defaultFile = "backArrow3.png",
                onEvent = handleButtonEvent
            }
        )

        backButtonNew.x = display.contentWidth/2 - 320 
        backButtonNew.y = display.contentHeight - display.contentHeight + 100
        sceneGroup:insert(backButtonNew)

        function backButtonNew:tap(event)

            composer.gotoScene("MainMenu",Soptions)
        
        end

        -- this listens to see if object has been tapped
        backButtonNew:addEventListener("tap", backButtonNew)

----------------------BEGIN NETWORK LISTENER--------------------------
        local function networkListener( event )
            if ( event.isError ) then
                print( "Network error: ", event.response )
                local alert = native.showAlert("Login Error","Server is not available at this time.",{"OK"})
                composer.gotoScene("signin", options)
            else
                serverResponse = json.decode(event.response)
                if(serverResponse) then
                    print ( "RESPONSE: " .. serverResponse["session_id"] )
                    if(serverResponse["children"]) then
                        for k in pairs(serverResponse["children"]) do print ("Child: ".. serverResponse["children"][k]) end
                    end
                    print("Priveleges: "..serverResponse["childPriv"])
                else
                    print("No server response")
                end

                --serverResponse["childPriv"]="0"
                if(serverResponse["childPriv"]~="0" and serverResponse["children"]) then --if they have any kids and are allowed to look at this page, then they see kids
                    for k in pairs(serverResponse["children"]) do
                        local childButton = display.newRect(display.contentWidth/2, display.contentHeight/4-200+(k*150), 400, 75)
                        childButton:setFillColor(0.372549, 0.619608, 0.627451)
                        sceneGroup:insert(childButton)

                        local childTEXT = display.newText(serverResponse["children"][k], childButton.x+140, display.contentHeight/4-200+(k*150), 400, 75)
                        childTEXT.size = 40
                        childTEXT:setFillColor(0,0,0)
                        sceneGroup:insert(childTEXT)

                        function childButton:tap(event)
                            Soptions.params.childID = serverResponse["childIDs"][k]
                            composer.gotoScene("childInformation",Soptions)
                        
                        end

                        -- this listens to see if object has been tapped
                        childButton:addEventListener("tap", childButton)
                    end
                end
            

    		

            
                --serverResponse["childPriv"]="1"
                if(serverResponse["childPriv"]=="2") then --if edit privileges, then they can add kids
                    local addChildButton = display.newRect(display.contentWidth/2, 7*(display.contentHeight/8), 400, 75)
                    addChildButton:setFillColor(1 , 0.498039,0.313725)
                    sceneGroup:insert(addChildButton)

                    local addChildTEXT = display.newText("add Child", display.contentWidth/2+90, 7*(display.contentHeight/8), 400, 75)
                    addChildTEXT.size = 40
                    addChildTEXT:setFillColor(0,0,0)
                    sceneGroup:insert(addChildTEXT)


                    function addChildButton:tap(event)
                        composer.gotoScene("newChildDescription",Soptions)
                    
                    end

                    -- this listens to see if object has been tapped
                    addChildButton:addEventListener("tap", addChildButton)
                end
            end
        end

        if (session~="null session") then
            local URL = "http://35.161.136.208/addChild.php?sessionID="..session
            -- Access server via get
            network.request( URL, "GET", networkListener)
        else
            local alert = native.showAlert("Session Invalid","Sorry, please re-login to resume.",{"OK"})
            local URL = "http://35.161.136.208/Signout.php"
            network.request( URL, "GET", networkListener)
            composer.gotoScene("signIn")
        end

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
