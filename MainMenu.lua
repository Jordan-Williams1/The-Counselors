local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

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

    local sceneGroup = self.view
    local phase = event.phase

     flag = false

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

       local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
        background:setFillColor( 0.745098 ,0.745098 ,0.745098)
        sceneGroup:insert(background)
        
        if userName.text == "jordan" and flag == false then

        local food = display.newText("click a day of the week", display.contentWidth/2, display.contentHeight-display.contentHeight + 200, native.systemFont, 48)
        food:setFillColor(0,1,0)
        sceneGroup:insert(food)

        flag = true
        
        end




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


    --local box = display.newRect(scrollView.width/2, scrollView.height/2, 70, 75) -- child inside of box
    --box:setFillColor(0,1,0)
    local   myChild = display.newCircle( scrollView.width/2, scrollView.height/2, 30 )
    myChild:setFillColor( 0,0,1 )


    local childName = display.newText("Timmy", scrollView.width/2, scrollView.height/2+ 75, native.systemFont, 30)
    childName:setFillColor( 0,0,1 )
    childName.size = 20
    


    scrollView:insert(childName) 
    scrollView:insert(myChild)
    scrollView:setScrollWidth(800)




        local Main = display.newText("Account of: USER", display.contentWidth/2-30, display.contentHeight-display.contentHeight + 100, native.systemFont, 50)
        Main.size = 40
        Main:setFillColor(0,0,0)
        sceneGroup:insert(Main)

        --local back = display.newRect(display.contentWidth/2 - 270, display.contentHeight/2 - 480, 70, 75)
        --back:setFillColor(0,1,0)
        --sceneGroup:insert(back)
        local Manage = display.newRect(display.contentWidth/2+290, 350, 75, 300)
        Manage:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(Manage)



        local IDP_Reference = display.newRect(display.contentWidth/2, display.contentHeight/2, 400, 75)
        IDP_Reference:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(IDP_Reference)


        local IDP_TEXT = display.newText("IDP Reference", display.contentWidth/2+50, display.contentHeight/2, 400, 75)
        IDP_TEXT.size = 40
        IDP_TEXT:setFillColor(0,0,0)
        sceneGroup:insert(IDP_TEXT)

        local family_Schedule = display.newRect(display.contentWidth/2, display.contentHeight/2 + 100, 400, 75)
        family_Schedule:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(family_Schedule)

        
        local FAMILY_TEXT = display.newText("Family Schedule", display.contentWidth/2+50, display.contentHeight/2 + 100, 400, 75)
        FAMILY_TEXT.size = 40
        FAMILY_TEXT:setFillColor(0,0,0)
        sceneGroup:insert(FAMILY_TEXT)

        local Problem_Behavior_List = display.newRect(display.contentWidth/2, display.contentHeight/2 + 200, 400, 75)
        Problem_Behavior_List:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(Problem_Behavior_List)

        local Problem_TEXT = display.newText("Problem Behavior List", display.contentWidth/2+5, display.contentHeight/2 + 200, 400, 75)
        Problem_TEXT.size = 40
        Problem_TEXT:setFillColor(0,0,0)
        sceneGroup:insert(Problem_TEXT)

        local Desired_Behavior_List = display.newRect(display.contentWidth/2, display.contentHeight/2 + 300, 400, 75)
        Desired_Behavior_List:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(Desired_Behavior_List)

        local Desired_TEXT = display.newText("Desired Behavior List", display.contentWidth/2+ 5, display.contentHeight/2 + 300, 400, 75)
        Desired_TEXT.size = 40
        Desired_TEXT:setFillColor(0,0,0)
        sceneGroup:insert(Desired_TEXT)

        local Consequence_Log = display.newRect(display.contentWidth/2, display.contentHeight/2 + 400, 400, 75)
        Consequence_Log:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(Consequence_Log)

        local Consequence_TEXT = display.newText("Consequence Log", display.contentWidth/2+ 5, display.contentHeight/2 + 400, 400, 75)
        Consequence_TEXT.size = 40
        Consequence_TEXT:setFillColor(0,0,0)
        sceneGroup:insert(Consequence_TEXT)

        local Reward_Log = display.newRect(display.contentWidth/2, display.contentHeight/2 + 500, 400, 75)
        Reward_Log:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(Reward_Log)

        local Reward_TEXT = display.newText("Rewards Log", display.contentWidth/2+ 5, display.contentHeight/2 + 500, 400, 75)
        Reward_TEXT.size = 40
        Reward_TEXT:setFillColor(0,0,0)
        sceneGroup:insert(Reward_TEXT)


       -- local options =
       -- {
       --     Password = Password.text,
       --     userName = userName.text,
    
        --    params = {
        --        userName, 
        --        Password
        --    }
        --}

    
    function Manage:tap(event)

      composer.gotoScene("addChild", options)
    
    end

    -- this listens to see if object has been tapped
    Manage:addEventListener("tap", Manage)
    
    function IDP_Reference:tap(event)

      composer.gotoScene("IDPReference", options)
    
    end

    -- this listens to see if object has been tapped
    IDP_Reference:addEventListener("tap", IDP_Reference)


    function family_Schedule:tap(event)

      composer.gotoScene("familySchedule")
    
    end

    -- this listens to see if object has been tapped
    family_Schedule:addEventListener("tap", family_Schedule)

     function Problem_Behavior_List:tap(event)

      composer.gotoScene("problemBehaviorList")
    
    end

    -- this listens to see if object has been tapped
    Problem_Behavior_List:addEventListener("tap", Problem_Behavior_List)

    function Desired_Behavior_List:tap(event)

      composer.gotoScene("desiredBehaviorList")
    
    end

    -- this listens to see if object has been tapped
    Desired_Behavior_List:addEventListener("tap", Desired_Behavior_List)

    function Consequence_Log:tap(event)

      composer.gotoScene("consequencesLog")
    
    end

    -- this listens to see if object has been tapped
    Consequence_Log:addEventListener("tap", Consequence_Log)

     function Reward_Log:tap(event)

      composer.gotoScene("rewardsLog")
    
    end

    -- this listens to see if object has been tapped
    Reward_Log:addEventListener("tap", Reward_Log)






        -- new sliding panel widget
    local show = display.newRect(display.contentWidth/2 + 300, display.contentHeight/2 - 580, 70, 75)
        show:setFillColor(0.372549, 0.619608, 0.627451)
        sceneGroup:insert(show)
    
    local panel = widget.newPanel
    {
        location = "right",
        onComplete = panelTransDone,
        width = display.contentWidth/2,
        height = display.contentHeight
       
       
    }
    
    --panel.y = display.contentHeight-display.contentHeight+400

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


    panel.Quick_IDP = display.newRect( panel.width/8,-300 , 200, 75)
    panel.Quick_IDP:setFillColor(0.372549, 0.619608, 0.627451)
    panel:insert(panel.Quick_IDP)

    panel.accountManagment = display.newRect( panel.width/8, -200 , 200, 75)
    panel.accountManagment:setFillColor(0.372549, 0.619608, 0.627451)
    panel:insert(panel.accountManagment)

    panel.IDP_words = display.newText("Quick IDP", panel.width/8, -400,  native.systemFontBold, 18  )
    panel.IDP_words:setFillColor( 0, 0, 0 )
    panel:insert( panel.IDP_words )

    panel.signOut = display.newText("Sign Out", panel.width/8, -200,  native.systemFontBold, 18  )
    panel.signOut:setFillColor( 0, 0, 0 )
    panel:insert( panel.signOut )

    panel.accountManagmentText = display.newText( "Account Managment", panel.width/8, -300 , native.systemFontBold, 18 )
    panel.accountManagmentText:setFillColor( 0, 0, 0 )
    panel:insert( panel.accountManagmentText )

        

    panel.slideBack = display.newRect(-100, -500, 70, 75)
    panel.slideBack:setFillColor(0.372549, 0.619608, 0.627451)
    panel:insert(panel.slideBack)
        
        --sceneGroup:insert(back)

    


    function show:tap(event)
        
        panel:show()
    end


    show:addEventListener("tap", show)

    function panel.slideBack:tap(event)
        
        panel:hide()
    end


    panel.slideBack:addEventListener("tap", slideBack)


    function panel.slideBack:tap(event)
        
        panel:hide()
    end



    --function back:tap(event)

     
      --composer.gotoScene("signIn", options)
      

   -- end

    -- this listens to see if back button has been tapped
    
    --back:addEventListener("tap", back)
    
       
    -- end of implementation code  
    ---------------------------
    ---------------------------
    ---------------------------
    ---------------------------
    ---------------------------


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