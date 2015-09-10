local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local screenGroup, fondo, texto, nina, nino, boton, titulo, flag, text1, alert1,text2, personaje, sonido

local otherChannel
local time={}
local newFont=_G.font


function scene:createScene( event )

	screenGroup= self.view

	fondo=display.newImage("img/paisaje.png",1024,600)
	fondo.x=display.contentCenterX
	fondo.y=display.contentCenterY
	fondo.alpha=0.75
	--fondo:scale( 0.60, 0.60 )

	boton=display.newImage("img/flecha01.png")
	boton.x=display.contentCenterX + 430
	boton.y=display.contentCenterY + 200
	boton:scale( 0.30, 0.30 )
	boton.alpha=0

	boton1=display.newImage("img/Flecha02.png")
	boton1.x=display.contentCenterX - 480
	boton1.y=display.contentCenterY + 200
	boton1.alpha=0  
	boton1:scale( 0.30, 0.30 )

	titulo = display.newText("Ingresa tu nombre", display.contentCenterX, display.contentCenterY-100, newFont, _G.tamano)
	titulo:setFillColor( 0, 0, 0)
	titulo.alpha=0

	texto= native.newTextField( 200, 150, 220, 45 )
	texto.x= display.contentCenterX 
	texto.y= display.contentCenterY -20
	texto.alpha=0


	nube=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 350, 120, 12 )
	nube.x=display.contentCenterX-270
	nube.y=display.contentCenterY-220
	nube.strokeWidth = 6
	nube:setStrokeColor( 0, 0, 0 )
	--nube:setFillColor( .827, .902, .898)
	nube.alpha=0


	text1= display.newText("Antes de comenzar," .. "\nme gustaría saber tu nombre,\nescríbelo en el recuadro.", display.contentCenterX-263, display.contentCenterY-220, newFont, _G.tamano )
	text1:setFillColor( 0, 0, 0)
	text1.alpha=0

	
	alert1=display.newImage("img/cuadro3.png")
	alert1.x=display.contentCenterX
	alert1.y=display.contentCenterY -30
	alert1:scale( 0.40, 0.40 )
	alert1.alpha=0

	text2=display.newText("", display.contentCenterX, display.contentCenterY - 50, newFont, _G.tamano)
	text2:setFillColor( 0, 0, 0)
	text2.alpha=0

	recta = display.newRoundedRect( display.contentCenterX, display.contentCenterY -100, 180, 80, 12 )
	recta.strokeWidth = 3
	recta:setStrokeColor( 0, 0, 0 )
	--recta:setFillColor( .827, .902, .898)
	recta.alpha=0
	recta.isVisible=true

	personaje=display.newImage(_G.rutaNombre ,300,400)
	personaje.x=display.contentCenterX -220
	personaje.y=display.contentCenterY +50
	personaje:scale( 0.40, 0.40 )
	personaje.alpha=0
	

	screenGroup:insert(fondo)
	screenGroup:insert(boton)
	screenGroup:insert(boton1)
	screenGroup:insert(recta)
	screenGroup:insert(nube)
	screenGroup:insert(texto)
	screenGroup:insert(text1)
	screenGroup:insert(titulo)
	screenGroup:insert(personaje)
	screenGroup:insert(alert1)
	screenGroup:insert(text2)







end

function start( event )
	
	if event.phase == "began" then

       if (texto.text ~= "") then

	 		 _G.name=texto.text
	 		 storyboard.gotoScene("sabanaIntro","fade",400)

	   else

	   	timer.performWithDelay( 0, validarIn, 1)
	   	timer.performWithDelay( 3000, validarOut, 1)

	   end

	end
end


function back( event )
	
	if event.phase == "began" then

	 		 storyboard.gotoScene("personaje","fade",400)

	end

end


function validarIn()

	text2.text="Recuerda escribir tu nombre."
	boton:removeEventListener( "touch", start )
	boton1:removeEventListener( "touch", back )
	transition.pause()
	audio.pause(otherChannel)


	channel2= audio.findFreeChannel()
	sonido2=audio.loadStream("music/explorador/Frase 6.mp3", {loops = -1, channel = channel2})
    audio.play(sonido2)


	for i=0,3 do
	 timer.pause(time[i])
	end

	transition.fadeIn( alert1, { time= 1000} )
	transition.fadeIn( text2, { time= 1000} )
	transition.to(fondo, { time= 1000, alpha=0.30} )
	transition.to(personaje, { time= 1000, alpha=0.30} )
	transition.to(boton, { time= 1000, alpha=0.30} )
	transition.to(boton1, { time= 1000, alpha=0.30} )
	transition.to(recta, { time= 1000, alpha=0.30} )
	transition.to(titulo, { time= 1000, alpha=0.30} )
	transition.to(nube, { time= 1000, alpha=0.30} )
	transition.to(texto, { time= 1000, alpha=0.30} )
	transition.to(text1, { time= 1000, alpha=0.30} )
	

end

function validarOut()

    boton:addEventListener( "touch", start )
	boton1:addEventListener( "touch", back )
	transition.resume()
	audio.resume( otherChannel )

	for i=0,3 do
	 timer.resume(time[i])
	end

	transition.fadeOut( alert1, {time=1000} )
	transition.fadeOut( text2, {time=1000})

	transition.to(fondo, { time= 1000, alpha=0.75} )
	transition.to(boton, { time= 1000, alpha=1} )
	transition.to(boton1, { time= 1000, alpha=1} )
	transition.to(titulo, { time= 1000, alpha=1} )
	transition.to(nube, { time= 1000, alpha=1} )
	transition.to(text1, { time= 1000, alpha=1} )
	transition.to(texto, { time= 1000, alpha=1} )
	transition.to(recta, { time= 1000, alpha=1} )
	transition.to( personaje, {time= 1000, alpha=1} )

end




function startNube( event )

	transition.fadeIn( nube, {time=1000} )
	transition.fadeIn( personaje, {time=1000} )
	transition.fadeIn( recta, {time=1000} )
	transition.fadeIn( titulo, {time=1000})
	transition.fadeIn( boton, {time=1000})
	transition.fadeIn( boton1, {time=1000})
	transition.fadeIn( texto, {time=1000})

end

function destexto( event )
	transition.fadeOut( text1, {time=500} )
end

function texto1( event )
	transition.fadeIn( text1, {time=1000} )
	otherChannel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 5.mp3", {loops = -1, channel = otherChannel})
	audio.play(sonido)
end



function texto3( event )
	
	text1.text= "Para continuar, presiona la flecha."
	transition.fadeIn( text1, {time=1000} )

	otherChannel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 3.mp3", {loops = -1, channel = otherChannel})
	audio.play(sonido)

end


function validar_Musica( event )
	
	if (audio.isChannelActive(_G.channel) == false) then

		_G.channel= audio.findFreeChannel()
		audio.setVolume( 0.03, { channel=_G.channel })
		audio.setMaxVolume( 0.03, { channel=_G.channel })
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
	 audio.dispose(otherChannel)

end

function scene:enterScene( event)
	
	flag=false

	if (_G.name == "nada") then
	
		texto.text=""
	
	else

		texto.text=_G.name

	end

	fondo.enterFrame=validar_Musica
	Runtime:addEventListener("enterFrame", fondo)
	boton:addEventListener( "touch", start)
	boton1:addEventListener( "touch", back )

	 time[0]=timer.performWithDelay( 0, startNube, 1)
	 time[1]=timer.performWithDelay( 1000, texto1, 1)
	 time[2]=timer.performWithDelay( 8000, destexto,1)
	 time[3]=timer.performWithDelay( 8500, texto3, 1)

	

end


function scene:exitScene( event )

   texto:removeSelf()
   boton:removeEventListener("touch", start)
   boton1:removeEventListener( "touch", back )
   cancelAll(event)
   storyboard.removeScene("personaje2")

   
end

function scene:destroyScene( event )
	-- body
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene





