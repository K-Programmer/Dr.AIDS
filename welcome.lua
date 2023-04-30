
  -- Include modules/libraries
  local composer = require "composer"

  local filterData = require( "filters" )
  local widget = require( "widget" )
  local fx = require( "fx.ponyfx" )

  -- Variables local to scene


  -- Create a new Composer scene
  local scene = composer.newScene()
  local helper
  local btPlay
    local bg



  ---function----------
  function gotoMenu( ... )
  fx.shake(btPlay)
   composer.removeScene( composer.getSceneName( "current" ) )
   composer.gotoScene("menu","slideRight")

  end

  -----choose helper--------------
  function showHelper( sceneGroup )
    


    
      bg= display.newImage( sceneGroup, "imgs/bg.png",display.contentCenterX,display.contentCenterY)
      helper= display.newImage( sceneGroup, "imgs/couple.png",display.contentCenterX-100,display.contentCenterY)
       btPlay= display.newImage( sceneGroup, "imgs/bt-01.png",display.contentCenterX+160,display.contentCenterY+100)
    

end



  -- This function is called when scene is created
  function scene:create( event )

    local sceneGroup = self.view  -- Add scene display objects to this group


       
       
       --bg= display.newImage( sceneGroup, "imgs/person/boyBG-01.jpg",display.contentCenterX,display.contentCenterY)
       showHelper(sceneGroup)
    


       --apply wobble effect
       helper.fill.effect = "filter.wobble"
     




       --propriedades\
  
       helper:scale( 0.0, 0.0)
       bg:scale( 0.8 ,0.8)
      btPlay:scale( 0.6 ,0.6)
  fx.bounce(btPlay,0.1)
     
    

    
  --timer.performWithDelay( 5000, gotoMenu)
      -----------------
      -------Mouse Over----

  local onMouseHover = function(event)
      if event.phase == "began" then
         
         
          transition.scaleTo( event.target , {xScale=0.7,yScale=0.7,time=200} )
           playMouse.isVisible=false
          

      elseif event.phase == "ended" then

          transition.scaleTo( event.target , { xScale=0.6, yScale=0.6,time=200} )
    playMouse.isVisible=true
      end

      -- not returning true

  end

  --* SIGN UP FOR mouseHover EVENTS *--

  btPlay:addEventListener( "mouseHover", onMouseHover )
  btPlay:addEventListener( "tap", gotoMenu )


  end

  local function enterFrame(event)

    local elapsed = event.time

  end

  -- This function is called when scene comes fully on screen
  function scene:show( event )

    local phase = event.phase
    if ( phase == "will" ) then
      Runtime:addEventListener( "enterFrame", enterFrame )
    elseif ( phase == "did" ) then

    end
  end

  -- This function is called when scene goes fully off screen
  function scene:hide( event )

    local phase = event.phase
    if ( phase == "will" ) then

    elseif ( phase == "did" ) then
      Runtime:removeEventListener( "enterFrame", enterFrame )
    end
  end

  -- This function is called when scene is destroyed
  function scene:destroy( event )

    --collectgarbage()
  end

  scene:addEventListener("create")
  scene:addEventListener("show")
  scene:addEventListener("hide")
  scene:addEventListener("destroy")

  return scene
