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
    composer.removeScene("desiredBehaviorListLast")
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
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

        local pickText = display.newText("Child Description", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText:setFillColor(0,0,0)
        sceneGroup:insert(pickText)

         -- Create text field Name
        childName = native.newTextField( display.contentWidth/1.5, display.contentHeight-display.contentHeight + 200, display.contentWidth/2, 75)
        sceneGroup:insert(childName)
        childName:addEventListener( "userInput", textListener )

        local childNameText = display.newText("Name: ", display.contentWidth/2-140, display.contentHeight-display.contentHeight + 200, 400, 75)
        childNameText.size = 40
        childNameText:setFillColor(0,0,0)
        sceneGroup:insert(childNameText)

        -- Create text field Age
        childAge = native.newTextField(  display.contentWidth/1.5, display.contentHeight-display.contentHeight + 350, display.contentWidth/2, 75)
        sceneGroup:insert(childAge)
        childAge:addEventListener( "userInput", textListener )

        local childAgeText = display.newText("Age: ", display.contentWidth/2-140, display.contentHeight-display.contentHeight + 350, 400, 75)
        childAgeText.size = 40
        childAgeText:setFillColor(0,0,0)
        sceneGroup:insert(childAgeText)

        local GradeText = display.newText("Grade: ", display.contentWidth/2-140, display.contentHeight/2-150, 400, 75)
        GradeText.size = 40
        GradeText:setFillColor(0,0,0)
        sceneGroup:insert(GradeText)

        -- Create text field Age
        childGrade = native.newTextField(  display.contentWidth/1.5, display.contentHeight/2-150, display.contentWidth/2, 75)
        sceneGroup:insert(childGrade)
        childGrade:addEventListener( "userInput", textListener )

        local DateText = display.newText("Date: ", display.contentWidth/2-140, display.contentHeight/2, 400, 75)
        DateText.size = 40
        DateText:setFillColor(0,0,0)
        sceneGroup:insert(DateText)

        dateField = native.newTextField(  display.contentWidth/1.5, display.contentHeight/2, display.contentWidth/2, 75)
        sceneGroup:insert(dateField)
        dateField:addEventListener( "userInput", textListener )






        

         function backButton:tap(event)

            composer.gotoScene("addChild")
        
        end

        -- this listens to see if object has been tapped
        backButton:addEventListener("tap", backButton)



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
