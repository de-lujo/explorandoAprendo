local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local screenGroup, fondo, nina, nino, boton, titulo, flag, text1, alert1,text2, sonido

local otherChannel
local time={}
local newFont=_G.font


function scene:createScene( event )

	screenGroup= self.view

	fondo=display.newImage("img/paisaje.png",1024,600)
	fondo.x=display.contentCenterX
	fondo.y=display.contentCenterY
	fondo.alpha=0.50

	animal3= display.newImage( "img/Cocodrilo.png" )
	animal3.x= display.contentCenterX 
	animal3.y= display.contentCenterY + 200

	cuadro1 = display.newRoundedRect( 0, 0, 130, 70, 0 )
	cuadro1.x= display.contentCenterX -100
	cuadro1.y= display.contentCenterY 
	cuadro1.strokeWidth = 3
	cuadro1:setStrokeColor( 0, 0, 0 )

	bannerDown=display.newRoundedRect( 0, 0, 610, 150, 21 )
	bannerDown.x= display.contentCenterX +10
	bannerDown.y= display.contentCenterY 
	bannerDown.strokeWidth = 6
	bannerDown:setStrokeColor( 0, 0, 0 )
	bannerDown:setFillColor( .98, .941, .745)

	letra10= display.newText("Coco, coco, ", 0, 0, newFont, 16)
	letra10.x= display.contentCenterX -220
	letra10.y=display.contentCenterY 
	letra10.alpha=1
	letra10:setFillColor( 0, 0, 0)

	letra12= display.newText(", sumergido en un río, levantando sus ojitos...", 0, 0, newFont, 16)
	letra12.x= display.contentCenterX +140
	letra12.y=display.contentCenterY
	letra12.alpha=0
	letra12:setFillColor( 0, 0, 0)

	boton=display.newImage("img/comenzar.png")
	boton.x=display.contentCenterX + 430
	boton.y=display.contentCenterY + 200
	boton:scale( 0.25, 0.25 )
	boton.alpha=0


	boton1=display.newImage("img/Flecha02.png")
	boton1.x=display.contentCenterX - 480
	boton1.y=display.contentCenterY + 200
	boton1.alpha=0  
	boton1:scale( 0.30, 0.30 )


	nube=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 380, 150, 12 )
	nube.x=display.contentCenterX-270
	nube.y=display.contentCenterY-220
	nube.strokeWidth = 6
	nube:setStrokeColor( 0, 0, 0 )
	nube.alpha=0


	text1= display.newText("En este juego debes completar\nla letra de la canción,\ncolocando la imagen del animal\nque corresponde en el espacio.", display.contentCenterX-263, display.contentCenterY-220, newFont, _G.tamano )
	text1:setFillColor( 0, 0, 0)
	text1.alpha=0

	grabar1= display.newImage("img/Grabar.png")
    grabar1.x = display.contentCenterX +380
    grabar1.y = display.contentCenterY -140
    grabar1:scale( 0.13, 0.13)
    grabar1.alpha=0


    play1= display.newImage("img/play.png")
    play1.x = display.contentCenterX +450
    play1.y = display.contentCenterY -140
    play1:scale( 0.13, 0.13)
    play1.alpha=0


    barra1=display.newRoundedRect( 0, 0, 180, 80, 21 )
	barra1.x= display.contentCenterX +410
	barra1.y= display.contentCenterY -140
	barra1.strokeWidth = 6
	barra1:setStrokeColor( 0, 0, 0 )
	barra1:setFillColor( .98, .941, .745)
	barra1.alpha=0

	flechaB1= display.newImage( "img/flecha1.png")
	flechaB1.x=display.contentCenterX + 380
	flechaB1.y=display.contentCenterY -60
	flechaB1.alpha=0
	flechaB1:scale(0.04, 0.035)

	

	screenGroup:insert(fondo)
	screenGroup:insert(bannerDown)
	screenGroup:insert(boton)
	screenGroup:insert(boton1)
	screenGroup:insert(nube)
	screenGroup:insert(cuadro1)
	
	screenGroup:insert(letra10)
	screenGroup:insert(letra12)
	screenGroup:insert(text1)
	screenGroup:insert(animal3)

	screenGroup:insert(barra1)
    screenGroup:insert(grabar1)
	screenGroup:insert(flechaB1)
	screenGroup:insert(play1)

end

function start( event )
	
	if event.phase == "began" then

	 	storyboard.gotoScene("sabanaCuento2Pictograma","fade",400)

	end
end


function back( event )
	
	if event.phase == "began" then

	 	storyboard.gotoScene("selectJuegos2","fade",400)

	end

end



function startNube( event )

	transition.fadeIn( nube, {time=500} )
	transition.fadeIn( boton1, {time=500})

end

function destexto( event )
	transition.fadeOut( text1, {time=500} )
end

function texto1( event )
	transition.fadeIn( text1, {time=1000} )

	otherChannel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 30_2.mp3", {loops = -1, channel = otherChannel})
	audio.play(sonido)

end


function texto3( event )
	
	text1.text= "Presiona el botón comenzar."
	transition.fadeIn( text1, {time=1000} )
	transition.fadeIn( boton, {time=500})

	otherChannel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 30_3.mp3", {loops = -1, channel = otherChannel})
	audio.play(sonido)
	--otherChannel= audio.findFreeChannel()
	--sonido=audio.loadStream("music/explorador/Frase 2.mp3", {loops = -1, channel = otherChannel})
	--audio.play(sonido)

end


function validar_Musica( event )
	
	if (audio.isChannelActive(_G.channel) == false) then

		_G.channel= audio.findFreeChannel()
		audio.setVolume( 0.03, { channel=_G.channel })
		audio.setMaxVolume( 0.03, { channel=_G.channel })
		sonido=audio.loadStream(_G.rutaM2, {loops = -1, channel = _G.channel})
		audio.play(sonido)

	end

end

function cancelAll()

	for i=0,6 do
	 timer.cancel(time[i])
	end

	 transition.cancel()
	 audio.stop(otherChannel)
	 audio.dispose(otherChannel)

end


function activar_ejemplo()

	transition.moveTo( animal3, {time=2000, x=display.contentCenterX -100, y=display.contentCenterY} )
	transition.fadeIn( letra12, {time=1000, delay= 3000})

end

function texto_grabar()

		text1.text= "Para poder grabar tu voz cantando\nla canción, presiona con tu dedo\nel botón rojo que se encuentra\nal lado de la letra."
	    transition.fadeIn( text1, {time=1000} )
		transition.fadeIn( grabar1, {time=1000} )
		transition.fadeIn( play1, {time=1000})
		transition.fadeIn( barra1, {time=1000} )
		transition.fadeIn( nube, {time=1000} )
		transition.fadeIn( flechaB1, {time=1000} )

		otherChannel= audio.findFreeChannel()
		sonido=audio.loadStream("music/explorador/Frase 31.mp3", {loops = -1, channel = otherChannel})
		audio.play(sonido)

		--timer.performWithDelay( 2000, blink, 1 )

	end

function scene:enterScene( event)
	
	flag=false
	fondo.enterFrame=validar_Musica
	Runtime:addEventListener("enterFrame", fondo)
	boton:addEventListener( "touch", start)
	boton1:addEventListener( "touch", back )

	time[0]=timer.performWithDelay( 0, startNube, 1)
	time[1]=timer.performWithDelay( 1000, texto1, 1)
	time[2]=timer.performWithDelay( 6000, activar_ejemplo,1)
	time[3]=timer.performWithDelay( 8000, destexto,1)
	time[4]=timer.performWithDelay( 9500, texto_grabar, 1)
	time[5]=timer.performWithDelay( 16000, destexto, 1)
	time[6]=timer.performWithDelay( 17000, texto3, 1)



	

	

end


function scene:exitScene( event )

   boton:removeEventListener("touch", start)
   boton1:removeEventListener( "touch", back )
   cancelAll()
   storyboard.removeScene("introPictograma2")

   
end

function scene:destroyScene( event )
	-- body
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene





