local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------



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
    composer.removeScene("desiredBehaviorListLast")
    composer.removeScene("childIDP")

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

        local pickText = display.newText("Child Behavioral History", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText:setFillColor(0,0,0)
        sceneGroup:insert(pickText)

        local childButton = display.newRect(display.contentWidth/2, display.contentHeight/2-200, 400, 75)
        childButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(childButton)


        local childTEXT = display.newText("List of child stuff", display.contentWidth/2+100, display.contentHeight/2-200, 400, 75)
        childTEXT.size = 40
        childTEXT:setFillColor(0,0,0)
        sceneGroup:insert(childTEXT)

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

         
        -- Create text field
        writeBehavior = native.newTextField( display.contentWidth/2, display.contentHeight-100, display.contentWidth/2, 75)
        writeBehavior:addEventListener( "userInput", textListener )
        sceneGroup:insert(writeBehavior)

        local addButton = display.newRect(display.contentWidth/2+250, display.contentHeight-100, 70, 75)
        addButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(addButton)

        local plus = display.newText("ADD", display.contentWidth/2+250, display.contentHeight-100, 70, 75)
        plus.size = 33
        plus:setFillColor(0,0,0)
        sceneGroup:insert(plus)

        function plus:tap(event)

            childTEXT.text = writeBehavior.text
        
        end
        
        plus:addEventListener("tap", plus)

--[[
        local IDP = display.newRect(display.contentWidth/2, display.contentHeight/2, 400, 75)
        IDP:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(IDP)

        local IDP_TEXT = display.newText("IDP", display.contentWidth/2+140, display.contentHeight/2, 400, 75)
        IDP_TEXT.size = 40
        IDP_TEXT:setFillColor(0,0,0)
        sceneGroup:insert(IDP_TEXT)

        local childDescriptionButton = display.newRect(display.contentWidth/2, display.contentHeight/2 + 100, 400, 75)
        childDescriptionButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(childDescriptionButton)

        local childDescriptionTEXT = display.newText("Child Description", display.contentWidth/2+50, display.contentHeight/2 + 100, 400, 75)
        childDescriptionTEXT.size = 40
        childDescriptionTEXT:setFillColor(0,0,0)
        sceneGroup:insert(childDescriptionTEXT)

        local behavioralHistory = display.newRect(display.contentWidth/2, display.contentHeight/2 + 200, 400, 75)
        behavioralHistory:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(behavioralHistory)

        local behavioralHistoryText = display.newText("Behavioral History", display.contentWidth/2+50, display.contentHeight/2 + 200, 400, 75)
        behavioralHistoryText.size = 40
        behavioralHistoryText:setFillColor(0,0,0)
        sceneGroup:insert(behavioralHistoryText)

--]]

        local backButtonNew = widget.newButton(
		    {
		      
		        id = "backButtonNew",
		        defaultFile = "backArrow3.png",
		        onEvent = handleButtonEvent
		    }
		)

		backButtonNew.x = display.contentWidth/2 - 320 
		backButtonNew.y = display.contentHeight - display.contentHeight + 100
		sceneGroup:insert(backButtonNew)

         function backButtonNew:tap(event)

            composer.gotoScene("childInformation", Soptions)
        
        end

        -- this listens to see if object has been tapped
        backButtonNew:addEventListener("tap", backButtonNew)
         
        
      

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
