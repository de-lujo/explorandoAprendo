local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local sonido= audio.loadSound("music/juego1.mp3", {loops = -1, channel = 1})
local fondo, boton, icono, ambiente1, ambiente2, planeta, screenGroup, titulo
local otherChannel, channel2, nombre
local newFont=_G.font
local time={}


--_G.personaje="niño"
local sheetOptions=
{
	width=369,
	height=369,
	numFrames=30,

	sheetContentWidth = 2214,  
    sheetContentHeight = 1845

}

local sequences_Planeta = {
    {
        name = "planetaMove",
        start = 1,
        count = 30,
        time = 15000,
        loopCount = 0,
        loopDirection = "forward"
    }
}


function scene:createScene( event )


	screenGroup= self.view

	fondo=display.newImage("img/paisaje.png",1024,600)
	fondo.x=display.contentWidth/2
	fondo.y=display.contentHeight/2
	fondo.alpha=0.90


	icono=display.newImage("img/flecha01.png")
	icono.x=display.contentCenterX + 430
	icono.y=display.contentCenterY + 200
	icono:scale( 0.30, 0.30 )
	icono.alpha=1


	explorador=display.newImage("img/explorador.png")
	explorador.x=display.contentCenterX -100
	explorador.y=display.contentCenterY +180
	explorador:scale( 0.40, 0.40 )


	personaje=display.newImage( _G.rutaNombre, 300, 400)
	personaje.x=display.contentCenterX +100
	personaje.y=display.contentCenterY +180
	personaje:scale( 0.30, 0.30 )


	sheet_planeta=graphics.newImageSheet("img/planetas.png", sheetOptions)
	runningPlaneta= display.newSprite( sheet_planeta, sequences_Planeta )

	runningPlaneta.x=display.contentCenterX 
	runningPlaneta.y=display.contentCenterY - 100
	runningPlaneta.alpha=1
	runningPlaneta.isVisible=true
	runningPlaneta:scale( 0.50, 0.50 )
	runningPlaneta:play()

	nube=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 300, 150, 12 )
	nube.x=display.contentCenterX -350
	nube.y=display.contentCenterY-200
	nube.strokeWidth = 6
	nube:setStrokeColor( 0, 0, 0 )
	nube.alpha=0

	text12= display.newText("Bien hecho…\nte estas convirtiendo\nen un gran explorador.", display.contentCenterX - 350, display.contentCenterY-200, newFont, _G.tamano)
	text12:setFillColor(0, 0, 0)
	text12.alpha=0


	screenGroup:insert(fondo)
	screenGroup:insert(nube)
	screenGroup:insert(text12)
	screenGroup:insert(icono)
	screenGroup:insert(runningPlaneta)
	screenGroup:insert(explorador)
	screenGroup:insert(personaje)



end



function redirAmbiente( event )

if event.phase == "began" then

	  storyboard.gotoScene("elegirCuento","fade",400)
	end

end

function startNube( event )

	transition.fadeIn( nube, {time=1000} )
	--texto.alpha=1

end


function destexto()
	transition.fadeOut( text12, {time=500} )
end

function texto1( event )

	transition.fadeIn( text12, {time=1000} )
	otherChannel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/bienHecho.mp3", {loops = -1, channel = otherChannel})
	audio.play(sonido)

end


function texto3()
	
	text12.text= "¡Continua la aventura!"
	transition.fadeIn( text12, {time=1000} )
	otherChannel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/continuaAventura.mp3", {loops = -1, channel = otherChannel})
	audio.play(sonido)

end


function validar_Musica( event )
	
	if (audio.isChannelActive(_G.channel) == false) then

		sonido=audio.loadStream(_G.rutaM1, {loops = -1, channel = _G.channel})
		audio.play(sonido)

	end

end

function cancelAll()

	 for i=0,3 do
	 timer.cancel(time[i])
	 end

	 transition.cancel()
	 audio.stop(otherChannel)
	 audio.stop(channel2)
	 audio.dispose(otherChannel)
	 audio.dispose(channel2)

end



function scene:enterScene( event)
	
	_G.musica=true
	icono:addEventListener( "touch", redirAmbiente)

    time[0]=timer.performWithDelay( 0, startNube, 1)
	time[1]=timer.performWithDelay( 1000, texto1, 1)
	time[2]=timer.performWithDelay( 6000, destexto,1)
	time[3]=timer.performWithDelay( 6500, texto3, 1)

	fondo.enterFrame=validar_Musica
	Runtime:addEventListener("enterFrame", fondo)


end



function scene:exitScene( event )

   icono:removeEventListener( "touch", redirAmbiente)

   cancelAll()
   storyboard.removeScene("finCuento1")

end

function scene:destroyScene( event )
	-- body
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene