local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
local json = require("json")

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
    composer.removeScene("newChildRewardsI")
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
        Soptions.params.rewards1 = event.params
    end
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
        if (Soptions.params) then
            Soptions.params.Frewards = {}
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


        local pickText = display.newText("          New Child:\n        Rewards II", display.contentWidth/2, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        pickText.size = 40
        pickText.width = 600
        pickText.align = "center"
        pickText:setFillColor(0,0,0)
        sceneGroup:insert(pickText)

        count = 0
        for k in pairs(Soptions.params.rewards1.Rewards) do
            --print(Soptions.params.behaviors1.behaviors[k][1])
            local newReward = display.newText(Soptions.params.rewards1.Rewards[k],display.contentWidth/2,display.contentHeight-display.contentHeight + 150+50*k,native.systemFont,44)
            newReward:setFillColor(0,0,0)
            sceneGroup:insert(newReward)
            scrollView:insert(newReward)
            count = count + 1
            if(Soptions.params) then
                table.insert(Soptions.params.Frewards,Soptions.params.rewards1.Rewards[k])
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
        writeBehavior.text = "New Reward"

        function plus:tap(event)
            print("tap")
            local newReward = display.newText(writeBehavior.text,display.contentWidth/2,display.contentHeight-display.contentHeight + 150+50*(count+1),native.systemFont,44)
            newReward:setFillColor(0,0,0)
            sceneGroup:insert(newReward)
            scrollView:insert(newReward)
            count = count + 1
            if(Soptions.params) then
                table.insert(Soptions.params.Frewards,writeBehavior.text)
            end       
        end
        plus:addEventListener("tap", plus)


         function backButtonNew:tap(event)
            
            composer.gotoScene("newChildRewardsI",Soptions)
        
        end
        backButtonNew:addEventListener("tap", backButtonNew)

        local confirm = 1
        local function onComplete( event )
            if ( event.action == "clicked" ) then
                local i = event.index
                if ( i == 1 ) then
                    confirm = 1
                elseif ( i == 2 ) then
                    confirm = 2
                end
            end
        end

        local function networkListener( event )
            if ( event.isError ) then
                print( "Network error: ", event.response )
                local alert = native.showAlert("Error","Server is not available at this time.",{"OK"})
                composer.gotoScene("signin", Soptions)
                nextButton:addEventListener("tap",nextButton)
            else
                print(event.response)
                serverResponse = json.decode(event.response)
                if(serverResponse) then
                    print ( "RESPONSE: " .. serverResponse["params"]["session_ID"])
                    if(serverResponse["behaviors"]) then
                        for k in pairs(serverResponse["behaviors"]) do print ("B: ".. serverResponse["behaviors"][k]) end
                    end

                else
                    print("No server response")
                    local alert = native.showAlert("Session Invalid","Sorry, please re-login to resume.",{"OK"})
                    composer.gotoScene("signIn")
                end
            end
        end

        function nextButton:tap(event)
            local alert = native.showAlert("Confirmation","Are you sure you are finished?",{"Yes","No"},onComplete)
            if confirm == 1 then
                if (session~="null session") then
                    local URL = "http://35.161.136.208/insertNewChild.php"
                    
                    local Pparams = {}
                    for k in pairs(Soptions.params.Frewards) do print ("C: "..Soptions.params.Frewards[k]) end
                    Pparams.body = "json="..json.encode(Soptions)
                    print (Pparams.body)

                    network.request(URL,"POST",networkListener,Pparams)
                    composer.gotoScene("mainMenu",Soptions)
                else
                    local alert = native.showAlert("Session Invalid","Sorry, please re-login to resume.",{"OK"})
                    local URL = "http://35.161.136.208/Signout.php"
                    network.request( URL, "GET", networkListener)
                    composer.gotoScene("signIn")
                end

                composer.gotoScene("mainMenu",Soptions)
            else

            end
        
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
