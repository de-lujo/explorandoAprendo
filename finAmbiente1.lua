local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local sonido= audio.loadSound("music/juego1.mp3", {loops = -1, channel = 1})
local fondo, boton, icono, ambiente1, ambiente2, planeta, screenGroup, titulo

--_G.personaje="niño"
local sheetOptions=
{
	width=685,
	height=600,
	numFrames=10,
	sheetContentWidth = 2744,  
    sheetContentHeight = 1802 

}

local sequences_Planeta = {
    {
        name = "planetaRun",
        start = 1,
        count = 10,
        time = 3000,
        loopCount = 0,
        loopDirection = "bounce"
    }
}


function scene:createScene( event )


	screenGroup= self.view

	fondo=display.newImage("img/paisaje.png",1024,600)
	fondo.x=display.contentWidth/2
	fondo.y=display.contentHeight/2
	fondo.alpha=0.90


	icono=display.newImage("img/286.png")
	icono.x=display.contentWidth-100
	icono.y=display.contentHeight-100
	icono:scale( 0.13, 0.13 )


	explorador=display.newImage("img/explorador.png")
	explorador.x=display.contentCenterX -100
	explorador.y=display.contentCenterY +200
	explorador:scale( 0.40, 0.40 )

	personaje=display.newImage("img/".._G.personaje..".png")
	personaje.x=display.contentCenterX +100
	personaje.y=display.contentCenterY +200
	personaje:scale( 0.30, 0.30 )


	sheet_planeta=graphics.newImageSheet("img/planetas.png", sheetOptions)
	runningPlaneta= display.newSprite( sheet_planeta, sequences_Planeta )

	runningPlaneta.x=display.contentCenterX + 50
	runningPlaneta.y=display.contentCenterY - 50
	runningPlaneta.alpha=1
	runningPlaneta.isVisible=true
	runningPlaneta:scale( 0.50, 0.50 )
	runningPlaneta:play()

	nube=display.newImage("img/nube.png")
	nube.x=display.contentCenterX - 300
	nube.y=display.contentCenterY-200
	nube:scale( 0.65, 0.30)
	--nube.alpha=0

	text1= display.newText("Has terminado el ambiente!!" .. "\n\nFácil, ¿o no?", display.contentCenterX - 300, display.contentCenterY-200, native.systemFont, 14 )
	text1:setFillColor(0, 0, 0)
	--text1.alpha=0


	screenGroup:insert(fondo)
	screenGroup:insert(nube)
	screenGroup:insert(text1)
	screenGroup:insert(icono)
	screenGroup:insert(runningPlaneta)
	screenGroup:insert(explorador)
	screenGroup:insert(personaje)



end



function redirAmbiente( event )

if event.phase == "began" then

	  storyboard.gotoScene("selectAmbiente","fade",400)
	end

end


function scene:enterScene( event)
	
	_G.musica=true
	icono:addEventListener( "touch", redirAmbiente)



end



function scene:exitScene( event )

   icono:removeEventListener( "touch", redirAmbiente)
   --audio.fadeOut({channel=1, time =600} )
   storyboard.removeScene("finAmbiente1")

end

function scene:destroyScene( event )
	-- body
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene