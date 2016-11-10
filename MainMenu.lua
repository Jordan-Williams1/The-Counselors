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

    

    -- this is the key to displaying certain information ONLY 
    -- It works the first time, but you can't go back and have it work twice once already logged in.
    -- ex. type in jordan for username and then text will show up, then go back and type in tim. it will still work, and it shouldn't

   
   

    
end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

     flag = false

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        if userName.text == "jordan" and flag == false then

        local food = display.newText("click a day of the week", display.contentWidth/2, display.contentHeight-display.contentHeight + 200, native.systemFont, 48)
        food:setFillColor(0,1,0)
        sceneGroup:insert(food)

        flag = true
        
        end


local widget = require( "widget" )

-- ScrollView listener
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
        top = 100,
        left = 10,
        width = 500,
        height = 300,
        scrollWidth = 800,
        scrollHeight = 400,
        listener = scrollListener
    }
)
sceneGroup:insert(scrollView)

scrollView.x = display.contentWidth/2
scrollView.y = 350

-- Create a image and insert it into the scroll view


local box = display.newRect(scrollView.width/2, scrollView.height/2, 70, 75)
box:setFillColor(0,1,0)
scrollView:insert(box)

scrollView:setScrollWidth(800)




        local Main = display.newText("Account of: ", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        Main.size = 40
        sceneGroup:insert(Main)

        local back = display.newRect(display.contentWidth/2 - 270, display.contentHeight/2 - 480, 70, 75)
        back:setFillColor(0,1,0)
        sceneGroup:insert(back)

        local IDP_Reference = display.newRect(display.contentWidth/2, display.contentHeight/2, 400, 75)
        IDP_Reference:setFillColor(0,1,0)
        sceneGroup:insert(IDP_Reference)


        local IDP_TEXT = display.newText("IDP Reference", display.contentWidth/2+50, display.contentHeight/2, 400, 75)
        IDP_TEXT.size = 40
        IDP_TEXT:setFillColor(0,0,0)
        sceneGroup:insert(IDP_TEXT)

        local family_Schedule = display.newRect(display.contentWidth/2, display.contentHeight/2 + 100, 400, 75)
        family_Schedule:setFillColor(0,1,0)
        sceneGroup:insert(family_Schedule)


        local FAMILY_TEXT = display.newText("Family Schedule", display.contentWidth/2+50, display.contentHeight/2 + 100, 400, 75)
        FAMILY_TEXT.size = 40
        FAMILY_TEXT:setFillColor(0,0,0)
        sceneGroup:insert(FAMILY_TEXT)

         local Problem_Behavior_List = display.newRect(display.contentWidth/2, display.contentHeight/2 + 200, 400, 75)
        Problem_Behavior_List:setFillColor(0,1,0)
        sceneGroup:insert(Problem_Behavior_List)

        local Desired_Behavior_List = display.newRect(display.contentWidth/2, display.contentHeight/2 + 300, 400, 75)
        Desired_Behavior_List:setFillColor(0,1,0)
        sceneGroup:insert(Desired_Behavior_List)

        local Consequence_Log = display.newRect(display.contentWidth/2, display.contentHeight/2 + 400, 400, 75)
        Consequence_Log:setFillColor(0,1,0)
        sceneGroup:insert(Consequence_Log)

        local Reward_Log = display.newRect(display.contentWidth/2, display.contentHeight/2 + 500, 400, 75)
        Reward_Log:setFillColor(0,1,0)
        sceneGroup:insert(Reward_Log)





       -- local options =
       -- {
       --     Password = Password.text,
       --     userName = userName.text,
    
        --    params = {
        --        userName, 
        --        Password
        --    }
        --}

        
        

        function back:tap(event)
    
         print("here")
          composer.gotoScene("signIn", options)
          Main:removeSelf()
          back:removeSelf()
    
        end

        -- this listens to see if object has been tapped
        back:addEventListener("tap", back)

         

         function IDP_Reference:tap(event)
    
          composer.gotoScene("IDPReference", options)
        end

        -- this listens to see if object has been tapped
        IDP_Reference:addEventListener("tap", IDP_Reference)


        
       
    

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