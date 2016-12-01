local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local session


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
    composer.removeScene("newChildDescription")
    composer.removeScene("newChildProblemBehaviorsI")
    

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

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        

        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight*4)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)
        


        local defaultField

        local function textListener( event )

            if ( event.phase == "began" ) then
                -- User begins editing "defaultField"

            elseif ( event.phase == "ended" or event.phase == "submitted" ) then
                -- Output resulting text from "defaultField"
               
                -- once the user inputs their user name then we can use it.
        

            elseif ( event.phase == "editing" ) then
                print( event.newCharacters )
                print( event.oldText )
                print( event.startPosition )
                print( event.text )
            end
        end


        local backButton = display.newRect(display.contentWidth/2 - display.contentWidth/2 + 50, display.contentHeight-display.contentHeight + 100, 70, 75)
        backButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(backButton)

       local nextButton = display.newRect(display.contentWidth - 50, display.contentHeight-display.contentHeight + 100, 70, 75)
        nextButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(nextButton)


        local pickText = display.newText("New Child Description part 2", display.contentWidth/2, display.contentHeight-display.contentHeight + 50, native.systemFont, 50)
        pickText.size = 40
        pickText:setFillColor(0,0,0)
        sceneGroup:insert(pickText)

-----------------------------------------------------------------------		
		-- STRENGTHS TEXTBOX
-----------------------------------------------------------------------

		local strengthsText = display.newText("Strengths", display.contentWidth/2, display.contentHeight/2 - 600)
        strengthsText.size = 40
        strengthsText:setFillColor(0,0,0)
        sceneGroup:insert(strengthsText)
        

        strengthsBox = native.newTextBox( display.contentWidth/2, display.contentHeight/2 - 500 , 600, 150 )
		strengthsBox.isEditable = true
		strengthsBox:addEventListener( "userInput", textListener )
		sceneGroup:insert(strengthsBox)
		

-----------------------------------------------------------------------		
		-- WEAKNESS TEXTBOX
-----------------------------------------------------------------------

		local weaknessText = display.newText("Weaknesses", display.contentWidth/2, strengthsBox.y + 150 )
        weaknessText.size = 40
        weaknessText:setFillColor(0,0,0)
        sceneGroup:insert(weaknessText)
 		

 		weaknessBox = native.newTextBox( display.contentWidth/2, strengthsBox.y + 250, 600, 150 )
		weaknessBox.isEditable = true
		weaknessBox:addEventListener( "userInput", textListener )
		sceneGroup:insert(weaknessBox)
		

-----------------------------------------------------------------------		
		-- MATURITY LEVEL
-----------------------------------------------------------------------
         
        local maturityText = display.newText("Maturity Level", display.contentWidth/2, weaknessBox.y + 150 )
        maturityText.size = 40
        maturityText:setFillColor(0,0,0)
        sceneGroup:insert(maturityText)
 		
 		maturityBox = native.newTextBox( display.contentWidth/2, weaknessBox.y + 250, 600, 110 )
		maturityBox.isEditable = true
		maturityBox:addEventListener( "userInput", textListener )
		sceneGroup:insert(maturityBox)

-----------------------------------------------------------------------		
		-- INTERESTS
-----------------------------------------------------------------------

		local interestsText = display.newText("Interests", display.contentWidth/2, maturityBox.y + 100 )
        interestsText.size = 40
        interestsText:setFillColor(0,0,0)
        sceneGroup:insert(interestsText)

        interestsBox = native.newTextBox( display.contentWidth/2, maturityBox.y + 200, 600, 150 )
		interestsBox.isEditable = true
		interestsBox:addEventListener( "userInput", textListener )
		sceneGroup:insert(interestsBox)

-----------------------------------------------------------------------		
		-- DISCIPLINE WORKED IN PAST
-----------------------------------------------------------------------

		local successfulDiscliplineText = display.newText("Discipline that has worked in the past", display.contentWidth/2, interestsBox.y + 100 )
        successfulDiscliplineText.size = 35
        successfulDiscliplineText:setFillColor(0,0,0)
        sceneGroup:insert(successfulDiscliplineText)

        successfulDiscliplineBox = native.newTextBox( display.contentWidth/2, interestsBox.y + 200, 600, 100 )
		successfulDiscliplineBox.isEditable = true
		successfulDiscliplineBox:addEventListener( "userInput", textListener )
		sceneGroup:insert(successfulDiscliplineBox)


-----------------------------------------------------------------------		
		-- DISCIPLINE THAT HAS NOT WORKED IN PAST
-----------------------------------------------------------------------

		local unsuccessfulDiscliplineText = display.newText("Discipline that has not worked in the past", display.contentWidth/2, successfulDiscliplineBox.y + 100 )
        unsuccessfulDiscliplineText.size = 35
        unsuccessfulDiscliplineText:setFillColor(0,0,0)
        sceneGroup:insert(unsuccessfulDiscliplineText)

        unsuccessfulDiscliplineBox = native.newTextBox( display.contentWidth/2, successfulDiscliplineBox.y + 200, 600, 150 )
		unsuccessfulDiscliplineBox.isEditable = true
		unsuccessfulDiscliplineBox:addEventListener( "userInput", textListener )
		sceneGroup:insert(unsuccessfulDiscliplineBox)

-----------------------------------------------------------------------		
		-- Bottom Buttons
-----------------------------------------------------------------------

 		local cancelButton = display.newRect(display.contentWidth/2 - display.contentWidth/2 + 100, 3100, 70, 75)
        cancelButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(cancelButton)

        


        function nextButton:tap(event)
            composer.gotoScene("newChildProblemBehaviorsI",Soptions)
        end

        function backButton:tap(event)
        	strengthsBox:removeSelf()
            composer.gotoScene("newChildDescription",Soptions)
        end

      
		
        -- this listens to see if object has been tapped
        backButton:addEventListener("tap", backButton)
        nextButton:addEventListener("tap", nextButton)
        




        --function childButton:tap(event)

       --     composer.gotoScene("childInformation")
        
       -- end

        -- this listens to see if object has been tapped
       -- childButton:addEventListener("tap", childButton)


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