local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local fondo, boton, icono, ambiente1, ambiente2, planeta, dialog, sonido

local channel, channel2

local time={}



function scene:createScene( event )

	local screenGroup= self.view

	fondo=display.newImage("img/paisaje.png",1024,600)
	fondo.x=display.contentWidth/2
	fondo.y=display.contentHeight/2
	fondo.alpha=0.85

	ambiente1=display.newImage("img/cu201.png")
	ambiente1.x=display.contentCenterX -250
	ambiente1.y=display.contentCenterY -110
	ambiente1:scale( 0.30, 0.30)
	ambiente1.strokeWidth = 24
	ambiente1:setStrokeColor( 0, 0, 0 )

	ambiente2=display.newImage("img/cu01.png")
	ambiente2.x=display.contentCenterX + 200
	ambiente2.y=display.contentCenterY - 110
	ambiente2:scale( 0.30, 0.30)
	ambiente2.strokeWidth = 24
	ambiente2:setStrokeColor( 0, 0, 0 )

	

	explorador4=display.newImage("img/explorador4.png",300,400)
	explorador4.x=display.contentCenterX -150
	explorador4.y=display.contentCenterY +200
	explorador4:scale( 0.40, 0.40 )
	explorador4.alpha=0

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
	dialog:scale( 0.65, 0.65)

	text1= display.newText( _G.name .. "\nEscoge una historia para ".."\ncomenzar la aventura.", display.contentCenterX, display.contentCenterY, native.systemFont, 18 )
	text1.x=display.contentCenterX +120
	text1.y=display.contentCenterY +190
	text1:setFillColor( 0, 0, 0)
	text1.alpha=0

	titulo1= display.newImage("img/algoExtraño.png")
	titulo1.x=display.contentCenterX -250
	titulo1.y=display.contentCenterY - 240
	titulo1.alpha=1
	titulo1:scale( 0.30, 0.30 )

    titulo2= display.newImage("img/unPaseo.png")
	titulo2.x=display.contentCenterX +200
	titulo2.y=display.contentCenterY - 240
	titulo2.alpha=1
	titulo2:scale( 0.30, 0.30 )


	screenGroup:insert(fondo)
	screenGroup:insert(boton)
	screenGroup:insert(icono)
	screenGroup:insert(ambiente1)
	screenGroup:insert(ambiente2)
	screenGroup:insert(titulo1)
	screenGroup:insert(titulo2)
	screenGroup:insert(explorador4)
	screenGroup:insert(dialog)
	screenGroup:insert(text1)


end


function move_explorador()

	
	transition.fadeIn( explorador4, {time=1000} )
	transition.fadeIn( dialog, {time=1000} )
	transition.fadeIn( text1, {time=1000} )
	channel=audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 14.mp3", {loops = -1, channel = channel})
	audio.play(sonido)


end


function destexto()
	transition.fadeOut( text1, {time=500} )
end


function texto_1()

	text1.text= "Puedes elegir:\nAlgo extraño sucede o \nUn paseo por La Sabana"
	transition.fadeIn( text1, {time=1000} )
	channel= audio.findFreeChannel()
	timer.performWithDelay( 500, ocultar, 1)
	transition.to( ambiente2, {time=1000, alpha=0.30} )
	transition.to( titulo2, {time=1000, alpha=0.30})
	transition.to( ambiente1, {time=1000, alpha=0.30, delay=4000} )
	transition.to( ambiente2, {time=1000, alpha=1, delay=4000} )
	transition.to( titulo1, {time=1000, alpha=0.30, delay=4000} )
	transition.to( titulo2, {time=1000, alpha=1, delay=4000} )

	timer.performWithDelay( 6000, mostrar, 1)

	channel=audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 15.mp3", {loops = -1, channel = channel})
	audio.play(sonido)
	--sonido=audio.loadStream("music/explorador/Frase 8.mp3", {loops = -1, channel = channel})
	--audio.play(sonido)
end


function ocultar()

--transition.to( explorador, {time=1000, alpha=0.30})
transition.to( boton, {time=1000, alpha=0.30})
transition.to( fondo, {time=1000, alpha=0.30})
--transition.fadeIn( explorador, {time=500})

end


function mostrar()
	
--transition.fadeIn( explorador, {time=1000})
transition.fadeIn( boton, {time=1000})
transition.fadeIn( fondo, {time=1000})
transition.fadeIn( ambiente1, {time=1000} )
transition.fadeIn( titulo1, {time=1000} )


end


function redirCuento1( event )

if event.phase == "began" then

	  storyboard.gotoScene("sabana2Cuento1","fade",400)
	end

end


function redirCuento2( event)

if event.phase == "began" then

	  storyboard.gotoScene("sabanaCuento1","fade",400)
	end

end


function back( event )
	
	if event.phase == "began" then
		
	  storyboard.gotoScene("sabanaIntro","fade",400)

	end

end

function finAmbiente( event )
	
	if event.phase == "began" then

	  storyboard.gotoScene("finAmbiente1","fade",400)
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

function cancelAll()

	 for i=0,2 do
	 timer.cancel(time[i])
	 end

	 transition.cancel()
	 audio.stop(channel)
	 audio.dispose(channel)
	 --audio.stop( channel2 )
	 --audio.dispose(channel2)

end





function scene:enterScene( event)
	
	transition.to( boton,{time=2000, alpha=1} )
	fondo.enterFrame=validar_Musica


	Runtime:addEventListener("enterFrame", fondo)
	boton:addEventListener("touch", back)
	ambiente1:addEventListener( "touch", redirCuento1)
	ambiente2:addEventListener( "touch", redirCuento2)
	time[0]=timer.performWithDelay( 0, move_explorador, 1)
	time[1]=timer.performWithDelay( 5000, destexto, 1 )
    time[2]=timer.performWithDelay( 6000, texto_1, 1)

	_G.okAdivinanza=false
	_G.okPictograma=false

	if (_G.cuento1 == true and _G.cuento2 == true) then

	ambiente1:removeEventListener( "touch", redirCuento1)
	ambiente2:removeEventListener( "touch", redirCuento2)
	boton:removeEventListener("touch",back)
	icono.isVisible=true
	transition.fadeIn( icono, {time=2000} )
	icono:addEventListener( "touch", finAmbiente )

	end



end





function scene:exitScene( event )
	
   icono:removeEventListener( "touch", finAmbiente )
   boton:removeEventListener("touch",back)
   cancelAll()
   ambiente1:removeEventListener( "touch", redirCuento1)
   ambiente2:removeEventListener( "touch", redirCuento2)
   storyboard.removeScene("elegirCuento")

end

function scene:destroyScene( event )
	-- body
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene