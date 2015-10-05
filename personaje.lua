local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local screenGroup, fondo, texto, nina, nino, boton, titulo, flag, text1, alert1, text2, sonido

local otherChannel
local channel2=_G.channel2
local sonido2
local newFont=_G.font
local time={}


function scene:createScene( event )

	screenGroup= self.view

	fondo=display.newImage("img/paisaje.png",1024,600)
	fondo.x=display.contentCenterX
	fondo.y=display.contentCenterY
	fondo.alpha=0.75

	nina=display.newImage("img/niña.png")
	nina.x=display.contentCenterX - 200
	nina.y=display.contentCenterY + 100
	nina:scale( 0.50, 0.50 )

	nino=display.newImage("img/niño.png")
	nino.x=display.contentCenterX + 200
	nino.y=display.contentCenterY + 100
	nino:scale( 0.50, 0.50 )

	boton=display.newImage("img/flecha01.png")
	boton.x=display.contentCenterX + 430
	boton.y=display.contentCenterY + 200
	boton:scale( 0.30, 0.30 )


	nube=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 350, 120, 12 )
	nube.x=display.contentCenterX-270
	nube.y=display.contentCenterY-220
	nube.strokeWidth = 6
	nube:setStrokeColor( 0, 0, 0 )
	nube.alpha=0


	text1= display.newText("Primero elige tu personaje" .. "\nquien te acompañará durante\nesta aventura.", display.contentCenterX-263, display.contentCenterY-220, newFont, _G.tamano )
	text1:setFillColor( 0, 0, 0)
	text1.alpha=0

	alert1=display.newImage("img/cuadro3.png")
	alert1.x=display.contentCenterX
	alert1.y=display.contentCenterY -30
	alert1:scale( 0.40, 0.40 )
	alert1.alpha=0

	text2=display.newText("", display.contentCenterX, display.contentCenterY -50, newFont, _G.tamano)
	text2:setFillColor( 0, 0, 0)
	text2.alpha=0


	dialogNina= display.newImage("img/globo1.png")
	dialogNina.x=display.contentCenterX
	dialogNina.y=display.contentCenterY - 50
	dialogNina.alpha=0
	dialogNina.isVisible=false
	dialogNina:scale( 0.55, 0.40)

	textNina=display.newText("", display.contentCenterX + 10, display.contentCenterY -50, newFont, _G.tamano)
	textNina:setFillColor( 0, 0, 0)
	textNina.alpha=0

	dialogNino= display.newImage("img/globo1.png")
	dialogNino.x=display.contentCenterX + 370
	dialogNino.y=display.contentCenterY - 50
	dialogNino.alpha=0
	dialogNino.isVisible=false
	dialogNino:scale( 0.55, 0.40)

	textNino=display.newText("", display.contentCenterX + 380, display.contentCenterY -50, newFont, _G.tamano)
	textNino:setFillColor( 0, 0, 0)
	textNino.alpha=0

	
	screenGroup:insert(fondo)
	screenGroup:insert(nina)
	screenGroup:insert(nino)
	screenGroup:insert(dialogNina)
	screenGroup:insert(dialogNino)
	screenGroup:insert(textNina)
	screenGroup:insert(textNino)
	screenGroup:insert(boton)
	screenGroup:insert(nube)
	screenGroup:insert(text1)
	screenGroup:insert(alert1)
	screenGroup:insert(text2)

	






end

function start( event )
	
	if event.phase == "began" then

	 	  if (flag == true ) then

	 		 _G.rutaNombre= "img/".. _G.personaje ..".png"

	 		 storyboard.gotoScene("personaje2","fade",400)
	  	  
	  	  else

	  	  	 timer.performWithDelay( 0, validarIn, 1)
	  	  	 timer.performWithDelay( 3000, validarNombreOut, 1)

	  	  end

	end
end


function validarIn()

	text2.text="Recuerda elegir tu personaje."
	boton:removeEventListener( "touch", start )
	nino:removeEventListener( "touch", elegirNino )
	nina:removeEventListener("touch", elegirNina)
	audio.pause(channel2)

	--channel2= audio.findFreeChannel()
	sonido2=audio.loadStream("music/explorador/Frase 4.mp3", {loops = -1, channel = _G.channel3})
    audio.play(sonido2)


	for i=0,3 do
	 timer.pause(time[i])
	end

	transition.fadeIn( alert1, { time= 1000} )
	transition.fadeIn( text2, { time= 1000} )
	transition.to( dialogNina, {time=1000, alpha=0.30} )
	transition.to( dialogNino, {time=1000, alpha=0.30} )
	transition.to( textNina, {time=1000, alpha=0.30} )
	transition.to( textNino, {time=1000, alpha=0.30} )
	transition.to(fondo, { time= 1000, alpha=0.30} )
	transition.to(nina, { time= 1000, alpha=0.30} )
	transition.to(nino, { time= 1000, alpha=0.30} )
	transition.to(boton, { time= 1000, alpha=0.30} )
	transition.to(nube, { time= 1000, alpha=0.30} )
	transition.to(text1, { time= 1000, alpha=0.30} )

end

function validarNombreOut()

	audio.resume(channel2)

	for i=0,3 do
	 timer.resume(time[i])
	end

	boton:addEventListener( "touch", start )
	nino:addEventListener( "touch", elegirNino )
	nina:addEventListener("touch", elegirNina)
	
	transition.fadeOut( alert1, {time=1000} )
	transition.fadeOut( text2, {time=1000})
	transition.to(fondo, { time= 1000, alpha=0.75} )
	transition.to(nina, { time= 1000, alpha=1} )
	transition.to(nino, { time= 1000, alpha=1} )
	transition.to(boton, { time= 1000, alpha=1} )
	transition.to(nube, { time= 1000, alpha=1} )
	transition.to(text1, { time= 1000, alpha=1} )
	transition.to( dialogNina, {time=1000, alpha=1} )
	transition.to( dialogNino, {time=1000, alpha=1} )
	transition.to( textNina, {time=1000, alpha=1} )
	transition.to( textNino, {time=1000, alpha=1} )

end





function elegirNino( event )

  if event.phase == "began" then

	nina.strokeWidth = 0
	nino:setStrokeColor( 1, 1, 1 )
	nino.strokeWidth = 10
	_G.personaje="niño"
	flag=true

	textNino.isVisible=true
	textNino.text="Hola, yo seré quien\nte acompañe, en la\nsiguiente aventura."
	dialogNino.isVisible=true
	transition.fadeIn( dialogNino, {time=800})
	transition.fadeIn( textNino, {time=1000})
	dialogNina.isVisible=false
	textNina.isVisible=false
	timer.performWithDelay(400, dialogo, 1)
	nino:removeEventListener("touch", elegirNino)
	nina:addEventListener("touch", elegirNina)

   end

end


function elegirNina( event )

 if event.phase == "began" then

	nino.strokeWidth = 0
	nina:setStrokeColor (1, 1, 1)
	nina.strokeWidth = 10	
	_G.personaje="niña"
	flag=true

	textNina.isVisible=true
	textNina.text="Hola, yo seré quien\nte acompañe, en la\nsiguiente aventura."
	dialogNina.isVisible=true
	transition.fadeIn( dialogNina, {time=800})
	transition.fadeIn( textNina, {time=1000})

	dialogNino.isVisible=false
	textNino.isVisible=false	
	timer.performWithDelay( 400, dialogo, 1)

	nina:removeEventListener("touch", elegirNina)
	nino:addEventListener("touch", elegirNino)

  end

end


function dialogo( event )
	
		 audio.stop(_G.channel3)
		 --audio.dispose(_G.channel3)

		 if (_G.personaje == "niña") then
		 sonido=audio.loadStream("music/explorador/Frase 402.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)
		 end

		 if (_G.personaje == "niño") then
		 sonido=audio.loadStream("music/explorador/Frase 401.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)
		 end

		 --audio.resume( )

end



function startNube( event )

	transition.fadeIn( nube, {time=1000} )
	--texto.alpha=1

end

function destexto()
	transition.fadeOut( text1, {time=500} )
end

function texto1( event )

	transition.fadeIn( text1, {time=1000} )

	--otherChannel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 2.mp3", {loops = -1, channel = channel2})
	audio.play(sonido)

end


function texto3()
	

	text1.text= "Para continuar, presiona la flecha."
	transition.fadeIn( text1, {time=1000} )

	audio.stop(channel2)
	--audio.dispose(channel2)

	--otherChannel= audio.findFreeChannel()

	sonido=audio.loadStream("music/explorador/Frase 3.mp3", {loops = -1, channel = channel2})
	audio.play(sonido)

end


function validar_Musica( event )
	
	if (audio.isChannelActive(_G.channel) == false) then

		--_G.channel= audio.findFreeChannel()
		--audio.setVolume( 0.03, { channel=_G.channel })
		--audio.setMaxVolume( 0.03, { channel=_G.channel })
		sonido=audio.loadStream(_G.rutaM1, {loops = -1, channel = _G.channel})
		audio.play(sonido)

	end

end

function cancelAll()

	 for i=0,3 do
	 timer.cancel(time[i])
	end


	 transition.cancel()
	 --audio.stop(otherChannel)
	 audio.stop(channel2)
	 audio.stop( _G.channel3)
	 --audio.dispose(otherChannel)
	 --audio.dispose(channel2)

end




function scene:enterScene( event)
	
	flag=false

	boton:addEventListener( "touch", start)
	nino:addEventListener( "touch", elegirNino)
	nina:addEventListener( "touch", elegirNina)

	time[0]=timer.performWithDelay( 0, startNube, 1)
	time[1]=timer.performWithDelay( 1000, texto1, 1)
	time[2]=timer.performWithDelay( 9000, destexto,1)
	time[3]=timer.performWithDelay( 9500, texto3, 1)

	fondo.enterFrame=validar_Musica
	Runtime:addEventListener("enterFrame", fondo)
	

end


function scene:exitScene( event )

   boton:removeEventListener("touch", start)
   nino:removeEventListener( "touch", elegirNino)
   nina:removeEventListener( "touch", elegirNina)
   cancelAll()
   storyboard.removeScene("personaje")

   
end

function scene:destroyScene( event )
	-- body
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene





