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

    flag = false
    --if flag == true then


    
end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        if userName.text == "jordan" and flag == false then

        local food = display.newText("click a day of the week", 350, 400, native.systemFont, 48)
        food:setFillColor(0,0,1)
        sceneGroup:insert(food)

        flag = true
        
        end



        local widget = require( "widget" )

-- The "onRowRender" function may go here (see example under "Inserting Rows", above)


local function onRowRender( event )

    -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

    local rowTitle = display.newText( row, "TIM" .. row.index, 0, 0, nil, 14 )
    rowTitle:setFillColor( 0 )

    -- Align the label left and vertically centered
    rowTitle.anchorX = 0
    rowTitle.x = 0
    rowTitle.y = rowHeight * 0.5
end

-- Create the widget
local tableView = widget.newTableView(
    {
        left = 10,
        top = 200,
        height = 290,
        width = 600,
        onRowRender = onRowRender,
        onRowTouch = onRowTouch,
        listener = scrollListener
    }
)

-- Insert 40 rows
-- Insert 40 rows
for i = 1, 10 do

    local isCategory = false
    local rowHeight = 36
    local rowColor = { default={1,1,1}, over={1,0.5,0,0.2} }
    local lineColor = { 0.5, 0.5, 0.5 }

    -- Make some rows categories
    if ( i == 1 or i == 21 ) then
        isCategory = true
        rowHeight = 50
        rowColor = { default={0.8,0.8,0.8,0.8} }
        lineColor = { 1, 0, 0 }
    end

    -- Insert a row into the tableView
    tableView:insertRow(
        {
            isCategory = isCategory,
            rowHeight = rowHeight,
            rowColor = rowColor,
            lineColor = lineColor

        }
    )
end
sceneGroup:insert(tableView)

        local Main = display.newText("Account of: ", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        Main.size = 40
        sceneGroup:insert(Main)

        local back = display.newRect(display.contentWidth/2 - 270, display.contentHeight/2 - 480, 70, 75)
        back:setFillColor(0,1,0)
        sceneGroup:insert(back)

        local IDP_Reference = display.newRect(display.contentWidth/2, display.contentHeight/2, 400, 75)
        IDP_Reference:setFillColor(0,1,0)
        sceneGroup:insert(IDP_Reference)

        local family_Schedule = display.newRect(display.contentWidth/2, display.contentHeight/2 + 100, 400, 75)
        family_Schedule:setFillColor(0,1,0)
        sceneGroup:insert(family_Schedule)

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






        -- changing text to password from signIn.lua
        --Main.text = userName.text

        
        

        function back:tap(event)
    
         print("here")
          composer.gotoScene("signIn", options)
          Main:removeSelf()
          back:removeSelf()
    
        end

        -- this listens to see if object has been tapped
        back:addEventListener("tap", back)

        
       
    

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