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

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)

       local pickText = display.newText("          John:\n Behavior Problems", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText.width = 600
        pickText.align = "center"
        pickText:setFillColor(0,0,0)
        sceneGroup:insert(pickText)

       

        local childTEXT = display.newText("LOG OF CONSEQUENCES GOES HERE", display.contentWidth/2+140, display.contentHeight/2, 400, 200)
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

         function backButtonNew:tap(event)

            composer.gotoScene("consequencesLog")
        
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
