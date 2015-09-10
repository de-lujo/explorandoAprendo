local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local fondo, boton, icono, ambiente1, ambiente2, planeta, sonido
local channel, channel2
local time={}
local newFont=_G.font


function scene:createScene( event )

	local screenGroup= self.view

	fondo=display.newImage("img/paisaje.png",1024,600)
	fondo.x=display.contentWidth/2
	fondo.y=display.contentHeight/2
	fondo.alpha=0.90


	ambiente1=display.newImage("img/adivinanza.png")
	ambiente1.x=display.contentCenterX -250
	ambiente1.y=display.contentCenterY -110
	ambiente1:scale( 0.40, 0.40)

	ambiente2=display.newImage("img/pictograma.png")
	ambiente2.x=display.contentCenterX + 200
	ambiente2.y=display.contentCenterY - 110
	ambiente2:scale( 0.40, 0.40)

	explorador=display.newImage("img/explorador.png",300,400)
	explorador.x=display.contentCenterX -180
	explorador.y=display.contentCenterY +200
	explorador:scale( 0.40, 0.40 )
	explorador.alpha=0

	icono=display.newImage("img/flecha01.png")
	icono.x=display.contentCenterX + 430
	icono.y=display.contentCenterY + 200
	icono:scale( 0.30, 0.30 )
	icono.alpha=0

	boton=display.newImage("img/Flecha02.png")
	boton.x=display.contentCenterX - 480
	boton.y=display.contentCenterY + 200
	boton.alpha=1 
	boton:scale( 0.30, 0.30 )

	dialog= display.newImage("img/dialogo4.png")
	dialog.x=display.contentCenterX +70
	dialog.y=display.contentCenterY +200
	dialog.alpha=0
	dialog:scale( 0.75, 0.75)

	text11= display.newText( _G.name .. "\n¿Te gustó el cuento?,\n¿ahora qué actividad\nte gustaría hacer?", display.contentCenterX, display.contentCenterY,newFont, _G.tamano)
	text11.x=display.contentCenterX +130
	text11.y=display.contentCenterY +190
	text11:setFillColor( 0, 0, 0)
	text11.alpha=0

	titulo1= display.newImage("img/tituloAdi.png")
	titulo1.x=display.contentCenterX -250
	titulo1.y=display.contentCenterY - 240
	titulo1.alpha=1
	titulo1:scale( 0.30, 0.30 )

    titulo2= display.newImage("img/tituloPicto.png")
	titulo2.x=display.contentCenterX +200
	titulo2.y=display.contentCenterY - 240
	titulo2.alpha=1
	titulo2:scale( 0.30, 0.30 )


	screenGroup:insert(fondo)
	screenGroup:insert(ambiente1)
	screenGroup:insert(ambiente2)


	screenGroup:insert(titulo1)
	screenGroup:insert(titulo2)

	screenGroup:insert(icono)
	screenGroup:insert(explorador)
	screenGroup:insert(boton)
	screenGroup:insert(dialog)
	screenGroup:insert(text11)

end


function move_explorador( event )
	
	transition.fadeIn( explorador, {time=2000})
	transition.fadeIn( dialog, {time=2000} )
	transition.fadeIn( text11, {time=2000} )

	if (_G.explicar == true) then
	channel=audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 16.mp3", {loops = -1, channel = channel})
	audio.play(sonido)

	elseif (_G.okAdivinanza == true and _G.okPictograma == true) then

	channel=audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 20.mp3", {loops = -1, channel = channel})
	audio.play(sonido)


	elseif (_G.okAdivinanza == true or _G.okPictograma == true) then

	channel=audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 19.mp3", {loops = -1, channel = channel})
	audio.play(sonido)


	
	end

end

function destexto()

	transition.fadeOut( text11, {time=500} )

end

function texto_1()

	text11.text= "Pictogramas musicales"
	transition.fadeIn( text11, {time=1000} )
	ocultar()
	transition.to( ambiente1, {time= 1000, alpha=0.30} )
	transition.to( titulo1, {time= 1000, alpha=0.30} )
	channel=audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 17.mp3", {loops = -1, channel = channel})
	audio.play(sonido)

