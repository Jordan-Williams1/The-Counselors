local composer = require( "composer" )
local widget = require("widget")
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
    composer.removeScene("addChild")
    composer.removeScene("newChildProblemBehaviorsI")


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
		        scrollHeight = 3200,
		        listener = scrollListener
		    }
		)

		sceneGroup:insert(scrollView)

		
        

        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth,6000)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)
        scrollView:insert( background )




        local defaultField

        local function textListener( event )

            if ( event.phase == "began" ) then
                -- User begins editing "defaultField"

            elseif ( event.phase == "ended" or event.phase == "submitted" ) then
                -- Output resulting text from "defaultField"
               
                -- once the user inputs their user name then we can use it.
        

            elseif ( event.phase == "editing" ) then
                print( event.newCharacters )
                print( event.oldText )
                print( event.startPosition )
                print( event.text )
            end
        end


        local backButton = display.newRect(display.contentWidth/2 - display.contentWidth/2 + 50, display.contentHeight-display.contentHeight + 100, 70, 75)
        backButton:setFillColor(0.372549, 0.619608, 0.627451)
        scrollView:insert(backButton)

        local backButton2 = display.newRect(display.contentWidth/2 - display.contentWidth/2 + 50, display.contentHeight-display.contentHeight + 200, 70, 75)
        backButton2:setFillColor(0.372549, 0.619608, 0.627451)
        scrollView:insert(backButton2)


        local pickText = display.newText("New Child Description", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText:setFillColor(0,0,0)
        scrollView:insert(pickText)

         -- Create text field Name
        local childName = native.newTextField( display.contentWidth/1.5, display.contentHeight-display.contentHeight + 200, display.contentWidth/2, 75)
        scrollView:insert(childName)
        childName:addEventListener( "userInput", textListener )

        local childNameText = display.newText("Name: ", display.contentWidth/2-140, display.contentHeight-display.contentHeight + 200, 400, 75)
        childNameText.size = 40
        childNameText:setFillColor(0,0,0)
        scrollView:insert(childNameText)

        -- Create text field Age
        childAge = native.newTextField(  display.contentWidth/1.5, display.contentHeight-display.contentHeight + 350, display.contentWidth/2, 75)
        scrollView:insert(childAge)
        childAge:addEventListener( "userInput", textListener )

        local childAgeText = display.newText("Age: ", display.contentWidth/2-140, display.contentHeight-display.contentHeight + 350, 400, 75)
        childAgeText.size = 40
        childAgeText:setFillColor(0,0,0)
        scrollView:insert(childAgeText)

        local GradeText = display.newText("Grade: ", display.contentWidth/2-140, display.contentHeight/2-150, 400, 75)
        GradeText.size = 40
        GradeText:setFillColor(0,0,0)
        scrollView:insert(GradeText)

        -- Create text field Age
        childGrade = native.newTextField(  display.contentWidth/1.5, display.contentHeight/2-150, display.contentWidth/2, 75)
        scrollView:insert(childGrade)
        childGrade:addEventListener( "userInput", textListener )

        local DateText = display.newText("Date: ", display.contentWidth/2-140, display.contentHeight/2, 400, 75)
        DateText.size = 40
        DateText:setFillColor(0,0,0)
        scrollView:insert(DateText)

        dateField = native.newTextField(  display.contentWidth/1.5, display.contentHeight/2, display.contentWidth/2, 75)
        scrollView:insert(dateField)
        dateField:addEventListener( "userInput", textListener )

        -- function for all radion buttons
        local function onSwitchPress( event )
		    local switch = event.target
		    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
		end

-----------------------------------------------------------------------		
		-- NEW GROUP EXTROVERT OR INTROVERT
-----------------------------------------------------------------------	

		-- Create a group for the radio button set
		local extrovertIntrovert = display.newGroup()
		scrollView:insert(extrovertIntrovert)


		-- Create two associated radio buttons (inserted into the same display group)
		local extrovert = widget.newSwitch(
		    {
		        left = 150,
		        top = 200,
		        style = "radio",
		        id = "extrovert",
		        initialSwitchState = true,
		        onPress = onSwitchPress
		    }
		)
		extrovert.x = display.contentWidth/2 - 320 
		extrovert.y = display.contentWidth/2 + 420 
		extrovertIntrovert:insert( extrovert )

		local extrovertText = display.newText("extrovert", display.contentWidth/2 - 220, display.contentWidth/2 + 420 )--, 400, 75)
        extrovertText.size = 30
        extrovertText:setFillColor(0,0,0)
        scrollView:insert(extrovertText)

		

		local introvert = widget.newSwitch(
		    {
		        left = 250,
		        top = 200,
		        style = "radio",
		        id = "introvert",
		        onPress = onSwitchPress
		    }
		)

		introvert.x = display.contentWidth/2 - 320 
		introvert.y = display.contentWidth/2 + 500 
		extrovertIntrovert:insert( introvert )

		local introvertText = display.newText("introvert", display.contentWidth/2 - 220, display.contentWidth/2 + 500 )--, 400, 75)
        introvertText.size = 30
        introvertText:setFillColor(0,0,0)
        scrollView:insert(introvertText)
		

