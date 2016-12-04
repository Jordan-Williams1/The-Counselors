local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
local json = require("json")


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
    composer.removeScene("newChildDescription")
    composer.removeScene("newChildProblemBehaviorsII")
    -- Code here runs when the scene is first created but has not yet appeared on screen

end


-- show()
function scene:show( event )
    composer.removeScene("newChildDescriptionpart2")
    composer.removeScene("newChildDescription")
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
        --Soptions.params.description2 = event.params
        --print("N "..Soptions.params.description2.description1.name)
    end

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)


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




        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight*3)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)
        scrollView:insert( background )


        local pickText = display.newText("Child Problem/Desired Behaviors", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText:setFillColor(0,0,0)
        scrollView:insert(pickText)


        -- Handle press events for the checkbox
        local function onSwitchPress( event )
            local switch = event.target
            print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
        end

-----------------------------------------------------------------------     
        -- LYING
-----------------------------------------------------------------------    

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


        local lyingText = display.newText("lying/speaking truthfully", display.contentWidth/2 - display.contentWidth/2 + 200 , pickText.y + 200, native.systemFont, 50)
        lyingText.size = 35
        lyingText:setFillColor(0,0,0)
        scrollView:insert(lyingText)


-----------------------------------------------------------------------     
        -- DECEIVING 
-----------------------------------------------------------------------           


        local deceivingButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        deceivingButton.x = display.contentWidth/2 - display.contentWidth/2+ 100 
        deceivingButton.y = lyingButton.y + 50
        scrollView:insert(deceivingButton)

        local deceivingText = display.newText("deceiving/acting earnestly", display.contentWidth/2 - display.contentWidth/2 + 220 , lyingText.y + 50, native.systemFont, 50)
        deceivingText.size = 35
        deceivingText:setFillColor(0,0,0)
        scrollView:insert(deceivingText)

-----------------------------------------------------------------------     
        -- YELLING
-----------------------------------------------------------------------
        local yellingButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        yellingButton.x = display.contentWidth/2 - display.contentWidth/2+ 100 
        yellingButton.y = deceivingButton.y + 50
        scrollView:insert(yellingButton)

        local yellingText = display.newText("yelling/speaking more quietly", display.contentWidth/2 - display.contentWidth/2 + 220 , deceivingText.y + 50, native.systemFont, 50)
        yellingText.size = 35
        yellingText:setFillColor(0,0,0)
        scrollView:insert(yellingText)     

-----------------------------------------------------------------------     
        -- SARCASAM
----------------------------------------------------------------------- 
        local sarcasamButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        sarcasamButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        sarcasamButton.y = yellingButton.y + 50
        scrollView:insert(sarcasamButton)

        local sarcasamText = display.newText("sarcasm/speaking respectfully", display.contentWidth/2 - display.contentWidth/2 + 220 , yellingText.y + 50, native.systemFont, 50)
        sarcasamText.size = 35
        sarcasamText:setFillColor(0,0,0)
        scrollView:insert(sarcasamText)   


-----------------------------------------------------------------------     
        -- "BACK-TALK"
----------------------------------------------------------------------- 
        local backTalkButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        backTalkButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        backTalkButton.y = sarcasamButton.y + 50
        scrollView:insert(backTalkButton)

        local backTalkText = display.newText("back-talk/speaking respectfully", display.contentWidth/2 - display.contentWidth/2 + 220 , sarcasamText.y + 50, native.systemFont, 50)
        backTalkText.size = 35
        backTalkText:setFillColor(0,0,0)
        scrollView:insert(backTalkText)     
-----------------------------------------------------------------------     
        -- LOUD VOICE
-----------------------------------------------------------------------
        local loudVoiceButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        loudVoiceButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        loudVoiceButton.y = backTalkButton.y + 50
        scrollView:insert(loudVoiceButton)

        local loudVoiceText = display.newText("loud voice/inside voice", display.contentWidth/2 - display.contentWidth/2 + 220 , backTalkText.y + 50, native.systemFont, 50)
        loudVoiceText.size = 35
        loudVoiceText:setFillColor(0,0,0)
        scrollView:insert(loudVoiceText)     
-----------------------------------------------------------------------     
        -- INCESSANT TALKING
-----------------------------------------------------------------------
        local incessantTalkingButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        incessantTalkingButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        incessantTalkingButton.y = loudVoiceButton.y + 50
        scrollView:insert(incessantTalkingButton)

        local incessantTalkingText = display.newText("incessant talking/moderated speech", incessantTalkingButton.x + 160, loudVoiceText.y + 50, native.systemFont, 50)
        incessantTalkingText.size = 35
        incessantTalkingText:setFillColor(0,0,0)
        scrollView:insert(incessantTalkingText)     


-----------------------------------------------------------------------     
        -- WHINING
-----------------------------------------------------------------------   

        local whiningButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        whiningButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        whiningButton.y = incessantTalkingButton.y + 50
        scrollView:insert(whiningButton)

        local whiningText = display.newText("whining/calm", display.contentWidth/2 - display.contentWidth/2 + 220 , incessantTalkingText.y + 50, native.systemFont, 50)
        whiningText.size = 35
        whiningText:setFillColor(0,0,0)
        scrollView:insert(whiningText)     


-----------------------------------------------------------------------     
        -- COMPLAINING
----------------------------------------------------------------------- 
        local complainingButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        complainingButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        complainingButton.y = whiningButton.y + 50
        scrollView:insert(complainingButton)

        local complainingText = display.newText("complaining/patience", display.contentWidth/2 - display.contentWidth/2 + 220 , whiningText.y + 50, native.systemFont, 50)
        complainingText.size = 35
        complainingText:setFillColor(0,0,0)
        scrollView:insert(complainingText)     

-----------------------------------------------------------------------     
        -- ARGUING
----------------------------------------------------------------------- 

        local arguingButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        arguingButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        arguingButton.y = complainingButton.y + 50
        scrollView:insert(arguingButton)

        local arguingText = display.newText("arguing/agreeable", display.contentWidth/2 - display.contentWidth/2 + 220 , complainingText.y + 50, native.systemFont, 50)
        arguingText.size = 35
        arguingText:setFillColor(0,0,0)
        scrollView:insert(arguingText)   


-----------------------------------------------------------------------     
        -- CRITIZING PARENT DECISIONS
-----------------------------------------------------------------------   

        local critizingParentDecisionsButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        critizingParentDecisionsButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        critizingParentDecisionsButton.y = arguingButton.y + 50
        scrollView:insert(critizingParentDecisionsButton)

        local critizingParentDecisionsText = display.newText("critizing parent decisions", display.contentWidth/2 - display.contentWidth/2 + 320 , arguingText.y + 50, native.systemFont, 50)
        critizingParentDecisionsText.size = 35
        critizingParentDecisionsText:setFillColor(0,0,0)
        scrollView:insert(critizingParentDecisionsText)   


-----------------------------------------------------------------------     
        -- NO EYE CONTACT
-----------------------------------------------------------------------   
        local noEyeContactButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        noEyeContactButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        noEyeContactButton.y = critizingParentDecisionsButton.y + 50
        scrollView:insert(noEyeContactButton)

        local noEyeContactText = display.newText("no eye contact/eye contact", display.contentWidth/2 - display.contentWidth/2 + 250 , critizingParentDecisionsText.y + 50, native.systemFont, 50)
        noEyeContactText.size = 35
        noEyeContactText:setFillColor(0,0,0)
        scrollView:insert(noEyeContactText)   

-----------------------------------------------------------------------     
        -- CURSING
-----------------------------------------------------------------------  
        
        local cursingButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        cursingButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        cursingButton.y = noEyeContactButton.y + 50
        scrollView:insert(cursingButton)

        local cursingText = display.newText("cursing/moderated speech", display.contentWidth/2 - display.contentWidth/2 + 220 , noEyeContactText.y + 50, native.systemFont, 50)
        cursingText.size = 35
        cursingText:setFillColor(0,0,0)
        scrollView:insert(cursingText)

-----------------------------------------------------------------------     
        -- INTERRUPTING
----------------------------------------------------------------------- 
        
        local interruptingButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        interruptingButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        interruptingButton.y = cursingButton.y + 50
        scrollView:insert(interruptingButton)

        local interruptingText = display.newText("interrupting/waiting turn to talk", display.contentWidth/2 - display.contentWidth/2 + 220 , cursingText.y + 50, native.systemFont, 50)
        interruptingText.size = 35
        interruptingText:setFillColor(0,0,0)
        scrollView:insert(interruptingText)



-----------------------------------------------------------------------     
        -- RUDENESS
-----------------------------------------------------------------------  
        local rudenessButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        rudenessButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        rudenessButton.y = interruptingButton.y + 50
        scrollView:insert(rudenessButton)

        local rudenessText = display.newText("rudeness/politeness", display.contentWidth/2 - display.contentWidth/2 + 220 , interruptingText.y + 50, native.systemFont, 50)
        rudenessText.size = 35
        rudenessText:setFillColor(0,0,0)
        scrollView:insert(rudenessText)

-----------------------------------------------------------------------     
        -- NAGGING
----------------------------------------------------------------------- 
        local naggingButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        naggingButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        naggingButton.y = rudenessButton.y + 50
        scrollView:insert(naggingButton)

        local naggingText = display.newText("nagging/patience", display.contentWidth/2 - display.contentWidth/2 + 220 , rudenessText.y + 50, native.systemFont, 50)
        naggingText.size = 35
        naggingText:setFillColor(0,0,0)
        scrollView:insert(naggingText)


-----------------------------------------------------------------------     
        -- TANTRUMS
-----------------------------------------------------------------------   
        local tantrumsButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        tantrumsButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        tantrumsButton.y = naggingButton.y + 50
        scrollView:insert(tantrumsButton)

        local tantrumsText = display.newText("tantrums/calm", display.contentWidth/2 - display.contentWidth/2 + 220 , naggingText.y + 50, native.systemFont, 50)
        tantrumsText.size = 35
        tantrumsText:setFillColor(0,0,0)
        scrollView:insert(tantrumsText)

-----------------------------------------------------------------------     
        -- WALKING OFF
-----------------------------------------------------------------------  
        local walkingOffButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        walkingOffButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        walkingOffButton.y = tantrumsButton.y + 50
        scrollView:insert(walkingOffButton)

        local walkingOffText = display.newText("walking off/patient listening", display.contentWidth/2 - display.contentWidth/2 + 220 , tantrumsText.y + 50, native.systemFont, 50)
        walkingOffText.size = 35
        walkingOffText:setFillColor(0,0,0)
        scrollView:insert(walkingOffText) 
-----------------------------------------------------------------------     
        -- IGNORING
----------------------------------------------------------------------- 
        local ignoringButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        ignoringButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        ignoringButton.y = walkingOffButton.y + 50
        scrollView:insert(ignoringButton)

        local ignoringText = display.newText("ignoring/attentiveness", display.contentWidth/2 - display.contentWidth/2 + 220 , walkingOffText.y + 50, native.systemFont, 50)
        ignoringText.size = 35
        ignoringText:setFillColor(0,0,0)
        scrollView:insert(ignoringText)   
-----------------------------------------------------------------------     
        -- MANIPULATING
-----------------------------------------------------------------------  
        local manipulatingButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        manipulatingButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        manipulatingButton.y = ignoringButton.y + 50
        scrollView:insert(manipulatingButton)

        local manipulatingText = display.newText("manipulating/respect", display.contentWidth/2 - display.contentWidth/2 + 230 , ignoringText.y + 50, native.systemFont, 50)
        manipulatingText.size = 35
        manipulatingText:setFillColor(0,0,0)
        scrollView:insert(manipulatingText)    
-----------------------------------------------------------------------     
        -- LAZINESS/LACK OF EFFORT
----------------------------------------------------------------------- 
        local lazinessLackOfEffortButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        lazinessLackOfEffortButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        lazinessLackOfEffortButton.y = manipulatingButton.y + 50
        scrollView:insert(lazinessLackOfEffortButton)

        local lazinessLackOfEffortText = display.newText("laziness or lack of effort/effort", display.contentWidth/2 - display.contentWidth/2 + 300 , manipulatingText.y + 50, native.systemFont, 50)
        lazinessLackOfEffortText.size = 35
        lazinessLackOfEffortText:setFillColor(0,0,0)
        scrollView:insert(lazinessLackOfEffortText)    


-----------------------------------------------------------------------     
        -- INCONSIDERATE
----------------------------------------------------------------------- 
        local inconsiderateButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        inconsiderateButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        inconsiderateButton.y = lazinessLackOfEffortButton.y + 50
        scrollView:insert(inconsiderateButton)

        local inconsiderateText = display.newText("inconsiderate/considerate", display.contentWidth/2 - display.contentWidth/2 + 230 , lazinessLackOfEffortText.y + 50, native.systemFont, 50)
        inconsiderateText.size = 35
        inconsiderateText:setFillColor(0,0,0)
        scrollView:insert(inconsiderateText)    
-----------------------------------------------------------------------     
        -- REFUSING TO DO AS TOLD BY AUTHORITY
-----------------------------------------------------------------------  
        local refusingAuthorityButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        refusingAuthorityButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        refusingAuthorityButton.y = inconsiderateButton.y + 50
        scrollView:insert(refusingAuthorityButton)

        local refusingAuthorityText = display.newText("refusing to do as told by authority/respect for authority", display.contentWidth/2 - display.contentWidth/2 + 390 , inconsiderateText.y + 50, native.systemFont, 50)
        refusingAuthorityText.size = 35
        refusingAuthorityText:setFillColor(0,0,0)
        scrollView:insert(refusingAuthorityText)    



-----------------------------------------------------------------------     
        -- REFUSING TO HONOR BOUNDARIES
----------------------------------------------------------------------- 
        local refusingBoundariesButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        refusingBoundariesButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        refusingBoundariesButton.y = refusingAuthorityButton.y + 50
        scrollView:insert(refusingBoundariesButton)

        local refusingBoundariesText = display.newText("refusing to honor boundaries/respect for boundaries", display.contentWidth/2 - display.contentWidth/2 + 350 , refusingAuthorityText.y + 50, native.systemFont, 50)
        refusingBoundariesText.size = 35
        refusingBoundariesText:setFillColor(0,0,0)
        scrollView:insert(refusingBoundariesText)   

-----------------------------------------------------------------------     
        -- DAMAGING PROPERTY
-----------------------------------------------------------------------  
        local damagingPropertyButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        damagingPropertyButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        damagingPropertyButton.y = refusingBoundariesButton.y + 50
        scrollView:insert(damagingPropertyButton)

        local damagingPropertyText = display.newText("damaging property/respecting property", display.contentWidth/2 - display.contentWidth/2 + 280 , refusingBoundariesText.y + 50, native.systemFont, 50)
        damagingPropertyText.size = 35
        damagingPropertyText:setFillColor(0,0,0)
        scrollView:insert(damagingPropertyText)   

-----------------------------------------------------------------------     
        -- THROWING THINGS
----------------------------------------------------------------------- 
        local throwingThingsButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        throwingThingsButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        throwingThingsButton.y = damagingPropertyButton.y + 50
        scrollView:insert(throwingThingsButton)

        local throwingThingsText = display.newText("throwing things/not throwing things", display.contentWidth/2 - display.contentWidth/2 + 270 , damagingPropertyText.y + 50, native.systemFont, 50)
        throwingThingsText.size = 35
        throwingThingsText:setFillColor(0,0,0)
        scrollView:insert(throwingThingsText)    
-----------------------------------------------------------------------     
        -- ACTING WITHOUT PERMISSION
----------------------------------------------------------------------- 
        local actingWithoutPermissionButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        actingWithoutPermissionButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        actingWithoutPermissionButton.y = throwingThingsButton.y + 50
        scrollView:insert(actingWithoutPermissionButton)

        local actingWithoutPermissionText = display.newText("acting without permission/seeks permission", display.contentWidth/2 - display.contentWidth/2 + 350 , throwingThingsText.y + 50, native.systemFont, 50)
        actingWithoutPermissionText.size = 35
        actingWithoutPermissionText:setFillColor(0,0,0)
        scrollView:insert(actingWithoutPermissionText)    
-----------------------------------------------------------------------     
        -- MISTREATING OTHERS
----------------------------------------------------------------------- 
        local mistreatingOthersButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        mistreatingOthersButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        mistreatingOthersButton.y = actingWithoutPermissionButton.y + 50
        scrollView:insert(mistreatingOthersButton)

        local mistreatingOthersText = display.newText("mistreating others/treating others fairly", display.contentWidth/2 - display.contentWidth/2 + 300 , actingWithoutPermissionText.y + 50, native.systemFont, 50)
        mistreatingOthersText.size = 35
        mistreatingOthersText:setFillColor(0,0,0)
        scrollView:insert(mistreatingOthersText)             
-----------------------------------------------------------------------     
        -- HURTING OTHERS PHYSICALLY
----------------------------------------------------------------------- 

        local hurtingPhysicallyButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        hurtingPhysicallyButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        hurtingPhysicallyButton.y = mistreatingOthersButton.y + 50
        scrollView:insert(hurtingPhysicallyButton)

        local hurtingPhysicallyText = display.newText("hurting others physically/respectful of others well being", display.contentWidth/2 - display.contentWidth/2 + 320 , mistreatingOthersText.y + 50, native.systemFont, 50)
        hurtingPhysicallyText.size = 35
        hurtingPhysicallyText:setFillColor(0,0,0)
        scrollView:insert(hurtingPhysicallyText)      
-----------------------------------------------------------------------     
        -- DRUG/ALCOCHOL/TOBACCO USE
----------------------------------------------------------------------- 
        local drugButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        drugButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        drugButton.y = hurtingPhysicallyButton.y + 50
        scrollView:insert(drugButton)

        local drugText = display.newText("drug,alcohol,tobacco use/remaining clean", display.contentWidth/2 - display.contentWidth/2 + 320 , hurtingPhysicallyText.y + 50, native.systemFont, 50)
        drugText.size = 35
        drugText:setFillColor(0,0,0)
        scrollView:insert(drugText)    
-----------------------------------------------------------------------     
        -- SEXUAL BEHAVIOR
----------------------------------------------------------------------- 
        local sexualButton = widget.newSwitch(
            {
                left = 250,
                top = 200,
                style = "checkbox",
                id = "Checkbox2",
                onPress = onSwitchPress
            }
        )
        sexualButton.x = display.contentWidth/2 - display.contentWidth/2 + 100 
        sexualButton.y = drugButton.y + 50
        scrollView:insert(sexualButton)

        local sexualText = display.newText("sexual behavior/abstinence", display.contentWidth/2 - display.contentWidth/2 + 280 , drugText.y + 50, native.systemFont, 50)
        sexualText.size = 35
        sexualText:setFillColor(0,0,0)
        scrollView:insert(sexualText) 

-----------------------------------------------------------------------     
        -- BOTTOM BUTTONS
----------------------------------------------------------------------- 



        local backButton = display.newRect(display.contentWidth/2 - display.contentWidth/2 + 100, 2100, 70, 75)
        backButton:setFillColor(0.372549, 0.619608, 0.627451)
        scrollView:insert(backButton)  

        function backButton:tap(event)

            composer.gotoScene("newChildDescription",Soptions)
        end

        local nextButton = display.newRect(display.contentWidth/2 + display.contentWidth/2  - 100, 2100, 70, 75)
        nextButton:setFillColor(0.372549, 0.619608, 0.627451)
        scrollView:insert(nextButton)

        function nextButton:tap(event)
            --print("tapped")
            nextButton:setEnabled(false)
            if (Soptions.params) then
                Soptions.params.behaviors = {}
                --print("<<<<<<<<<<<<<<<<<<<<<")
                print(Soptions.params.behaviors)
                if(lyingButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"lying","speaking truthfully"}) 
                end
                if(deceivingButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"deceiving","acting earnestly"}) 
                end
                if(yellingButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"yelling","speaking more quietly"}) 
                end
                if(sarcasamButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"sarcasm","speaking respectfully"}) 
                end
                if(backTalkButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"back-talk","speaking respectfully"}) 
                end
                if(loudVoiceButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"loud voice","inside voice"}) 
                end
                if(incessantTalkingButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"incessant talking","moderated speech"}) 
                end
                if(whiningButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"whining","calm"}) 
                end
                if(complainingButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"complaining","patience"}) 
                end
                if(arguingButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"arguing","agreeable"}) 
                end
                if(critizingParentDecisionsButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"critizing parent decisions","accepting parent decision"}) 
                end
                if(noEyeContactButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"no eye contact","eye contact"}) 
                end
                if(cursingButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"cursing","moderated speech"}) 
                end
                if(interruptingButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"interrupting","waiting turn to talk"}) 
                end
                if(rudenessButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"rudeness","politeness"}) 
                end
                if(naggingButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"nagging","patience"}) 
                end
                if(tantrumsButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"tantrums","calm"}) 
                end
                if(walkingOffButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"walking off","patient listening"}) 
                end
                if(manipulatingButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"manipulating","respect"}) 
                end
                if(lazinessLackOfEffortButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"laziness or lack of effort","effort"}) 
                end
                if(inconsiderateButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"inconsiderate","considerate"}) 
                end
                if(refusingAuthorityButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"refusing to do as told by authority","respecting authority"}) 
                end
                if(refusingBoundariesButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"refusing to honor boundaries","honoring boundaries"}) 
                end
                if(damagingPropertyButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"damaging property","respecting property"}) 
                end
                if(throwingThingsButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"throwing things","not throwing things"}) 
                end
                if(actingWithoutPermissionButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"acting without permission","seeks permission"}) 
                end
                if(mistreatingOthersButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"mistreating others","treating others fairly"}) 
                end
                if(hurtingPhysicallyButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"hurting others physically","respectful of others well being"}) 
                end
                if(drugButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"drug,alcohol,tobacco use","remaining clean"}) 
                end
                if(sexualButton.isOn) then 
                    table.insert(Soptions.params.behaviors,{"sexual behavior","abstinence"}) 
                end
            end
            composer.gotoScene("newChildProblemBehaviorsII",Soptions)
        end


        backButton:addEventListener("tap", backButton)
        nextButton:addEventListener("tap", nextButton)


        scrollView:setScrollHeight(2200)
      


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
