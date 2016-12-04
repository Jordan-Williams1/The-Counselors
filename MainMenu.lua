local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene()
local json = require("json")

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local serverResponse
local session

function widget.newPanel( options )
    local customOptions = options or {}
    local opt = {}
 
    opt.location = customOptions.location or "top"
 
    local default_width, default_height
    if ( opt.location == "top" or opt.location == "bottom" ) then
        default_width = display.contentWidth
        default_height = display.contentHeight * 0.33
    else
        default_width = display.contentWidth * 0.33
        default_height = display.contentHeight
    end
 
    opt.width = customOptions.width or default_width
    opt.height = customOptions.height or default_height
 
    opt.speed = customOptions.speed or 500
    opt.inEasing = customOptions.inEasing or easing.linear
    opt.outEasing = customOptions.outEasing or easing.linear
 
    if ( customOptions.onComplete and type(customOptions.onComplete) == "function" ) then
        opt.listener = customOptions.onComplete
    else 
        opt.listener = nil
    end
 
    local container = display.newContainer( opt.width, opt.height )
 
    if ( opt.location == "left" ) then
        container.anchorX = 1.0
        container.x = display.screenOriginX
        container.anchorY = 0.5
        container.y = display.contentCenterY
    elseif ( opt.location == "right" ) then
        container.anchorX = 0.0
        container.x = display.actualContentWidth
        container.anchorY = 0.5
        container.y = display.contentCenterY
    elseif ( opt.location == "top" ) then
        container.anchorX = 0.5
        container.x = display.contentCenterX
        container.anchorY = 1.0
        container.y = display.screenOriginY
    else
        container.anchorX = 0.5
        container.x = display.contentCenterX
        container.anchorY = 0.0
        container.y = display.actualContentHeight
    end
 
    function container:show()
        local options = {
            time = opt.speed,
            transition = opt.inEasing
        }
        if ( opt.listener ) then
            options.onComplete = opt.listener
            self.completeState = "shown"
        end
        if ( opt.location == "top" ) then
            options.y = display.screenOriginY + opt.height
        elseif ( opt.location == "bottom" ) then
            options.y = display.actualContentHeight - opt.height
        elseif ( opt.location == "left" ) then
            options.x = display.screenOriginX + opt.width
        else
            options.x = display.actualContentWidth - opt.width
        end 
        transition.to( self, options )
    end
 
    function container:hide()
        local options = {
            time = opt.speed,
            transition = opt.outEasing
        }
        if ( opt.listener ) then
            options.onComplete = opt.listener
            self.completeState = "hidden"
        end
        if ( opt.location == "top" ) then
            options.y = display.screenOriginY
        elseif ( opt.location == "bottom" ) then
            options.y = display.actualContentHeight
        elseif ( opt.location == "left" ) then
            options.x = display.screenOriginX
        else
            options.x = display.actualContentWidth
        end 
        transition.to( self, options )
    end
 
    return container
end




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
    composer.removeScene("signIn")
    composer.removeScene("register")
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

        -- Code here runs when the scene is still off screen (but is about to come on screen)
    local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
    background:setFillColor( 0.745098 ,0.745098 ,0.745098)
    sceneGroup:insert(background)


    local IDP_Reference = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "IDP_Reference",
		        defaultFile = "IDPReference.png",
		        onEvent = handleButtonEvent
		    }
		)

		IDP_Reference.x = display.contentWidth/2 
		IDP_Reference.y = display.contentHeight/2
		sceneGroup:insert(IDP_Reference)

    function IDP_Reference:tap(event)

      composer.gotoScene("IDPReference", Soptions)
    
    end



    -- this listens to see if object has been tapped
    IDP_Reference:addEventListener("tap", IDP_Reference)

-----------------------NETWORK LISTENER HERE----------------------------------------------------
    local function networkListener( event )
        if ( event.isError ) then
            print( "Network error: ", event.response )
            local alert = native.showAlert("Login Error","Server is not available at this time.",{"OK"})
            composer.gotoScene("signin", Soptions)
        else
            serverResponse = json.decode(event.response)
            if(serverResponse) then
                print ( "RESPONSE: " .. serverResponse["session_id"] )
                if(serverResponse["children"]) then
                    for k in pairs(serverResponse["children"]) do print ("Child: ".. serverResponse["children"][k]) end
                end
                print("Priveleges: "..serverResponse["childPriv"].." "..serverResponse["schedPriv"].." "..serverResponse["behavPriv"].." "..serverResponse["CRPriv"])
            else
                print("No server response")
            end

            --[[if(serverResponse[0] == 'U') then
                local Main = display.newText("Account of: "..serverResponse(3,(string.len(serverResponse))), display.contentWidth/2-30, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
                Main.size = 40
                Main:setFillColor(0,0,0)
                sceneGroup:insert(Main)
            end]]--

-----------------START CHILD PRIVILEGES---------------------------

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

    --serverResponse["childPriv"] = "0"
    if(serverResponse["childPriv"]~="0") then
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

    --local box = display.newRect(scrollView.width/2, scrollView.height/2, 70, 75) -- child inside of box
    --box:setFillColor(0,1,0)
        if(serverResponse["children"]) then
            for k in pairs(serverResponse["children"]) do 
                local myChild = display.newCircle( (scrollView.width/2)+(k-1)*150-150, scrollView.height/2, 30 )
                myChild:setFillColor( 0,0,1 )


                local childName = display.newText(serverResponse["children"][k], (scrollView.width/2)+(k-1)*150-150, scrollView.height/2+ 75, native.systemFont, 30)
                childName:setFillColor( 0,0,1 )
                childName.size = 20
            
                scrollView:insert(childName) 
                scrollView:insert(myChild)
                scrollView:setScrollWidth(800)
            end
        else
            scrollView:setScrollWidth(500)
            
            local childName = display.newText("No children in database. Press button to add==>", (scrollView.width/2), scrollView.height/2,scrollView.width-50,scrollView.height, native.systemFont, 30)
            childName:setFillColor( 0,0,0 )
            scrollView:insert(childName) 
        end

    --local back = display.newRect(display.contentWidth/2 - 270, display.contentHeight/2 - 480, 70, 75)
    --back:setFillColor(0,1,0)
    --sceneGroup:insert(back)
        local Manage = display.newRect(display.contentWidth/2+290, 350, 75, 300)
        Manage:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(Manage)


        function Manage:tap(event)

          composer.gotoScene("addChild", Soptions)
        
        end
        Manage:addEventListener("tap", Manage)
    end 

---------------------END CHILD PRIVILEGES
---------------------START FAMILY SCHEDULE PRIVILEGES
        --local family_Schedule = display.newRect(display.contentWidth/2, display.contentHeight/2 + 100, 400, 75)
        --family_Schedule:setFillColor(0.372549, 0.619608, 0.627451)
        --sceneGroup:insert(family_Schedule)

        
        --local FAMILY_TEXT = display.newText("Family Schedule", display.contentWidth/2+50, display.contentHeight/2 + 100, 400, 75)
        --FAMILY_TEXT.size = 40
        --FAMILY_TEXT:setFillColor(0,0,0)
        --sceneGroup:insert(FAMILY_TEXT)
    --serverResponse["schedPriv"] = "0"
    if(serverResponse["schedPriv"]~="0") then
        local family_Schedule = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "family_Schedule",
		        defaultFile = "FamilySchedule.png",
		        onEvent = handleButtonEvent
		    }
		)

		family_Schedule.x = display.contentWidth/2 
		family_Schedule.y = display.contentHeight/2 + 120
		sceneGroup:insert(family_Schedule)

        function family_Schedule:tap(event)

          composer.gotoScene("familySchedule")
        
        end
        family_Schedule:addEventListener("tap", family_Schedule)
    end
----------------------END FAMILY SCHEDULE PRIVILEGES
----------------------START BEHAVIOR PRIVILEGES

        --local Problem_Behavior_List = display.newRect(display.contentWidth/2, display.contentHeight/2 + 200, 400, 75)
        --Problem_Behavior_List:setFillColor(0.372549, 0.619608, 0.627451)
        --sceneGroup:insert(Problem_Behavior_List)

        --local Problem_TEXT = display.newText("Problem Behavior List", display.contentWidth/2+5, display.contentHeight/2 + 200, 400, 75)
        --Problem_TEXT.size = 40
        --Problem_TEXT:setFillColor(0,0,0)
        --sceneGroup:insert(Problem_TEXT)
    --serverResponse["behavPriv"] = "0"
    if(serverResponse["behavPriv"]~="0") then
         local Problem_Behavior_List = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "Problem_Behavior_List",
		        defaultFile = "ProblemBehaviorList.png",
		        onEvent = handleButtonEvent
		    }
		)

		Problem_Behavior_List.x = display.contentWidth/2 
		Problem_Behavior_List.y = display.contentHeight/2 + 240
		sceneGroup:insert(Problem_Behavior_List)


        local Desired_Behavior_List = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "Desired_Behavior_List",
		        defaultFile = "DesiredBehaviorList.png",
		        onEvent = handleButtonEvent
		    }
		)

		Desired_Behavior_List.x = display.contentWidth/2 
		Desired_Behavior_List.y = display.contentHeight/2 + 360
		sceneGroup:insert(Desired_Behavior_List)

        function Problem_Behavior_List:tap(event)
          composer.gotoScene("problemBehaviorList",Soptions)
        end
        Problem_Behavior_List:addEventListener("tap", Problem_Behavior_List)

        function Desired_Behavior_List:tap(event)
          composer.gotoScene("desiredBehaviorList",Soptions)
        end
        Desired_Behavior_List:addEventListener("tap", Desired_Behavior_List)
    end
-----------------------END BEHAVIOR PRIVILEGES
    --local Consequence_Log = display.newRect(display.contentWidth/2, display.contentHeight/2 + 400, 400, 75)
        --Consequence_Log:setFillColor(0.372549, 0.619608, 0.627451)
        --sceneGroup:insert(Consequence_Log)

        --local Consequence_TEXT = display.newText("Consequence Log", display.contentWidth/2+ 5, display.contentHeight/2 + 400, 400, 75)
        --Consequence_TEXT.size = 40
        --Consequence_TEXT:setFillColor(0,0,0)
        --sceneGroup:insert(Consequence_TEXT)
-----------------------START REWARDS/CONSEQUENCES PRIVILEGES
    --serverResponse["CRPriv"]="0"
 	if(serverResponse["CRPriv"]~="0") then	
 		local Consequence_Log = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "Consequence_Log",
		        defaultFile = "ConsequenceLog.png",
		        onEvent = handleButtonEvent
		    }
		)

		Consequence_Log.x = display.contentWidth/2 
		Consequence_Log.y = display.contentHeight/2 + 480
		sceneGroup:insert(Consequence_Log)



        local Reward_Log = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "Reward_Log",
		        defaultFile = "RewardLog.png",
		        onEvent = handleButtonEvent
		    }
		)

		Reward_Log.x = display.contentWidth/2 
		Reward_Log.y = display.contentHeight/2 + 600
		sceneGroup:insert(Reward_Log)
        
        function Consequence_Log:tap(event)
          composer.gotoScene("consequencesLog",Soptions)
        end
        Consequence_Log:addEventListener("tap", Consequence_Log)

        function Reward_Log:tap(event)
          composer.gotoScene("rewardsLog",Soptions)
        end
        Reward_Log:addEventListener("tap", Reward_Log)

        end




-----------------------END REWARDS/CONSEQUENCES PRIVILEGES
    end
end
-----------------------END NETWORK LISTENER
    --print("session ID2: "..session)
    if (session~="null session") then
        local URL = "http://35.161.136.208/mainMenu.php?sessionID="..session
        -- Access server via get
        network.request( URL, "GET", networkListener)
    else
        local alert = native.showAlert("Session Invalid","Sorry, please re-login to resume.",{"OK"})
        local URL = "http://35.161.136.208/Signout.php"
        network.request( URL, "GET", networkListener)
        composer.gotoScene("signIn")
    end



    -- new hambuger sliding panel widget
    local show = widget.newButton(
		    {
		        --width = 500,
		        --heigth = 500,
		        id = "show",
		        defaultFile = "hamburger.png",
		        onEvent = handleButtonEvent
		    }
		)

		show.x = display.contentWidth/2 + 330 
		show.y = display.contentHeight/2 - 600
		sceneGroup:insert(show)


    
    local panel = widget.newPanel
    {
        location = "right",
        onComplete = panelTransDone,
        width = display.contentWidth/2,
        height = display.contentHeight
    }
    

    sceneGroup:insert(panel)

    -- background of panel that slides out
    panel.background = display.newRect( 0, 0, panel.width, panel.height )
    panel.background:setFillColor( 0.662745 ,0.662745 ,0.662745)
    panel:insert( panel.background )
    --sceneGroup:insert(panel.background)
    
    -- text inside sliding menu 
    panel.title = display.newText( "", 0, 0, native.systemFontBold, 18 )
    panel.title:setFillColor( 1, 1, 1 )
    panel:insert( panel.title )

    -- adding a button to the panel
    panel.panelButton = display.newRect( panel.width/8,-400 , 200, 75)
    panel.panelButton:setFillColor(0.372549, 0.619608, 0.627451)
    panel:insert(panel.panelButton)

    -- idp button on panel
    panel.Quick_IDP = display.newRect( panel.width/8,-300 , 200, 75)
    panel.Quick_IDP:setFillColor(0.372549, 0.619608, 0.627451)
    panel:insert(panel.Quick_IDP)

    -- account Managment button on panel
    panel.accountManagment = display.newRect( panel.width/8, -200 , 200, 75)
    panel.accountManagment:setFillColor(0.372549, 0.619608, 0.627451)
    panel:insert(panel.accountManagment)

    -- words in panel
    panel.IDP_words = display.newText("Quick IDP", panel.width/8, -400,  native.systemFontBold, 18  )
    panel.IDP_words:setFillColor( 0, 0, 0 )
    panel:insert( panel.IDP_words )

    -- words in panel
    panel.signOut = display.newText("Sign Out", panel.width/8, -200,  native.systemFontBold, 18  )
    panel.signOut:setFillColor( 0, 0, 0 )
    panel:insert( panel.signOut )

    -- words in panel
    panel.accountManagmentText = display.newText( "Account Managment", panel.width/8, -300 , native.systemFontBold, 18 )
    panel.accountManagmentText:setFillColor( 0, 0, 0 )
    panel:insert( panel.accountManagmentText )

    -- slide back button
    panel.slideBack = display.newRect(-100, -500, 70, 75)
    panel.slideBack:setFillColor(0.372549, 0.619608, 0.627451)
    panel:insert(panel.slideBack)
    

        
        --sceneGroup:insert(back)

    


    function show:tap(event)
        panel:show()
        panel:toFront()
    end

    show:addEventListener("tap", show)

    function panel.slideBack:tap(event)
        panel:hide()
    end
    panel.slideBack:addEventListener("tap", slideBack)


    function panel.slideBack:tap(event)
        panel:hide()
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