-----------------------------------------------------------------------		
		-- NEW GROUP ACTIVE OR CALM
-----------------------------------------------------------------------		

		local activeCalm = display.newGroup()
		scrollView:insert(activeCalm)

		local active = widget.newSwitch(
		    {
		        left = 150,
		        top = 200,
		        style = "radio",
		        id = "active",
		        initialSwitchState = true,
		        onPress = onSwitchPress
		    }
		)
		active.x = display.contentWidth/2 - 320 
		active.y = display.contentWidth/2 + 620 
		activeCalm:insert( active )

		local activeText = display.newText("active", display.contentWidth/2 - 220, display.contentWidth/2 + 620 )--, 400, 75)
        activeText.size = 30
        activeText:setFillColor(0,0,0)
        scrollView:insert(activeText)
		
		

		local calm = widget.newSwitch(
		    {
		        left = 250,
		        top = 200,
		        style = "radio",
		        id = "calm",
		        onPress = onSwitchPress
		    }
		)

		calm.x = display.contentWidth/2 - 320 
		calm.y = display.contentWidth/2 + 700 
		activeCalm:insert( calm )
		
		local calmText = display.newText("calm", display.contentWidth/2 - 220, display.contentWidth/2 + 700 )--, 400, 75)
        calmText.size = 30
        calmText:setFillColor(0,0,0)
        scrollView:insert(calmText)

-----------------------------------------------------------------------		
		-- NEW GROUP OUTGOING OR SHY
-----------------------------------------------------------------------
	
		local outgoingShy = display.newGroup()
		scrollView:insert(outgoingShy)

		local outgoing = widget.newSwitch(
		    {
		        left = 150,
		        top = 200,
		        style = "radio",
		        id = "outgoing",
		        initialSwitchState = true,
		        onPress = onSwitchPress
		    }
		)
		outgoing.x = display.contentWidth/2 - 80 
		outgoing.y = display.contentWidth/2 + 420 
		outgoingShy:insert( outgoing )

		local outgoingText = display.newText("outgoing", display.contentWidth/2 + 20, display.contentWidth/2 + 420 )
        outgoingText.size = 30
        outgoingText:setFillColor(0,0,0)
        scrollView:insert(outgoingText)
		

		local shy = widget.newSwitch(
		    {
		        left = 250,
		        top = 200,
		        style = "radio",
		        id = "shy",
		        onPress = onSwitchPress
		    }
		)

		shy.x = display.contentWidth/2 - 80 
		shy.y = display.contentWidth/2 + 500 
		outgoingShy:insert( shy )

		local shyText = display.newText("shy", display.contentWidth/2 + 20, display.contentWidth/2 + 500 )
        shyText.size = 30
        shyText:setFillColor(0,0,0)
        scrollView:insert(shyText)

-----------------------------------------------------------------------		
		-- NEW GROUP PLANNER OR IMPULSIVE
-----------------------------------------------------------------------

		local plannerImpulsive = display.newGroup()
		scrollView:insert(plannerImpulsive)

		local planner = widget.newSwitch(
		    {
		        left = 150,
		        top = 200,
		        style = "radio",
		        id = "planner",
		        initialSwitchState = true,
		        onPress = onSwitchPress
		    }
		)
		planner.x = display.contentWidth/2 - 80 
		planner.y = display.contentWidth/2 + 620 
		plannerImpulsive:insert( planner )

		local plannerText = display.newText("planner", display.contentWidth/2 + 20, display.contentWidth/2 + 620 )
        plannerText.size = 30
        plannerText:setFillColor(0,0,0)
        scrollView:insert(plannerText)
		

		local impulsive = widget.newSwitch(
		    {
		        left = 250,
		        top = 200,
		        style = "radio",
		        id = "impulsive",
		        onPress = onSwitchPress
		    }
		)

		impulsive.x = display.contentWidth/2 - 80 
		impulsive.y = display.contentWidth/2 + 700 
		plannerImpulsive:insert( impulsive )

		local impulsiveText = display.newText("impulsive", display.contentWidth/2 + 20, display.contentWidth/2 + 700 )
        impulsiveText.size = 30
        impulsiveText:setFillColor(0,0,0)
        scrollView:insert(impulsiveText)

-----------------------------------------------------------------------		
		-- NEW GROUP LEADER OR FOLLOWER
-----------------------------------------------------------------------
		
		local leaderFollower = display.newGroup()
		scrollView:insert(leaderFollower)

		local leader = widget.newSwitch(
		    {
		        left = 150,
		        top = 200,
		        style = "radio",
		        id = "leader",
		        initialSwitchState = true,
		        onPress = onSwitchPress
		    }
		)
		leader.x = display.contentWidth/2 + 150 
		leader.y = display.contentWidth/2 + 420 
		leaderFollower:insert( leader )

		local leaderText = display.newText("leader", display.contentWidth/2 + 250, display.contentWidth/2 + 420 )
        leaderText.size = 30
        leaderText:setFillColor(0,0,0)
        scrollView:insert(leaderText)

		

		local follower = widget.newSwitch(
		    {
		        left = 250,
		        top = 200,
		        style = "radio",
		        id = "follower",
		        onPress = onSwitchPress
		    }
		)

		follower.x = display.contentWidth/2 + 150 
		follower.y = display.contentWidth/2 + 500 
		leaderFollower:insert( follower )

		local followerText = display.newText("follower", display.contentWidth/2 + 250, display.contentWidth/2 + 500 )
        followerText.size = 30
        followerText:setFillColor(0,0,0)
        scrollView:insert(followerText)


-----------------------------------------------------------------------		
		-- NEW GROUP CARING OR UNCARING
-----------------------------------------------------------------------

        local caringUncaring = display.newGroup()
		scrollView:insert(caringUncaring)

		local caring = widget.newSwitch(
		    {
		        left = 150,
		        top = 200,
		        style = "radio",
		        id = "caring",
		        initialSwitchState = true,
		        onPress = onSwitchPress
		    }
		)
		caring.x = display.contentWidth/2 + 150 
		caring.y = display.contentWidth/2 + 620 
		caringUncaring:insert( caring )
		

		local caringText = display.newText("caring", display.contentWidth/2 + 250, display.contentWidth/2 + 620 )
        caringText.size = 30
        caringText:setFillColor(0,0,0)
        scrollView:insert(caringText)

		local uncaring = widget.newSwitch(
		    {
		        left = 250,
		        top = 200,
		        style = "radio",
		        id = "uncaring",
		        onPress = onSwitchPress
		    }
		)

		uncaring.x = display.contentWidth/2 + 150 
		uncaring.y = display.contentWidth/2 + 700 
		caringUncaring:insert( uncaring )


		local uncaringText = display.newText("uncaring", display.contentWidth/2 + 250, display.contentWidth/2 + 700 )
        uncaringText.size = 30
        uncaringText:setFillColor(0,0,0)
        scrollView:insert(uncaringText)
-----------------------------------------------------------------------		
		-- STRENGTHS TEXTBOX
-----------------------------------------------------------------------

		local strengthsText = display.newText("Strengths", display.contentWidth/2, display.contentWidth/2 + 800 )
        strengthsText.size = 40
        strengthsText:setFillColor(0,0,0)
        scrollView:insert(strengthsText)

        strengthsBox = native.newTextBox( display.contentWidth/2, display.contentWidth/2 + 900 , 600, 150 )
		strengthsBox.isEditable = true
		strengthsBox:addEventListener( "userInput", textListener )
		scrollView:insert(strengthsBox)

-----------------------------------------------------------------------		
		-- WEAKNESS TEXTBOX
-----------------------------------------------------------------------

		local weaknessText = display.newText("Weaknesses", display.contentWidth/2, strengthsBox.y + 200 )
        weaknessText.size = 40
        weaknessText:setFillColor(0,0,0)
        scrollView:insert(weaknessText)
 		
 		weaknessBox = native.newTextBox( display.contentWidth/2, strengthsBox.y + 300, 600, 150 )
		weaknessBox.isEditable = true
		weaknessBox:addEventListener( "userInput", textListener )
		scrollView:insert(weaknessBox)

-----------------------------------------------------------------------		
		-- MATURITY LEVEL
