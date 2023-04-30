
-- Include modules/libraries
local composer = require "composer"

local filterData = require( "filters" )
local widget = require( "widget" )
-- Variables local to scene
--

-- Create a new Composer scene
local scene = composer.newScene()




---function----------
function gotoMenu( ... )
 composer.removeScene( composer.getSceneName( "current" ) )
 composer.gotoScene("menu","slideRight")

end

function gotoWelcome( ... )
 composer.removeScene( composer.getSceneName( "current" ) )
 composer.gotoScene("welcome","slideRight",0)

end




-- This function is called when scene is created
function scene:create( event )

	local sceneGroup = self.view  -- Add scene display objects to this group
     
     bg= display.newRect( sceneGroup,-1000,0,6000,5000)
     logoBg= display.newImage( sceneGroup, "imgs/bg.png",display.contentCenterX,display.contentCenterY)
     logo= display.newImage( sceneGroup, "imgs/unaids.png",display.contentCenterX,display.contentCenterY)

  
     

     --aplicar efeito
     logo.fill.effect = "filter.wobble"
   




     --propriedades
     bg:setFillColor( 255 )
     logo:scale( 0.7, 0.7)
    logoBg:scale( 1.5 ,1.5)
    logoBg.alpha=0.1
  
  


     local function delayToMenu( event )
 
          gotoMenu()

end
  
timer.performWithDelay( 5000, gotoWelcome)

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
