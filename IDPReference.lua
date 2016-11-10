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

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

       


        local IDP_Reference = display.newRect(display.contentWidth/2, display.contentHeight/2-200, 400, 75)
        IDP_Reference:setFillColor(0,1,0)
        sceneGroup:insert(IDP_Reference)

        local family_Schedule = display.newRect(display.contentWidth/2, display.contentHeight/2 - 100, 400, 75)
        family_Schedule:setFillColor(0,1,0)
        sceneGroup:insert(family_Schedule)

         local Problem_Behavior_List = display.newRect(display.contentWidth/2, display.contentHeight/2, 400, 75)
        Problem_Behavior_List:setFillColor(0,1,0)
        sceneGroup:insert(Problem_Behavior_List)

        local Desired_Behavior_List = display.newRect(display.contentWidth/2, display.contentHeight/2 + 100, 400, 75)
        Desired_Behavior_List:setFillColor(0,1,0)
        sceneGroup:insert(Desired_Behavior_List)

        local Consequence_Log = display.newRect(display.contentWidth/2, display.contentHeight/2 + 200, 400, 75)
        Consequence_Log:setFillColor(0,1,0)
        sceneGroup:insert(Consequence_Log)

        local Reward_Log = display.newRect(display.contentWidth/2, display.contentHeight/2 + 300, 400, 75)
        Reward_Log:setFillColor(0,1,0)
        sceneGroup:insert(Reward_Log)

     




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