end

function texto_2()

	text11.text= "Adivinanzas"
	ocultar()
	transition.fadeIn( text11, {time=1000} )
	transition.fadeIn( ambiente1, { time=1000})
	transition.fadeIn( titulo1, { time=1000} )
	transition.to( ambiente2, {time=1000, alpha=0.30})
	transition.to( titulo2, {time=1000, alpha=0.30})

	sonido=audio.loadStream("music/explorador/Frase 18.mp3", {loops = -1, channel = channel})
	audio.play(sonido)


	--sonido=audio.loadStream("music/explorador/Frase 8.mp3", {loops = -1, channel = channel})
	--audio.play(sonido)
end


function ocultar()

--transition.to( explorador, {time=1000, alpha=0.30})
transition.to( boton, {time=1000, alpha=0.30})
transition.to( fondo, {time=1000, alpha=0.30} )
--transition.fadeIn( explorador, {time=500})

end


function mostrar()
	
--transition.fadeIn( explorador, {time=1000})
transition.fadeIn( boton, {time=1000})
transition.fadeIn( fondo, {time=1000})
transition.fadeIn( titulo2, {time=1000} )
transition.fadeIn( ambiente2, {time=1000} )


end

function mostrarAmbiente()
	
	transition.fadeIn( ambiente2, { time=1000})

end







function redirCuento1( event )

if event.phase == "began" then

	  storyboard.gotoScene("sabanaCuento2Adivinanza","fade",400)
	end

end


function redirCuento2( event)

if event.phase == "began" then

	  storyboard.gotoScene("introPictograma2","fade",400)
	end

end

function start( event)
	
	if event.phase == "began" then

	  --_G.cuento2=true
	  storyboard.gotoScene("sabana2Cuento5","fade",400)
	end
end


function cancelAll()

	 transition.cancel()
	 audio.stop(channel)
	 audio.dispose(channel)

	 if (_G.explicar == true) then

	   for i=1,6 do
	    timer.cancel(time[i])
	   end

	 end


end

function finalizar( event )
	
	if event.phase == "began" then

	   	  storyboard.gotoScene("finCuento1","fade",400)


	end


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



function scene:enterScene( event)
	
	
	fondo.enterFrame=validar_Musica
	Runtime:addEventListener("enterFrame", fondo)

	ambiente1:addEventListener( "touch", redirCuento1)
	ambiente2:addEventListener( "touch", redirCuento2)
	boton:addEventListener("touch", start )

	if (_G.explicar == true) then

			time[1]=timer.performWithDelay( 5000, destexto, 1 )
    		time[2]=timer.performWithDelay( 6000, texto_1, 1)
    		time[3]=timer.performWithDelay( 9000, destexto, 1 )
   			time[4]=timer.performWithDelay( 10000, texto_2, 1)
   			time[5]=timer.performWithDelay( 14000, mostrar, 1)
    		time[6]=timer.performWithDelay( 14000, mostrarAmbiente, 1)

	end

	if (_G.okAdivinanza == true or _G.okPictograma == true) then

	--ambiente1:removeEventListener( "touch", redirCuento1)
	  text11.text="¿Cuál escogerás ahora?"


	end


	if (_G.okAdivinanza == true and _G.okPictograma == true) then

	text11.text="¡Sigue recorriendo!"
    icono.isVisible=true
    transition.fadeIn( icono, {time=1000})
    icono:addEventListener( "touch", finalizar )

 	end
	

	timer.performWithDelay( 0, move_explorador,1)	

end




function scene:exitScene( event )
	

   ambiente1:removeEventListener( "touch", redirCuento1)
   ambiente2:removeEventListener( "touch", redirCuento2)
   cancelAll()
   storyboard.removeScene("selectJuegos2")


end

function scene:destroyScene( event )
	


end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene