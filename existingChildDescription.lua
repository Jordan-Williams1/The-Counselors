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
	
		
        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth,6000)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        scrollView:insert( background )

         local backButtonNew = widget.newButton(
		    {
		        id = "backButtonNew",
		        defaultFile = "backArrow3.png",
		        onEvent = handleButtonEvent
		    }
		)

		backButtonNew.x = display.contentWidth/2 - 320 
		backButtonNew.y = display.contentHeight - display.contentHeight + 100
		scrollView:insert(backButtonNew)

         function backButtonNew:tap(event)

            composer.gotoScene("childInformation", Soptions)
        
        end

        -- this listens to see if object has been tapped
        backButtonNew:addEventListener("tap", backButtonNew)
--[[
        local nextButton = display.newRect(display.contentWidth - 50, display.contentHeight-display.contentHeight + 100, 70, 75)
        nextButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(nextButton)
--]]
        local pickText = display.newText("(Existing) Child Description", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText:setFillColor(0,0,0)
        scrollView:insert(pickText)


-----------------------------------------------------------------------		
		-- CHILD NAME
-----------------------------------------------------------------------	
        local childNameText = display.newText("Name: ", display.contentWidth/2-140, display.contentHeight-display.contentHeight + 200, 400, 75)
        childNameText.size = 40
        childNameText:setFillColor(0,0,0)
        scrollView:insert(childNameText)

        local childNameInfo = display.newText("Name: server info", display.contentWidth/1.5, display.contentHeight-display.contentHeight + 200, 400, 75)
        childNameInfo.size = 40
        childNameInfo:setFillColor(0,0,0)
        scrollView:insert(childNameInfo)

-----------------------------------------------------------------------		
		-- CHILD AGE
-----------------------------------------------------------------------	

        local childAgeText = display.newText("Age: ", display.contentWidth/2-140, childNameText.y + 100, 400, 75)
        childAgeText.size = 40
        childAgeText:setFillColor(0,0,0)
        scrollView:insert(childAgeText)

        local childAgeInfo = display.newText("Age: server info", display.contentWidth/1.5, childNameInfo.y + 100, 400, 75)
        childAgeInfo.size = 40
        childAgeInfo:setFillColor(0,0,0)
        scrollView:insert(childAgeInfo)


-----------------------------------------------------------------------		
		-- CHILD GRADE
-----------------------------------------------------------------------	
        local GradeText = display.newText("Grade: ", display.contentWidth/2-140, childAgeText.y + 100, 400, 75)
        GradeText.size = 40
        GradeText:setFillColor(0,0,0)
        scrollView:insert(GradeText)

        local GradeTextInfo = display.newText("Grade: server info", display.contentWidth/1.5, childAgeInfo.y + 100, 400, 75)
        GradeTextInfo.size = 40
        GradeTextInfo:setFillColor(0,0,0)
        scrollView:insert(GradeTextInfo)

-----------------------------------------------------------------------		
		-- PERSONALITY AND TEMPERAMENT
-----------------------------------------------------------------------	
        local personalityTempermaent = display.newText("Personality and Tempermaent: ", display.contentWidth/2+60, GradeText.y + 150, 800, 75)
        personalityTempermaent.size = 50
        personalityTempermaent.font = native.systemFontBold
        personalityTempermaent:setFillColor(0,0,0)
        scrollView:insert(personalityTempermaent)

-----------------------------------------------------------------------		
		-- NEW GROUP EXTROVERT OR INTROVERT
-----------------------------------------------------------------------	

		local extrovertText = display.newText("extrovert", display.contentWidth/2-270, personalityTempermaent.y + 100 )--, 400, 75)
        extrovertText.size = 30
        extrovertText:setFillColor(0,0,0)
        scrollView:insert(extrovertText)

-----------------------------------------------------------------------		
		-- NEW GROUP ACTIVE OR CALM
-----------------------------------------------------------------------		

		local activeText = display.newText("active", display.contentWidth/2-270, extrovertText.y + 80 )--, 400, 75)
        activeText.size = 30
        activeText:setFillColor(0,0,0)
        scrollView:insert(activeText)

-----------------------------------------------------------------------		
		-- NEW GROUP OUTGOING OR SHY
-----------------------------------------------------------------------

		local outgoingText = display.newText("outgoing", display.contentWidth/2-270, activeText.y + 80 )
        outgoingText.size = 30
        outgoingText:setFillColor(0,0,0)
        scrollView:insert(outgoingText)
		
-----------------------------------------------------------------------		
		-- NEW GROUP PLANNER OR IMPULSIVE
-----------------------------------------------------------------------

		local impulsiveText = display.newText("impulsive", display.contentWidth/2-270, outgoingText.y + 80 )
        impulsiveText.size = 30
        impulsiveText:setFillColor(0,0,0)
        scrollView:insert(impulsiveText)

-----------------------------------------------------------------------		
		-- NEW GROUP LEADER OR FOLLOWER
-----------------------------------------------------------------------
		
		local followerText = display.newText("follower", display.contentWidth/2-270, impulsiveText.y + 80 )
        followerText.size = 30
        followerText:setFillColor(0,0,0)
        scrollView:insert(followerText)


-----------------------------------------------------------------------		
		-- NEW GROUP CARING OR UNCARING
-----------------------------------------------------------------------

		local uncaringText = display.newText("uncaring", display.contentWidth/2-270, followerText.y + 80 )
        uncaringText.size = 30
        uncaringText:setFillColor(0,0,0)
        scrollView:insert(uncaringText)
-----------------------------------------------------------------------		
		-- STRENGTHS
-----------------------------------------------------------------------

 		local StrengthsText = display.newText("Strengths: ", display.contentWidth/2-140, uncaringText.y + 100, 400, 75)
        StrengthsText.size = 45
        StrengthsText.font = native.systemFontBold
        StrengthsText:setFillColor(0,0,0)
        scrollView:insert(StrengthsText)

        local StrengthsTextInfo = display.newText("StrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsok", display.contentWidth/2, StrengthsText.y + 100, display.contentWidth/2+200, 150)
        StrengthsTextInfo.size = 30
        StrengthsTextInfo:setFillColor(0,0,0)
        scrollView:insert(StrengthsTextInfo)


-----------------------------------------------------------------------		
		-- WEAKNESSES
-----------------------------------------------------------------------
		local WeaknessesText = display.newText("Weaknesses: ", display.contentWidth/2-140, StrengthsText.y + 200, 400, 75)
        WeaknessesText.size = 45
        WeaknessesText.font = native.systemFontBold
        WeaknessesText:setFillColor(0,0,0)
        scrollView:insert(WeaknessesText)

        local WeaknessesInfo = display.newText("StrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsok", display.contentWidth/2, WeaknessesText.y + 100, display.contentWidth/2+200, 150)
        WeaknessesInfo.size = 30
        WeaknessesInfo:setFillColor(0,0,0)
        scrollView:insert(WeaknessesInfo)
-----------------------------------------------------------------------		
		-- MATURITY LEVEL
-----------------------------------------------------------------------
		local MaturityText = display.newText("Maturity: ", display.contentWidth/2-140, WeaknessesText.y + 200, 400, 75)
        MaturityText.size = 45
        MaturityText.font = native.systemFontBold
        MaturityText:setFillColor(0,0,0)
        scrollView:insert(MaturityText)

        local MaturityInfo = display.newText("StrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsok", display.contentWidth/2, MaturityText.y + 100, display.contentWidth/2+200, 150)
        MaturityInfo.size = 30
        MaturityInfo:setFillColor(0,0,0)
        scrollView:insert(MaturityInfo)
-----------------------------------------------------------------------		
		-- INTERESTS
-----------------------------------------------------------------------
		local interestText = display.newText("Interests: ", display.contentWidth/2-140, MaturityText.y + 200, 400, 75)
        interestText.size = 45
        interestText.font = native.systemFontBold
        interestText:setFillColor(0,0,0)
        scrollView:insert(interestText)

        local interestInfo = display.newText("StrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsok", display.contentWidth/2, interestText.y + 100, display.contentWidth/2+200, 150)
        interestInfo.size = 30
        interestInfo:setFillColor(0,0,0)
        scrollView:insert(interestInfo)

-----------------------------------------------------------------------		
		-- DISCIPLINE WORKED IN PAST
-----------------------------------------------------------------------
		local disciplineWorkedText = display.newText("Discipline that worked in the past: ", display.contentWidth/2+60, interestText.y + 200, 800, 75)
        disciplineWorkedText.size = 45
        disciplineWorkedText.font = native.systemFontBold
        disciplineWorkedText:setFillColor(0,0,0)
        scrollView:insert(disciplineWorkedText)

        local disciplineWorkedInfo = display.newText("StrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsok", display.contentWidth/2, disciplineWorkedText.y + 100, display.contentWidth/2+200, 150)
        disciplineWorkedInfo.size = 30
        disciplineWorkedInfo:setFillColor(0,0,0)
        scrollView:insert(disciplineWorkedInfo)

-----------------------------------------------------------------------		
		-- DISCIPLINE NOT WORKED IN PAST
-----------------------------------------------------------------------
		local disciplineNotWorkedText = display.newText("Discipline that worked in the past: ", display.contentWidth/2+60, disciplineWorkedText.y + 200, 800, 75)
        disciplineNotWorkedText.size = 45
        disciplineNotWorkedText.font = native.systemFontBold
        disciplineNotWorkedText:setFillColor(0,0,0)
        scrollView:insert(disciplineNotWorkedText)

         local disciplineNotWorkedInfo = display.newText("StrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsStrengthsok", display.contentWidth/2, disciplineNotWorkedText.y + 100, display.contentWidth/2+200, 150)
        disciplineNotWorkedInfo.size = 30
        disciplineNotWorkedInfo:setFillColor(0,0,0)
        scrollView:insert(disciplineNotWorkedInfo)

-----------------------------------------------------------------------		
		-- Bottom Buttons
-----------------------------------------------------------------------

 		local cancelButton = display.newRect(display.contentWidth/2 - display.contentWidth/2 + 100, 3100, 70, 75)
        cancelButton:setFillColor(0.372549, 0.619608, 0.627451)
        scrollView:insert(cancelButton)
     	
      	scrollView:setScrollHeight(3200)

   


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
