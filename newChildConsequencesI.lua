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
    composer.removeScene("newChildConsequencesII")
    composer.removeScene("newChildProblemBehaviorsII")
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
        Soptions.params.behaviors2 = event.params
    end

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)

        local pickText = display.newText("Child Consequences I", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText:setFillColor(0,0,0)
        sceneGroup:insert(pickText)

        local nextButton = display.newRect(display.contentWidth - 50, display.contentHeight-display.contentHeight + 100, 70, 75)
        nextButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(nextButton)

        

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

       
       --[[
        -- Create the widget
        local lyingButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox",
                onPress = onSwitchPress
            }
        )
        lyingButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        lyingButton.y = pickText.y + 200
        scrollView:insert(lyingButton)
--]]

-----------------------------------------------------------------------     
        -- SWATTS WITH PADDLE
-----------------------------------------------------------------------  
        -- Create the widget
        local swattPunshiment = widget.newButton(
            {
                --width = 500,
                --heigth = 500,
                id = "IDP_Reference",
                defaultFile = "swatts.png",
                onEvent = handleButtonEvent
            }
        )

        swattPunshiment.x = display.contentWidth/2 
        swattPunshiment.y = display.contentHeight/2-400
        sceneGroup:insert(swattPunshiment)



        -- Create the checkbox
        local swattPunshimentButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox",
                onPress = onSwitchPress
            }
        )
        swattPunshimentButton.x = display.contentWidth/2 - 250
        swattPunshimentButton.y = display.contentHeight/2-400
        sceneGroup:insert(swattPunshimentButton)

        --function swattPunshiment:tap(event)

        --    swattPunshimentButton = swattPunshimentButton.isOn
            
       -- end

        -- this listens to see if object has been tapped
       -- swattPunshiment:addEventListener("tap", swattPunshiment)


-----------------------------------------------------------------------     
        -- TIME-OUT
-----------------------------------------------------------------------  
        
        -- Create the widget
        local timeOutPunshiment = widget.newButton(
            {
                --width = 500,
                --heigth = 500,
                id = "family_Schedule",
                defaultFile = "time-out.png",
                onEvent = handleButtonEvent
            }
        )

        timeOutPunshiment.x = display.contentWidth/2 
        timeOutPunshiment.y = swattPunshiment.y + 120
        sceneGroup:insert(timeOutPunshiment)

        -- Create the checkbox
        local timeOutPunshimentButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox",
                onPress = onSwitchPress
            }
        )
        timeOutPunshimentButton.x = display.contentWidth/2 - 250
        timeOutPunshimentButton.y = swattPunshiment.y + 120
        sceneGroup:insert(timeOutPunshimentButton)

-----------------------------------------------------------------------     
        -- TALKING TIME-OUT
-----------------------------------------------------------------------  

         -- Create the widget
        local talkingTimeOutPunshiment = widget.newButton(
            {
                --width = 500,
                --heigth = 500,
                id = "Problem_Behavior_List",
                defaultFile = "talking time-out.png",
                onEvent = handleButtonEvent
            }
        )

        talkingTimeOutPunshiment.x = display.contentWidth/2 
        talkingTimeOutPunshiment.y = timeOutPunshiment.y + 120
        sceneGroup:insert(talkingTimeOutPunshiment)

        -- Create the checkbox
        local talkingTimeOutPunshimentButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox",
                onPress = onSwitchPress
            }
        )
        talkingTimeOutPunshimentButton.x = talkingTimeOutPunshiment.x - 250
        talkingTimeOutPunshimentButton.y = timeOutPunshiment.y + 120
        sceneGroup:insert(talkingTimeOutPunshimentButton)

-----------------------------------------------------------------------     
        -- TOY PUNISHMENT
-----------------------------------------------------------------------   

         -- Create the widget
        local toyPunshiment = widget.newButton(
            {
                --width = 500,
                --heigth = 500,
                id = "Desired_Behavior_List",
                defaultFile = "toy_device.png",
                onEvent = handleButtonEvent
            }
        )

        toyPunshiment.x = display.contentWidth/2 
        toyPunshiment.y = talkingTimeOutPunshiment.y + 120
        sceneGroup:insert(toyPunshiment)

         -- Create the checkbox
        local toyPunshimentButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox",
                onPress = onSwitchPress
            }
        )
        toyPunshimentButton.x = toyPunshiment.x - 250
        toyPunshimentButton.y = talkingTimeOutPunshiment.y + 120
        sceneGroup:insert(toyPunshimentButton)


-----------------------------------------------------------------------     
        -- LOSS OF TOY PUNISHMENT
-----------------------------------------------------------------------   
       
         -- Create the widget
        local lossToyPunshiment = widget.newButton(
            {
                --width = 500,
                --heigth = 500,
                id = "Consequence_Log",
                defaultFile = "PermanentLoss.png",
                onEvent = handleButtonEvent
            }
        )

        lossToyPunshiment.x = display.contentWidth/2 
        lossToyPunshiment.y = toyPunshiment.y+120
        sceneGroup:insert(lossToyPunshiment)


         -- Create the checkbox
        local lossToyPunshimentButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox",
                onPress = onSwitchPress
            }
        )
        lossToyPunshimentButton.x = lossToyPunshiment.x - 250
        lossToyPunshimentButton.y = toyPunshiment.y+120
        sceneGroup:insert(lossToyPunshimentButton)




-----------------------------------------------------------------------     
        -- OBEDIENCE PUNISHMENT
----------------------------------------------------------------------- 
       

        -- Create the widget
        local obediencePunshiment = widget.newButton(
            {
                --width = 500,
                --heigth = 500,
                id = "Reward_Log",
                defaultFile = "ObedienceRespect.png",
                onEvent = handleButtonEvent
            }
        )

        obediencePunshiment.x = display.contentWidth/2 
        obediencePunshiment.y = lossToyPunshiment.y + 120
        sceneGroup:insert(obediencePunshiment)

          -- Create the checkbox
        local obediencePunshimentButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox",
                onPress = onSwitchPress
            }
        )
        obediencePunshimentButton.x = obediencePunshiment.x - 250
        obediencePunshimentButton.y = lossToyPunshiment.y + 120
        sceneGroup:insert(obediencePunshimentButton)

-----------------------------------------------------------------------     
        -- REWIND PUNISHMENT
----------------------------------------------------------------------- 

        -- Create the widget
        local RewindPunshiment = widget.newButton(
            {
                --width = 500,
                --heigth = 500,
                id = "Reward_Log",
                defaultFile = "Rewind.png",
                onEvent = handleButtonEvent
            }
        )

        RewindPunshiment.x = display.contentWidth/2 
        RewindPunshiment.y = obediencePunshiment.y + 120
        sceneGroup:insert(RewindPunshiment)

          -- Create the checkbox
        local RewindPunshimentButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox",
                onPress = onSwitchPress
            }
        )
        RewindPunshimentButton.x = RewindPunshiment.x - 250
        RewindPunshimentButton.y = obediencePunshiment.y + 120
        sceneGroup:insert(RewindPunshimentButton)


-----------------------------------------------------------------------     
        -- APOLOGY PUNISHMENT
----------------------------------------------------------------------- 


        -- Create the widget
        local apologyPunshiment = widget.newButton(
            {
                --width = 500,
                --heigth = 500,
                id = "Reward_Log",
                defaultFile = "WriteNote.png",
                onEvent = handleButtonEvent
            }
        )

        apologyPunshiment.x = display.contentWidth/2 
        apologyPunshiment.y = RewindPunshiment.y + 120
        sceneGroup:insert(apologyPunshiment)

          -- Create the checkbox
        local apologyPunshimentButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox",
                onPress = onSwitchPress
            }
        )
        apologyPunshimentButton.x = apologyPunshiment.x - 250
        apologyPunshimentButton.y = RewindPunshiment.y + 120
        sceneGroup:insert(apologyPunshimentButton)




-----------------------------------------------------------------------     
        -- SERVICE PUNISHMENT
----------------------------------------------------------------------- 
         -- Create the widget
        local servicePunshiment = widget.newButton(
            {
                
                id = "Reward_Log",
                defaultFile = "Service.png",
                onEvent = handleButtonEvent
            }
        )

        servicePunshiment.x = display.contentWidth/2 
        servicePunshiment.y = apologyPunshiment.y + 120
        sceneGroup:insert(servicePunshiment)

         -- Create the checkbox
        local servicePunshimentButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox",
                onPress = onSwitchPress
            }
        )
        servicePunshimentButton.x = servicePunshiment.x - 250
        servicePunshimentButton.y = apologyPunshiment.y + 120
        sceneGroup:insert(servicePunshimentButton)

-----------------------------------------------------------------------     
        -- BUTTONS
----------------------------------------------------------------------- 

      
        function backButtonNew:tap(event)

            composer.gotoScene("newChildProblemBehaviorsII",Soptions)
        end

        -- this listens to see if object has been tapped
        backButtonNew:addEventListener("tap", backButtonNew)

        function nextButton:tap(event)

                Soptions.params.Consequences = {}
                
                if (swattPunshimentButton.isOn) then
                   table.insert(Soptions.params.Consequences,{"Swatts with the paddle"}) 
                end
                if (timeOutPunshimentButton.isOn) then
                   table.insert(Soptions.params.Consequences,{"Time-Out"}) 
                end
                if (talkingTimeOutPunshimentButton.isOn) then
                   table.insert(Soptions.params.Consequences,{"Talking Time-Out"}) 
                end
                 if (toyPunshimentButton.isOn) then
                   table.insert(Soptions.params.Consequences,{"Toy/Device Time-Out"}) 
                end
                 if (lossToyPunshimentButton.isOn) then
                   table.insert(Soptions.params.Consequences,{"Permanent loss of Toy/Device"}) 
                end
                if (obediencePunshimentButton.isOn) then
                   table.insert(Soptions.params.Consequences,{"Practice Obedience/Respect"}) 
                end
                if (RewindPunshimentButton.isOn) then
                   table.insert(Soptions.params.Consequences,{"Rewind and Say-It-Again"}) 
                end
                if (apologyPunshimentButton.isOn) then
                   table.insert(Soptions.params.Consequences,{"Write an apology note"}) 
                end
                if (servicePunshimentButton.isOn) then
                   table.insert(Soptions.params.Consequences,{"Service to Others"}) 
       end

        -- this listens to see if object has been tapped
        nextButton:addEventListener("tap", nextButton)


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
