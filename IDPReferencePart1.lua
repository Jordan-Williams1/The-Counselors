local composer = require( "composer" )
local widget = require( "widget" )
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

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        

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



        -- Create the widget
        local scrollView = widget.newScrollView(
            {
                --top = 100,
                --left = 10,
                width = display.contentWidth,
                height = display.contentHeight,
                scrollWidth = 600,
                scrollHeight = 2000,
                listener = scrollListener
            }
        )

        sceneGroup:insert(scrollView)

        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight*4)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        scrollView:insert(background)

        -- Function to handle button events
        local function handleButtonEvent( event )

            if ( "ended" == event.phase ) then
                print( "Button was pressed and released" )
            end
        end

       
        -- Create the widget
        --local backButtonNew = widget.newButton(
        --    {
                --width = 500,
                --heigth = 500,
         --       id = "backButtonNew",
         --       defaultFile = "part1page3.png",
         --       onEvent = handleButtonEvent
         --   }
       -- )

        local imageop = display.newImageRect( "part1page3.png", display.contentWidth-20, display.contentHeight-400)--(display.contentWidth-40)*(670/533))
        imageop.x = display.contentWidth/2
        imageop.y = display.contentHeight/2
        scrollView:insert(imageop)

        local pagefour = display.newImageRect( "part1page4.png", display.contentWidth-20, display.contentHeight-400)--(display.contentWidth-40)*(670/533))
        pagefour.x = display.contentWidth/2
        pagefour.y = display.contentHeight + display.contentHeight/2  - 200
        scrollView:insert(pagefour)

        local pagefive = display.newImageRect( "part1page5.png", display.contentWidth-20, display.contentHeight-400)--(display.contentWidth-40)*(670/533))
        pagefive.x = display.contentWidth/2
        pagefive.y = pagefour.y + display.contentHeight -- display.contentHeight + display.contentHeight/2  - 200
        scrollView:insert(pagefive)



        






        scrollView:setScrollHeight(3200)


      --  function backButtonNew:tap(event)

      --      composer.gotoScene("MainMenu", Soptions)
        
    -- end

        -- this listens to see if object has been tapped
       -- backButtonNew:addEventListener("tap", backButtonNew)





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









