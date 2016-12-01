local composer = require( "composer" )
local widget = require("widget")
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
    composer.removeScene("newChildConsequencesII")
    composer.removeScene("newChildRewardsII")


    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
     local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)


       local pickText = display.newText("          New Child:\n          Rewards I", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText.width = 600
        pickText.align = "center"
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


-----------------------------------------------------------------------     
        -- AFFIRMATIONS
-----------------------------------------------------------------------

        local AffirmText = display.newText("Affirmations: ", display.contentWidth/2-250, display.contentHeight-display.contentHeight + 300, native.systemFont, 50)
        AffirmText.size = 45
        --AffirmText.width = 600
        AffirmText:setFillColor(0,0,0)
        sceneGroup:insert(AffirmText)

        local verbalAffirmText = display.newText("Verbal affirmations", display.contentWidth/2-150, display.contentHeight-display.contentHeight + 400, native.systemFont, 50)
        verbalAffirmText.size = 35
        verbalAffirmText:setFillColor(0,0,0)
        sceneGroup:insert(verbalAffirmText)

        local verbalAffirmButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        verbalAffirmButton.x = display.contentWidth/2-350 
        verbalAffirmButton.y = display.contentHeight-display.contentHeight + 400
        sceneGroup:insert(verbalAffirmButton)

        local affectionText = display.newText("Hugs & appropriate affection", display.contentWidth/2-80, display.contentHeight-display.contentHeight + 500, native.systemFont, 50)
        affectionText.size = 35
        affectionText:setFillColor(0,0,0)
        sceneGroup:insert(affectionText)

        local affectionTextButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        affectionTextButton.x = display.contentWidth/2-350 
        affectionTextButton.y = display.contentHeight-display.contentHeight + 500
        sceneGroup:insert(affectionTextButton)

        local emailsText = display.newText("Texts or Emails", display.contentWidth/2-190, display.contentHeight-display.contentHeight + 600, native.systemFont, 50)
        emailsText.size = 35
        emailsText:setFillColor(0,0,0)
        sceneGroup:insert(emailsText)

        local emailsTextButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        emailsTextButton.x = display.contentWidth/2-350 
        emailsTextButton.y = display.contentHeight-display.contentHeight + 600
        sceneGroup:insert(emailsTextButton)



-----------------------------------------------------------------------     
        -- PRIVILEGES
-----------------------------------------------------------------------

        local privilegesText = display.newText("Privileges:", display.contentWidth/2-250, display.contentHeight-display.contentHeight + 700, native.systemFont, 50)
        privilegesText.size = 45
        privilegesText:setFillColor(0,0,0)
        sceneGroup:insert(privilegesText)

        local tvTimeText = display.newText("Extra TV Time", display.contentWidth/2-190, display.contentHeight-display.contentHeight + 800, native.systemFont, 50)
        tvTimeText.size = 35
        tvTimeText:setFillColor(0,0,0)
        sceneGroup:insert(tvTimeText)

        local tvTimeButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        tvTimeButton.x = display.contentWidth/2-350 
        tvTimeButton.y = display.contentHeight-display.contentHeight + 800
        sceneGroup:insert(tvTimeButton)


        local choreText = display.newText("Parent does child's chore", display.contentWidth/2-100, display.contentHeight-display.contentHeight + 900, native.systemFont, 50)
        choreText.size = 35
        choreText:setFillColor(0,0,0)
        sceneGroup:insert(choreText)

        local choreTextButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        choreTextButton.x = display.contentWidth/2-350 
        choreTextButton.y = display.contentHeight-display.contentHeight + 900
        sceneGroup:insert(choreTextButton)




        
        

















        local nextButton = display.newRect(display.contentWidth - 50, display.contentHeight-display.contentHeight + 100, 70, 75)
        nextButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(nextButton)

        function nextButton:tap(event)

            composer.gotoScene("newChildRewardsII")
        
        end
        nextButton:addEventListener("tap", nextButton)

        function backButtonNew:tap(event)
            
            composer.gotoScene("newChildConsequencesII")
        
        end
        backButtonNew:addEventListener("tap", backButtonNew)


        --[[
        local childTEXT = display.newText("", display.contentWidth/2+140, display.contentHeight/2, 400, 75)
        childTEXT.size = 40
        childTEXT:setFillColor(0,0,0)
        sceneGroup:insert(childTEXT)

        local addTEXT = display.newText("Add Desired Behavior", display.contentWidth/2+40, display.contentHeight/2+250, 400, 75)
        addTEXT.size = 25
        addTEXT:setFillColor(0,0,0)
        sceneGroup:insert(addTEXT)

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

       

        local addButton = display.newRect(display.contentWidth/2+250, display.contentHeight/2+300, 70, 75)
        addButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(addButton)

        local plus = display.newText("ADD", display.contentWidth/2+250, display.contentHeight/2+310, 70, 75)
        plus.size = 33
        plus:setFillColor(0,0,0)
        sceneGroup:insert(plus)

        function plus:tap(event)

            childTEXT.text = writeBehavior.text
        
        end
        plus:addEventListener("tap", plus)


         function backButtonNew:tap(event)
            
            composer.gotoScene("desiredBehaviorList")
        
        end
        backButtonNew:addEventListener("tap", backButtonNew)

         -- Create text field
        writeBehavior = native.newTextField( display.contentWidth/2, display.contentHeight/2+300, display.contentWidth/2, 75)
        
        sceneGroup:insert(writeBehavior)
        writeBehavior:addEventListener( "userInput", textListener )
        --]]
end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

       


    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screesn

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

        if writeBehavior~=nil then
           --writeBehavior:removeSelf()
           -- writeBehavior = nil
        end
       
    

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

        if writeBehavior~=nil then
           --writeBehavior:removeSelf()
           -- writeBehavior = nil
        end
       
    

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end     

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
