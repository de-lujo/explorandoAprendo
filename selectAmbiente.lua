local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local sonido
local fondo, boton, icono, ambiente1, ambiente2, planeta, screenGroup, titulo
local channel
local time={}


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
        time = 1600,
        loopCount = 0,
        loopDirection = "bounce"
    }
}


function scene:createScene( event )


	screenGroup= self.view

	fondo=display.newImage("img/paisaje.png")
	fondo.x=display.contentCenterX
	fondo.y=display.contentCenterY
	fondo.alpha=0.80

	ambiente2=display.newImage("img/cu01.png")
	ambiente2.x=display.contentCenterX - 180
	ambiente2.y=display.contentCenterY +100
	ambiente2:scale( 0.30, 0.30)
	ambiente2.strokeWidth = 24
	ambiente2:setStrokeColor( 0, 0, 0 )


	boton=display.newImage("img/Flecha02.png")
	boton.x=display.contentCenterX - 480
	boton.y=display.contentCenterY + 200
	boton.alpha=0  
	boton:scale( 0.30, 0.30 )


	sheet_planeta=graphics.newImageSheet("img/planetas.png", sheetOptions)
	runningPlaneta= display.newSprite( sheet_planeta, sequences_Planeta )

	runningPlaneta.x=display.contentCenterX + 100
	runningPlaneta.y=display.contentCenterY - 150
	runningPlaneta.alpha=1
	runningPlaneta.isVisible=true
	runningPlaneta:scale( 0.50, 0.50 )
	runningPlaneta:play()


	nube=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 350, 120, 12 )
	nube.x=display.contentCenterX - 300
	nube.y=display.contentCenterY-200
	nube.strokeWidth = 6
	nube:setStrokeColor( 0, 0, 0 )
	--nube.alpha=0

	text1= display.newText("Ahora solo tienes que escoger" .. "\na qué lugar quieres ir", display.contentCenterX - 300, display.contentCenterY-200, native.systemFont, 18 )
	text1:setFillColor(0, 0, 0)
	--text1.alpha=0
	

	screenGroup:insert(fondo)
	screenGroup:insert(nube)
	screenGroup:insert(text1)
	screenGroup:insert(ambiente2)
	screenGroup:insert(boton)
	screenGroup:insert(runningPlaneta)


end

function start( event )
	
	if event.phase == "began" then

	  storyboard.gotoScene("personaje2","fade",400)

	end
end


function redirCuento1( event )

if event.phase == "began" then

	  storyboard.gotoScene("sabanaIntro","fade",400)
	  

	end

end


function redirCuento2( event)

if event.phase == "began" then

	  audio.stop( channel )
	  storyboard.gotoScene("sabanaIntro","fade",400)
	  
	end

end

function fadeOut( event )
	
transition.to( fondo, {time=1500, alpha=0.50} )
transition.to( boton, {time=1500, alpha=0.30} )
transition.to( runningPlaneta, {time=1500, alpha=0.80} )
transition.fadeOut( text1, {time=500} )


end

function fadeIn( event )
	
transition.to( fondo, {time= 1000, alpha=0.70} )
transition.fadeIn( boton, {time= 1000} )
transition.fadeIn( runningPlaneta, {time= 1000} )


end

function destexto( event )
	transition.fadeOut( text1, {time=500} )
end

function texto2( event )
	text1.text= "La Sabana: es un lugar ubicado".. "\nen algunas partes del planeta," .. "\ncomo por ejemplo África."
	transition.fadeIn( text1, {time=1000} )
	channel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 5.mp3", {loops = -1, channel = channel})
	audio.play(sonido)
end

function texto3( event )
	text1.text= "Tiene un clima seco, con escasa".. "\nvegetación, y en donde además " .. "\nencontraras muchos animales".."\nsalvajes."
	transition.fadeIn( text1, {time=1000} )
end

function texto4( event)
	text1.text= _G.name ..", selecciona ahora la Sabana."
	transition.fadeIn( text1, {time=1000} )
	

end

function validar_Musica( event )
	
	if (audio.isChannelActive(_G.channel) == false) then

		_G.channel= audio.findFreeChannel()
		audio.setVolume( 0.30, { channel=_G.channel })
		audio.setMaxVolume( 0.40, { channel=_G.channel })
		sonido=audio.loadStream(_G.rutaM1, {loops = -1, channel = _G.channel})
		audio.play(sonido)

	end

end

function cancelAll()

	 for i=0,6 do
	 timer.cancel(time[i])
	 end

	 transition.cancel()
	 audio.stop(channel)

end




function scene:enterScene( event)
	
	_G.musica=true

    fondo.enterFrame=validar_Musica
	Runtime:addEventListener("enterFrame", fondo)

	ambiente2:addEventListener( "touch", redirCuento2)
	boton:addEventListener( "touch", start)
	transition.fadeIn( boton, {time=1000} )
	time[0]=timer.performWithDelay( 4000, fadeOut, 1)
	time[1]=timer.performWithDelay( 6000, texto2, 1)
	time[2]=timer.performWithDelay( 12000, destexto, 1)
	time[3]=timer.performWithDelay( 13000, texto3, 1)
	time[4]=timer.performWithDelay( 19000, destexto, 1)
	time[5]=timer.performWithDelay( 20000, fadeIn, 1)
	time[6]=timer.performWithDelay( 22000, texto4, 1)


end



function scene:exitScene( event )

   ambiente2:removeEventListener( "touch", redirCuento2)
   boton:removeEventListener( "touch", start)
   cancelAll(event)
   storyboard.removeScene("selectAmbiente")

end

function scene:destroyScene( event )
	-- body
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene





