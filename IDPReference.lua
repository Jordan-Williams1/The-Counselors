local composer = require( "composer" )
local widget = require( "widget" )
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



		-- Function to handle button events
		local function handleButtonEvent( event )

		    if ( "ended" == event.phase ) then
		        print( "Button was pressed and released" )
		    end
		end

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

       
       -- local backButton = display.newRect(display.contentWidth/2 - 270, display.contentHeight/2 - 480, 70, 75)
        --backButton:setFillColor(0.372549, 0.619608, 0.627451)
        --sceneGroup:insert(backButton)

        --local IDP_Reference = display.newRect(display.contentWidth/2, display.contentHeight/2-200, 400, 75)
        --IDP_Reference:setFillColor(0.372549, 0.619608, 0.627451)
        --sceneGroup:insert(IDP_Reference)

        --local IDPText = display.newText("Part I Guide for Parenting ", display.contentWidth/2, display.contentHeight/2-200, 200, 75)
        --IDPText:setFillColor(0,0,0)
        --sceneGroup:insert(IDPText)

        -- Create the widget
		local IDP_Reference = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "IDP_Reference",
		        defaultFile = "Rectangle3.png",
		        onEvent = handleButtonEvent
		    }
		)

		IDP_Reference.x = display.contentWidth/2 
		IDP_Reference.y = display.contentHeight/2-200
		sceneGroup:insert(IDP_Reference)

        local family_Schedule = display.newRect(display.contentWidth/2, display.contentHeight/2 - 100, 400, 75)
        family_Schedule:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(family_Schedule)

        local IDPTextII = display.newText("Part II Understand Parent Roles and Responsibilities ", display.contentWidth/2, display.contentHeight/2 - 100, 400, 75)
        IDPTextII:setFillColor(0,0,0)
        sceneGroup:insert(IDPTextII)

         local Problem_Behavior_List = display.newRect(display.contentWidth/2, display.contentHeight/2, 400, 75)
        Problem_Behavior_List:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(Problem_Behavior_List)

        local IDPTextIII = display.newText("Part III Know the Basics", display.contentWidth/2, display.contentHeight/2, 400, 75)
        IDPTextIII:setFillColor(0,0,0)
        sceneGroup:insert(IDPTextIII)


        local Desired_Behavior_List = display.newRect(display.contentWidth/2, display.contentHeight/2 + 100, 400, 75)
        Desired_Behavior_List:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(Desired_Behavior_List)

        local IDPTextIV = display.newText("Part IV Develope an Individualized Discipline Plan", display.contentWidth/2, display.contentHeight/2 + 100, 400, 75)
        IDPTextIV:setFillColor(0,0,0)
        sceneGroup:insert(IDPTextIV)

        local Consequence_Log = display.newRect(display.contentWidth/2, display.contentHeight/2 + 200, 400, 75)
        Consequence_Log:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(Consequence_Log)

        local IDPTextV = display.newText("Part V Implement the Individualized Discipline Plan", display.contentWidth/2, display.contentHeight/2 + 200, 400, 75)
        IDPTextV:setFillColor(0,0,0)
        sceneGroup:insert(IDPTextV)


        local Reward_Log = display.newRect(display.contentWidth/2, display.contentHeight/2 + 300, 400, 75)
        Reward_Log:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(Reward_Log)

        local IDPTextVI = display.newText("Part VI Evaluate", display.contentWidth/2, display.contentHeight/2 + 300, 400, 75)
        IDPTextVI:setFillColor(0,0,0)
        sceneGroup:insert(IDPTextVI)


        function backButtonNew:tap(event)

            composer.gotoScene("MainMenu")
        
     end

        -- this listens to see if object has been tapped
        backButtonNew:addEventListener("tap", backButtonNew)





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









