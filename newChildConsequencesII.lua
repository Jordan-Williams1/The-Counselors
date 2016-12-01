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
    composer.removeScene("newChildConsequencesI")
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
        Soptions.params.consequences1 = event.params
    end
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
        if (Soptions.params) then
            Soptions.params.Fconsequences = {}
        end

        local scrollView = widget.newScrollView(
            {
                --top = 100,
                --left = 10,
                width = display.contentWidth,
                height = 7*(display.contentHeight/8)-100,
                scrollWidth = 600,
                scrollHeight = 2500,
                listener = scrollListener
            }
        )

        sceneGroup:insert(scrollView)

        local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)
        background:toBack()
        local background2 = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, 5000)
        background2:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background2)
        scrollView:insert(background2)
        background2:toBack()


        local pickText = display.newText("          New Child:\n        Consequences II", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText.width = 600
        pickText.align = "center"
        pickText:setFillColor(0,0,0)
        sceneGroup:insert(pickText)

        count = 0
        for k in pairs(Soptions.params.consequences1.Consequences) do
            --print(Soptions.params.behaviors1.behaviors[k][1])
            local newConsequence = display.newText(Soptions.params.consequences1.Consequences[k],display.contentWidth/2,display.contentHeight-display.contentHeight + 150+50*k,native.systemFont,44)
            newConsequence:setFillColor(0,0,0)
            sceneGroup:insert(newConsequence)
            scrollView:insert(newConsequence)
            count = count + 1
            if(Soptions.params) then
                table.insert(Soptions.params.Fconsequences,Soptions.params.consequences1.Consequences[k])
            end
        end

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

       

        local addButton = display.newRect(display.contentWidth/2+250, display.contentHeight/2+300, 70, 75)
        addButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(addButton)

        local plus = display.newText("ADD", display.contentWidth/2+250, display.contentHeight/2+310, 70, 75)
        plus.size = 33
        plus:setFillColor(0,0,0)
        sceneGroup:insert(plus)

        local nextButton = display.newRect(display.contentWidth - 50, display.contentHeight-display.contentHeight + 100, 70, 75)
        nextButton:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(nextButton)

        writeBehavior = native.newTextField( display.contentWidth/2, display.contentHeight/2+300, display.contentWidth/2, 75)
        sceneGroup:insert(writeBehavior)
        writeBehavior:addEventListener( "userInput", textListener )
        writeBehavior.size = 40
        writeBehavior.text = "New Consequence"

        function plus:tap(event)
            print("tap")
            local newConsequence = display.newText(writeBehavior.text,display.contentWidth/2,display.contentHeight-display.contentHeight + 150+50*(count+1),native.systemFont,44)
            newConsequence:setFillColor(0,0,0)
            sceneGroup:insert(newConsequence)
            scrollView:insert(newConsequence)
            count = count + 1
            if(Soptions.params) then
                table.insert(Soptions.params.Fconsequences,writeBehavior.text)
            end       
        end
        plus:addEventListener("tap", plus)


         function backButtonNew:tap(event)
            
            composer.gotoScene("newChildConsequencesI",Soptions)
        
        end
        backButtonNew:addEventListener("tap", backButtonNew)

        function nextButton:tap(event)

            composer.gotoScene("newChildRewardsI",Soptions)
        
        end
        nextButton:addEventListener("tap", nextButton)

         -- Create text field
        
        
        --[[consequenceDescription = native.newTextBox( display.contentWidth/2, writeBehavior.y + 150, 600, 200 )
        consequenceDescription.isEditable = true
        consequenceDescription:addEventListener( "userInput", textListener )
        sceneGroup:insert(consequenceDescription)
        consequenceDescription.text = "Consequence Description"]]--

end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

       


    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screesn

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

        if writeBehavior~=nil then
           --writeBehavior:removeSelf()
           -- writeBehavior = nil
        end
       
    

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

        if writeBehavior~=nil then
           --writeBehavior:removeSelf()
           -- writeBehavior = nil
        end
       
    

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end     

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
