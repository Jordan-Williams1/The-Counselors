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
        -- ScrollView listener
	
		
        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth,6000)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert( background )

        local backButton = display.newRect(display.contentWidth/2 - display.contentWidth/2 + 50, display.contentHeight-display.contentHeight + 100, 70, 75)
        backButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(backButton)
--[[
        local nextButton = display.newRect(display.contentWidth - 50, display.contentHeight-display.contentHeight + 100, 70, 75)
        nextButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(nextButton)
--]]
        local pickText = display.newText("(Existing) Child Description", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText:setFillColor(0,0,0)
        sceneGroup:insert(pickText)


-----------------------------------------------------------------------		
		-- CHILD NAME
-----------------------------------------------------------------------	
        local childNameText = display.newText("Name: ", display.contentWidth/2-140, display.contentHeight-display.contentHeight + 200, 400, 75)
        childNameText.size = 40
        childNameText:setFillColor(0,0,0)
        sceneGroup:insert(childNameText)

        local childNameInfo = display.newText("Name: server info", display.contentWidth/1.5, display.contentHeight-display.contentHeight + 200, 400, 75)
        childNameInfo.size = 40
        childNameInfo:setFillColor(0,0,0)
        sceneGroup:insert(childNameInfo)

-----------------------------------------------------------------------		
		-- CHILD AGE
-----------------------------------------------------------------------	

        local childAgeText = display.newText("Age: ", display.contentWidth/2-140, display.contentHeight-display.contentHeight + 350, 400, 75)
        childAgeText.size = 40
        childAgeText:setFillColor(0,0,0)
        sceneGroup:insert(childAgeText)

        local childAgeInfo = display.newText("Age: server info", display.contentWidth/1.5, display.contentHeight-display.contentHeight + 350, 400, 75)
        childAgeInfo.size = 40
        childAgeInfo:setFillColor(0,0,0)
        sceneGroup:insert(childAgeInfo)


-----------------------------------------------------------------------		
		-- CHILD GRADE
-----------------------------------------------------------------------	
        local GradeText = display.newText("Grade: ", display.contentWidth/2-140, childAgeText.y + 150, 400, 75)
        GradeText.size = 40
        GradeText:setFillColor(0,0,0)
        sceneGroup:insert(GradeText)

        local GradeTextInfo = display.newText("Grade: server info", display.contentWidth/1.5, childAgeInfo.y + 150, 400, 75)
        GradeTextInfo.size = 40
        GradeTextInfo:setFillColor(0,0,0)
        sceneGroup:insert(GradeTextInfo)

        -- Create text field Age
        --childGrade = native.newTextField(  display.contentWidth/1.5, display.contentHeight/2-150, display.contentWidth/2, 75)
        --sceneGroup:insert(childGrade)
        --childGrade:addEventListener( "userInput", textListener )

-----------------------------------------------------------------------		
		-- DATE
-----------------------------------------------------------------------	
        local DateText = display.newText("Date: ", display.contentWidth/2-140, display.contentHeight/2, 400, 75)
        DateText.size = 40
        DateText:setFillColor(0,0,0)
        sceneGroup:insert(DateText)

        --dateField = native.newTextField(  display.contentWidth/1.5, display.contentHeight/2, display.contentWidth/2, 75)
        --sceneGroup:insert(dateField)
        --dateField:addEventListener( "userInput", textListener )

        -- function for all radion buttons
        local function onSwitchPress( event )
		    local switch = event.target
		    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
		end

-----------------------------------------------------------------------		
		-- NEW GROUP EXTROVERT OR INTROVERT
-----------------------------------------------------------------------	

		local extrovertText = display.newText("extrovert", display.contentWidth/2 - 220, display.contentWidth/2 + 420 )--, 400, 75)
        extrovertText.size = 30
        extrovertText:setFillColor(0,0,0)
        sceneGroup:insert(extrovertText)

-----------------------------------------------------------------------		
		-- NEW GROUP ACTIVE OR CALM
-----------------------------------------------------------------------		

		local activeText = display.newText("active", display.contentWidth/2 - 220, display.contentWidth/2 + 620 )--, 400, 75)
        activeText.size = 30
        activeText:setFillColor(0,0,0)
        sceneGroup:insert(activeText)

-----------------------------------------------------------------------		
		-- NEW GROUP OUTGOING OR SHY
-----------------------------------------------------------------------

		local outgoingText = display.newText("outgoing", display.contentWidth/2 + 20, display.contentWidth/2 + 420 )
        outgoingText.size = 30
        outgoingText:setFillColor(0,0,0)
        sceneGroup:insert(outgoingText)
		
-----------------------------------------------------------------------		
		-- NEW GROUP PLANNER OR IMPULSIVE
-----------------------------------------------------------------------

		local impulsiveText = display.newText("impulsive", display.contentWidth/2 + 20, display.contentWidth/2 + 700 )
        impulsiveText.size = 30
        impulsiveText:setFillColor(0,0,0)
        sceneGroup:insert(impulsiveText)

-----------------------------------------------------------------------		
		-- NEW GROUP LEADER OR FOLLOWER
-----------------------------------------------------------------------
		
		local followerText = display.newText("follower", display.contentWidth/2 + 250, display.contentWidth/2 + 500 )
        followerText.size = 30
        followerText:setFillColor(0,0,0)
        sceneGroup:insert(followerText)


-----------------------------------------------------------------------		
		-- NEW GROUP CARING OR UNCARING
-----------------------------------------------------------------------

		local uncaringText = display.newText("uncaring", display.contentWidth/2 + 250, display.contentWidth/2 + 700 )
        uncaringText.size = 30
        uncaringText:setFillColor(0,0,0)
        sceneGroup:insert(uncaringText)

-----------------------------------------------------------------------		
		-- Bottom Buttons
-----------------------------------------------------------------------

 		local cancelButton = display.newRect(display.contentWidth/2 - display.contentWidth/2 + 100, 3100, 70, 75)
        cancelButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(cancelButton)

        
       
        

        

        function backButton:tap(event)
            composer.gotoScene("addChild",Soptions)
        end


        -- this listens to see if object has been tapped
        backButton:addEventListener("tap", backButton)
      
   


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
