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

    local function scrollListener( event )

            local phase = event.phase
            if ( phase == "began" ) then print( "Scroll view was touched" )
            elseif ( phase == "moved" ) then print( "Scroll view was moved" )
            elseif ( phase == "ended" ) then print( "Scroll view was released" )
            end

            -- In the event a scroll limit is reached...
            if ( event.limitReached ) then
                if ( event.direction == "up" ) then print( "Reached bottom limit" )
                elseif ( event.direction == "down" ) then print( "Reached top limit" )
                elseif ( event.direction == "left" ) then print( "Reached right limit" )
                elseif ( event.direction == "right" ) then print( "Reached left limit" )
                end
            end

            return true
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
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        -- Create the widget
        local scrollViewFull = widget.newScrollView(
            {
                width = display.contentWidth,
                height = display.contentHeight,
                scrollWidth = display.contentWidth,
                scrollHeight = 2000,
                listener = scrollListener
            }
        )
        scrollViewFull.x = display.contentWidth/2
        scrollViewFull.y = display.contentHeight/2
        sceneGroup:insert(scrollViewFull)

        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight*4)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        scrollViewFull:insert(background)

         -- Create the widget
        local scrollView = widget.newScrollView(
            {
                width = display.contentWidth/1.5,
                height = display.contentHeight/2,
                scrollWidth = display.contentWidth,
                scrollHeight = 2000,
                listener = scrollListener
            }
        )
        scrollView.x = display.contentWidth/2
        scrollView.y = display.contentHeight/2
        scrollViewFull:insert(scrollView)
        scrollView:setScrollHeight(1500)

        local childTEXT = display.newText("ScrollView 1", scrollView.width/2, scrollView.height/2, 400, 75)
        childTEXT.size = 40
        childTEXT:setFillColor(0,0,0)
        scrollView:insert(childTEXT)

-----------------------------------------------------------------------     
        -- ScrollView 2 
-----------------------------------------------------------------------     

                 -- Create the widget
        local scrollView2 = widget.newScrollView(
            {
                width = display.contentWidth/1.5,
                height = display.contentHeight/2,
                scrollWidth = display.contentWidth,
                scrollHeight = 2000,
                listener = scrollListener
            }
        )
        scrollView2.x = display.contentWidth/2
        scrollView2.y = scrollView.y + 800
        scrollView2:setScrollHeight(1500)
        scrollViewFull:insert(scrollView2)

        local childTEXT2 = display.newText("ScrollView 2", scrollView.width/2, scrollView.height/2, 400, 75)
        childTEXT2.size = 40
        childTEXT2:setFillColor(0,0,0)
        scrollView2:insert(childTEXT2)

-----------------------------------------------------------------------     
        -- ScrollView 3 
-----------------------------------------------------------------------     

        -- Create the widget
        local scrollView3 = widget.newScrollView(
        {
                width = display.contentWidth/1.5,
                height = display.contentHeight/2,
                scrollWidth = display.contentWidth,
                scrollHeight = 2000,
                listener = scrollListener
            }
        )
        scrollView3.x = display.contentWidth/2
        scrollView3.y = scrollView2.y + 800
        scrollView3:setScrollHeight(1500)
        scrollViewFull:insert(scrollView3)

        local childTEXT3 = display.newText("ScrollView 3", scrollView.width/2, scrollView.height/2, 400, 75)
        childTEXT3.size = 40
        childTEXT3:setFillColor(0,0,0)
        scrollView3:insert(childTEXT3)








        local pickText = display.newText("Child IDP", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText:setFillColor(0,0,0)
        scrollViewFull:insert(pickText)

       

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
		scrollViewFull:insert(backButtonNew)

         
        -- Create text field
        --writeBehavior = native.newTextField( display.contentWidth/2, display.contentHeight-100, display.contentWidth/2, 75)
        --writeBehavior:addEventListener( "userInput", textListener )
        --sceneGroup:insert(writeBehavior)

        --local addButton = display.newRect(display.contentWidth/2+250, display.contentHeight-100, 70, 75)
        --addButton:setFillColor(0.372549, 0.619608, 0.627451)
        --sceneGroup:insert(addButton)

        --local plus = display.newText("ADD", display.contentWidth/2+250, display.contentHeight-100, 70, 75)
        --plus.size = 33
        --plus:setFillColor(0,0,0)
        --sceneGroup:insert(plus)

        --function plus:tap(event)

        --    childTEXT.text = writeBehavior.text
        
        --end
        
        --plus:addEventListener("tap", plus)


         function backButtonNew:tap(event)

             if scrollViewFull.numChildren > 1 then
                    scrollView:removeSelf()
                    scrollView2:removeSelf()
                    scrollView3:removeSelf()
             end

            composer.gotoScene("childInformation")
        
        end

        -- this listens to see if object has been tapped
        backButtonNew:addEventListener("tap", backButtonNew)

       -- function childButton:tap(event)

            --composer.gotoScene("childInformation")
        
       -- end

        -- this listens to see if object has been tapped
        --childButton:addEventListener("tap", childButton)


       

                scrollViewFull:setScrollHeight(3200)


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