-----------------------------------------------------------------------
         
        local maturityText = display.newText("Maturity Level", display.contentWidth/2, weaknessBox.y + 220 )
        maturityText.size = 40
        maturityText:setFillColor(0,0,0)
        scrollView:insert(maturityText)
 		
 		maturityBox = native.newTextBox( display.contentWidth/2, weaknessBox.y + 300, 600, 110 )
		maturityBox.isEditable = true
		maturityBox:addEventListener( "userInput", textListener )
		scrollView:insert(maturityBox)

-----------------------------------------------------------------------		
		-- INTERESTS
-----------------------------------------------------------------------

		local interestsText = display.newText("Interests", display.contentWidth/2, maturityBox.y + 200 )
        interestsText.size = 40
        interestsText:setFillColor(0,0,0)
        scrollView:insert(interestsText)

        interestsBox = native.newTextBox( display.contentWidth/2, maturityBox.y + 300, 600, 150 )
		interestsBox.isEditable = true
		interestsBox:addEventListener( "userInput", textListener )
		scrollView:insert(interestsBox)

-----------------------------------------------------------------------		
		-- DISCIPLINE WORKED IN PAST
-----------------------------------------------------------------------

		local successfulDiscliplineText = display.newText("Discipline that has worked in the past", display.contentWidth/2, interestsBox.y + 200 )
        successfulDiscliplineText.size = 35
        successfulDiscliplineText:setFillColor(0,0,0)
        scrollView:insert(successfulDiscliplineText)

        successfulDiscliplineBox = native.newTextBox( display.contentWidth/2, interestsBox.y + 300, 600, 150 )
		successfulDiscliplineBox.isEditable = true
		successfulDiscliplineBox:addEventListener( "userInput", textListener )
		scrollView:insert(successfulDiscliplineBox)

-----------------------------------------------------------------------		
		-- DISCIPLINE THAT HAS WORKED IN PAST
-----------------------------------------------------------------------

		local successfulDiscliplineText = display.newText("Discipline that has worked in the past", display.contentWidth/2, interestsBox.y + 200 )
        successfulDiscliplineText.size = 35
        successfulDiscliplineText:setFillColor(0,0,0)
        scrollView:insert(successfulDiscliplineText)

        successfulDiscliplineBox = native.newTextBox( display.contentWidth/2, interestsBox.y + 300, 600, 150 )
		successfulDiscliplineBox.isEditable = true
		successfulDiscliplineBox:addEventListener( "userInput", textListener )
		scrollView:insert(successfulDiscliplineBox)

-----------------------------------------------------------------------		
		-- DISCIPLINE THAT HAS NOT WORKED IN PAST
-----------------------------------------------------------------------

		local unsuccessfulDiscliplineText = display.newText("Discipline that has not worked in the past", display.contentWidth/2, successfulDiscliplineBox.y + 200 )
        unsuccessfulDiscliplineText.size = 35
        unsuccessfulDiscliplineText:setFillColor(0,0,0)
        scrollView:insert(unsuccessfulDiscliplineText)

        unsuccessfulDiscliplineBox = native.newTextBox( display.contentWidth/2, successfulDiscliplineBox.y + 300, 600, 150 )
		unsuccessfulDiscliplineBox.isEditable = true
		unsuccessfulDiscliplineBox:addEventListener( "userInput", textListener )
		scrollView:insert(unsuccessfulDiscliplineBox)

-----------------------------------------------------------------------		
		-- Bottom Buttons
-----------------------------------------------------------------------

 		local cancelButton = display.newRect(display.contentWidth/2 - display.contentWidth/2 + 100, 3100, 70, 75)
        cancelButton:setFillColor(0.372549, 0.619608, 0.627451)
        scrollView:insert(cancelButton)

        local nextButton = display.newRect(display.contentWidth/2 + display.contentWidth/2  - 100, 3100, 70, 75)
        nextButton:setFillColor(0.372549, 0.619608, 0.627451)
        scrollView:insert(nextButton)



        function nextButton:tap(event)
            composer.gotoScene("newChildProblemBehaviorsI",Soptions)
        end

        function backButton:tap(event)
            composer.gotoScene("addChild",Soptions)
        end


        


		scrollView:setScrollHeight(3200)

        -- this listens to see if object has been tapped
        backButton:addEventListener("tap", backButton)
        nextButton:addEventListener("tap", nextButton)




        --function childButton:tap(event)

       --     composer.gotoScene("childInformation")
        
       -- end

        -- this listens to see if object has been tapped
       -- childButton:addEventListener("tap", childButton)


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
