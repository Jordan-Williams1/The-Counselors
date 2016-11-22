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


        local pickText = display.newText("          Timmy:\n Behavior Problems", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText.width = 600
        pickText.align = "center"
        pickText:setFillColor(0,0,0)
        sceneGroup:insert(pickText)

        
        local childTEXT = display.newText("", display.contentWidth/2+140, display.contentHeight/2, 400, 75)
        childTEXT.size = 40
        childTEXT:setFillColor(0,0,0)
        sceneGroup:insert(childTEXT)

        local addTEXT = display.newText("Add Problem Behavior", display.contentWidth/2+40, display.contentHeight/2+250, 400, 75)
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

        -- Create text field
        writeBehavior = native.newTextField( display.contentWidth/2, display.contentHeight/2+300, display.contentWidth/2, 75)
        writeBehavior:addEventListener( "userInput", textListener )
        sceneGroup:insert(writeBehavior)

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

            
            writeBehavior:removeSelf()
			composer.gotoScene("problemBehaviorList")
        
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
