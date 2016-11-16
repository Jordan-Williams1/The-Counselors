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

        local backButton = display.newRect(display.contentWidth/2 - 270, display.contentHeight/2 - 480, 70, 75)
        backButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(backButton)

        local pickText = display.newText("Child NAME", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText:setFillColor(0,0,0)
        sceneGroup:insert(pickText)

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

         function backButton:tap(event)

            composer.gotoScene("addChild")
        
        end

        -- this listens to see if object has been tapped
        backButton:addEventListener("tap", backButton)



       -- function childButton:tap(event)

            --composer.gotoScene("desiredBehaviorListLast")
        
        --end

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
