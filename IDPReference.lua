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
	composer.removeScene("mainMenu")
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

	    local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)

        local pdfView = native.newWebView( display.centerX, display.centerY, display.contentWidth-20, display.contentHeight-50)

		pdfView:request( "IDPReference.html", system.ResourceDirectory )


		-- Function to handle button events
		--[[local function handleButtonEvent( event )

		    if ( "ended" == event.phase ) then
		        print( "Button was pressed and released" )
		    end
		end]]--

		-- Create the widget
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

       
       

        -- Create the widget

		--[[local IDP_Reference = widget.newButton(
=======
		local partOne = widget.newButton(
>>>>>>> origin/master
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "IDP_Reference",
		        defaultFile = "part1.png",
		        onEvent = handleButtonEvent
		    }
		)

		partOne.x = display.contentWidth/2 
		partOne.y = display.contentHeight/2-200
		sceneGroup:insert(partOne)

        
        -- Create the widget
		local family_Schedule = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "family_Schedule",
		        defaultFile = "part2.png",
		        onEvent = handleButtonEvent
		    }
		)

		family_Schedule.x = display.contentWidth/2 
		family_Schedule.y = display.contentHeight/2-80
		sceneGroup:insert(family_Schedule)

       

         -- Create the widget
		local Problem_Behavior_List = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "Problem_Behavior_List",
		        defaultFile = "part3.png",
		        onEvent = handleButtonEvent
		    }
		)

		Problem_Behavior_List.x = display.contentWidth/2 
		Problem_Behavior_List.y = display.contentHeight/2 + 40
		sceneGroup:insert(Problem_Behavior_List)

       

         -- Create the widget
		local Desired_Behavior_List = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "Desired_Behavior_List",
		        defaultFile = "part4.png",
		        onEvent = handleButtonEvent
		    }
		)

		Desired_Behavior_List.x = display.contentWidth/2 
		Desired_Behavior_List.y = display.contentHeight/2+160
		sceneGroup:insert(Desired_Behavior_List)

       

         -- Create the widget
		local Consequence_Log = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "Consequence_Log",
		        defaultFile = "part5.png",
		        onEvent = handleButtonEvent
		    }
		)

		Consequence_Log.x = display.contentWidth/2 
		Consequence_Log.y = display.contentHeight/2+280
		sceneGroup:insert(Consequence_Log)


       

        -- Create the widget
		local Reward_Log = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "Reward_Log",
		        defaultFile = "part6.png",
		        onEvent = handleButtonEvent
		    }
		)

		Reward_Log.x = display.contentWidth/2 
		Reward_Log.y = display.contentHeight/2+400
		sceneGroup:insert(Reward_Log)]]--


        function backButtonNew:tap(event)
            composer.gotoScene("MainMenu",Soptions)
    	end

    	--[[function partOne:tap(event)

    	 	composer.gotoScene("IDPReferencePart1", Soptions)
    	
    	end]]--

        -- this listens to see if object has been tapped
        backButtonNew:addEventListener("tap", backButtonNew)

        --partOne:addEventListener("tap", partOne)





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









