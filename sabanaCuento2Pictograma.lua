local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local fondo, boton, icono, ambiente1, ambiente2, planeta, explorador, bannerDown, texto1
local animal1, animal2, animal3, hoja, tran1, grabar, play, screenGroup, letra, sonido
local chocar=false
local newFont=_G.font
local contador=1
local variar=1
local validar=1
local time={}

_G.okPictograma=true

_G.explicar=false


local channel=audio.findFreeChannel( )

local physics = require("physics")
physics.start()
physics.setScale(3)
physics.setGravity( 0, 0 )


local filePath = system.pathForFile( 'ian.wav', system.DocumentsDirectory )
    
local r = media.newRecording( filePath )
    
local audioHandle = nil
    
local audioChannel = nil

_G.count=1



function scene:createScene( event )

	screenGroup= self.view

	fondo=display.newImage("img/sabana1.jpg",1024,600)
	fondo.x=display.contentWidth/2
	fondo.y=display.contentHeight/2
	fondo.surfaceType = "fondo"
	fondo.alpha=0.50
	physics.addBody( fondo, "kinematic")


	animal1= display.newImage( "img/Leon.png" )
	animal1.x= display.contentCenterX -350
	animal1.y= display.contentCenterY -60
	animal1.surfaceType ="leon"
	animal1:scale( 0.70, 0.70 )


	animal2= display.newImage( "img/Elefante.png" )
	animal2.x= display.contentCenterX +430
	animal2.y= display.contentCenterY +100
	animal2.surfaceType ="elefante"
	animal2:scale( 0.70, 0.70 )


	animal3= display.newImage( "img/jirafa.png" )
	animal3.x= display.contentCenterX +430
	animal3.y= display.contentCenterY -200
	animal3.surfaceType ="jirafa"
	animal3:scale( 0.60, 0.60 )


	animal4= display.newImage( "img/Rinoceronte.png" )
	animal4.x= display.contentCenterX +430
	animal4.y= display.contentCenterY -50
	animal4.surfaceType ="rinoceronte"
	animal4:scale( 0.60, 0.60 )

	animal5= display.newImage( "img/Hienas.png" )
	animal5.x= display.contentCenterX + 430
	animal5.y= display.contentCenterY +210
	animal5.surfaceType ="hienas"
	animal5:scale( 0.70, 0.70 )

	animal6= display.newImage( "img/Suricata.png" )
	animal6.x= display.contentCenterX -350
	animal6.y= display.contentCenterY +80
	animal6.surfaceType ="suricata"
	animal6:scale( 0.50, 0.50 )
 

	cuadro1 = display.newRoundedRect( 0, 0, 105, 60, 0 )
	cuadro1.x= display.contentCenterX + 250
	cuadro1.y= display.contentCenterY -190
	cuadro1.strokeWidth = 3
	cuadro1.alpha=1
	cuadro1:setStrokeColor( 0, 0, 0 )

	tran1 = display.newRoundedRect( 0, 0, 5, 5, 0 )
	tran1.x= display.contentCenterX + 250
	tran1.y= display.contentCenterY -190
	tran1:setStrokeColor( 0, 0, 0 )
	tran1.surfaceType = "ian"
	tran1.alpha=1
	physics.addBody( tran1, "static")

    cuadro2 = display.newRoundedRect( 0, 0, 105, 75, 0 )
	cuadro2.x= display.contentCenterX + 270
	cuadro2.y= display.contentCenterY - 110
	cuadro2.strokeWidth = 3
	cuadro2:setStrokeColor( 0, 0, 0 )
	cuadro2.alpha=0

	tran2 = display.newRoundedRect( 0, 0, 5, 5, 0 )
	tran2.x= display.contentCenterX + 270
	tran2.y= display.contentCenterY - 110
	tran2.surfaceType = "ian2"
	physics.addBody( tran2, "static")
	tran2.isVisible=false
	tran2.alpha=0


	cuadro3 = display.newRoundedRect( 0, 0, 70, 95, 0 )
	cuadro3.x= display.contentCenterX +290
	cuadro3.y= display.contentCenterY - 15
	cuadro3.strokeWidth = 3
	cuadro3:setStrokeColor( 0, 0, 0 )
	cuadro3.alpha=0


	tran3 = display.newRoundedRect( 0, 0, 5, 5, 0 )
	tran3.x= display.contentCenterX +290
	tran3.y= display.contentCenterY - 15
	tran3.surfaceType = "ian3"
	tran3.isVisible=false
	tran3.alpha=0
	physics.addBody( tran3, "static")


	cuadro4 = display.newRoundedRect( 0, 0, 90, 50, 0 )
	cuadro4.x= display.contentCenterX + 195
	cuadro4.y= display.contentCenterY + 40
	cuadro4.strokeWidth = 3
	cuadro4:setStrokeColor( 0, 0, 0 )
	cuadro4.alpha=0


	tran4 = display.newRoundedRect( 0, 0, 5, 5, 0 )
	tran4.x= display.contentCenterX + 195
	tran4.y= display.contentCenterY + 40
	tran4.surfaceType = "ian4"
	tran4.isVisible=false
	tran4.alpha=0
	physics.addBody( tran4, "static")


	cuadro5 = display.newRoundedRect( 0, 0, 105, 65, 0 )
	cuadro5.x= display.contentCenterX + 280
	cuadro5.y= display.contentCenterY + 110
	cuadro5.strokeWidth = 3
	cuadro5:setStrokeColor( 0, 0, 0 )
	cuadro5.alpha=0

	tran5 = display.newRoundedRect( 0, 0, 5, 5, 0 )
	tran5.x= display.contentCenterX + 280
	tran5.y= display.contentCenterY + 110
	tran5.surfaceType = "ian5"
	tran5.isVisible=false
	tran5.alpha=0
	physics.addBody( tran5, "static")


	cuadro6 = display.newRoundedRect( 0, 0, 50, 70, 0 )
	cuadro6.x= display.contentCenterX + 190
	cuadro6.y= display.contentCenterY + 170
	cuadro6.strokeWidth = 3
	cuadro6:setStrokeColor( 0, 0, 0 )
	cuadro6.alpha=0

	tran6 = display.newRoundedRect( 0, 0, 5, 5, 0 )
	tran6.x= display.contentCenterX + 190
	tran6.y= display.contentCenterY + 170
	tran6.surfaceType = "ian6"
	tran6.isVisible=false
	tran6.alpha=0
	physics.addBody( tran6, "static")



	bannerDown=display.newRoundedRect( 0, 0, 630, 580, 21 )
	bannerDown.x= display.contentCenterX +30
	bannerDown.y= display.contentCenterY 
	bannerDown.strokeWidth = 6
	bannerDown:setStrokeColor( 0, 0, 0 )
	bannerDown:setFillColor( .98, .941, .745)

	letra= display.newText("Exploremos juntos la sabana, este lugar te va a gustar.", 0, 0, newFont, 16)
	letra.x= display.contentCenterX 
	letra.y=display.contentCenterY -255
	letra.alpha=1
	letra:setFillColor( 0, 0, 0)


	letra2= display.newText("Animales de todos los tipos ahí tú puedes encontrar.", 0, 0, newFont, 16)
	letra2.x= display.contentCenterX -10
	letra2.y=display.contentCenterY -225
	letra2.alpha=1
	letra2:setFillColor( 0, 0, 0)

	letra3= display.newText("Aquí está el enojón, con su melena este es el", 0, 0, newFont, 16)
	letra3.x= display.contentCenterX -10
	letra3.y=display.contentCenterY -190
	letra3.alpha=1
	letra3:setFillColor( 0, 0, 0)


	letra4= display.newText("Y muy muy grande, de orejas gigantes y una trompa, es el ", 0, 0, newFont, 16)
	letra4.x= display.contentCenterX - 10
	letra4.y=display.contentCenterY - 120
	letra4.alpha=0
	letra4:setFillColor( 0, 0, 0)

	letra5= display.newText("También entre las ramas más altas, estira su cuello la ", 0, 0, newFont, 16)
	letra5.x= display.contentCenterX + 20
	letra5.y=display.contentCenterY - 30
	letra5.alpha=0
	letra5:setFillColor( 0, 0, 0)

	letra6= display.newText("Y más abajo mira al horizonte, en un charco de lodo el", 0, 0, newFont, 16)
	letra6.x= display.contentCenterX - 60
	letra6.y= display.contentCenterY + 40
	letra6.alpha=0
	letra6:setFillColor( 0, 0, 0)

	letra7= display.newText("Las más risueñas, de humor muy buenas, son las queridas amigas ", 0, 0, newFont, 16)
	letra7.x= display.contentCenterX - 20
	letra7.y=display.contentCenterY +110
	letra7.alpha=0
	letra7:setFillColor( 0, 0, 0)

	letra8= display.newText("¿Quién las observa parada en dos patas? Son las vecinas", 0, 0, newFont, 16)
	letra8.x= display.contentCenterX - 55
	letra8.y=display.contentCenterY +170
	letra8.alpha=0
	letra8:setFillColor( 0, 0, 0)

	letra9= display.newText("Bueno amigos que rápido ha sido, pero ha terminado el recorrido", 0, 0, newFont, 16)
	letra9.x= display.contentCenterX 
	letra9.y=display.contentCenterY +225
	letra9.alpha=0
	letra9:setFillColor( 0, 0, 0)

	letra10= display.newText("Yo ahora sí que me despido, pues la sabana han conocido.", 0, 0, newFont, 16)
	letra10.x= display.contentCenterX -30
	letra10.y=display.contentCenterY +255
	letra10.alpha=0
	letra10:setFillColor( 0, 0, 0)


	grabar = display.newImage("img/Grabar.png")
    grabar.x = display.contentCenterX +400
    grabar.y = display.contentCenterY -140
    grabar:scale( 0.11, 0.11)
    grabar.isVisible=true
    grabar.alpha=0


    play = display.newImage("img/play.png")
    play.x = display.contentCenterX +460
    play.y = display.contentCenterY -140
    play:scale( 0.11, 0.11)
    play.isVisible=true
    play.alpha=0


    barra=display.newRoundedRect( 0, 0, 140, 80, 21 )
	barra.x= display.contentCenterX +430
	barra.y= display.contentCenterY -140
	barra.strokeWidth = 6
	barra:setStrokeColor( 0, 0, 0 )
	barra:setFillColor( .98, .941, .745)
	barra.alpha=0


    
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


	nube=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 200, 110, 12 )
	nube.x=display.contentCenterX-400
	nube.y=display.contentCenterY-220
	nube.strokeWidth = 6
	nube:setStrokeColor( 0, 0, 0 )
	--nube:setFillColor( .827, .902, .898)
	nube.alpha=1

	texto1= display.newText("¡Pon mucha atención!\nPara que puedas\ncompletar la canción.", 0, 0, newFont, 16)
	texto1.x= display.contentCenterX -400
	texto1.y=display.contentCenterY -220
	texto1.alpha=0
	texto1:setFillColor( 0, 0, 0)


	flechaB= display.newImage( "img/flecha1.png")
	flechaB.x=display.contentCenterX + 400
	flechaB.y=display.contentCenterY -65
	flechaB.alpha=0
	flechaB:scale(0.04, 0.035)

	nube2=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 100, 50, 12 )
	nube2.x=display.contentCenterX-450
	nube2.y=display.contentCenterY -130
	nube2.strokeWidth = 6
	nube2:setStrokeColor( 0, 0, 0 )
	nube2:setFillColor( .98, .941, .745)
	nube2.alpha=1

	pause=display.newImage( "img/pause.png")
	pause:scale( 0.35, 0.35)
	pause.x=display.contentCenterX -450
	pause.y=display.contentCenterY - 130
	pause.alpha=0

	play2=display.newImage( "img/play2.png")
	play2:scale( 0.35, 0.35)
	play2.x=display.contentCenterX -450
	play2.y=display.contentCenterY - 130
	play2.alpha=1

 

	screenGroup:insert(fondo)
	screenGroup:insert(bannerDown)
	screenGroup:insert(nube2)
	screenGroup:insert(play2)
	screenGroup:insert(pause)

	screenGroup:insert(cuadro1)
	screenGroup:insert(cuadro2)
	screenGroup:insert(cuadro3)
	screenGroup:insert(cuadro4)
	screenGroup:insert(cuadro5)
	screenGroup:insert(cuadro6)
	screenGroup:insert(tran1)
	screenGroup:insert(tran2)
	screenGroup:insert(tran3)
	screenGroup:insert(tran4)
	screenGroup:insert(tran5)
	screenGroup:insert(tran6)
	screenGroup:insert(animal1)
	screenGroup:insert(animal2)
	screenGroup:insert(animal3)
	screenGroup:insert(animal4)
	screenGroup:insert(animal5)
	screenGroup:insert(animal6)
	screenGroup:insert(letra)
	screenGroup:insert(letra2)
	screenGroup:insert(letra3)
	screenGroup:insert(letra4)
	screenGroup:insert(letra5)
	screenGroup:insert(letra6)
	screenGroup:insert(letra7)
	screenGroup:insert(letra8)
	screenGroup:insert(letra9)
	screenGroup:insert(letra10)
	screenGroup:insert(barra)
	screenGroup:insert(icono)
	screenGroup:insert(boton)
	screenGroup:insert(grabar)
	screenGroup:insert(flechaB)
	screenGroup:insert(play)
	screenGroup:insert(nube)
	screenGroup:insert(texto1)


end

function  listen_on( event )

	if event.phase == "began" then

		 audio.pause( _G.channel)

		 audio.stop(channel2)
		 audio.dispose(channel2)
		 channel2= audio.findFreeChannel()

		 audio.setVolume( 0.10, { channel=channel2})
		 audio.setMaxVolume( 0.10, { channel=_channel2})

		 play2:removeEventListener( "touch", listen_on)
		 play2.alpha=0

		 pause.alpha=1
		 pause:addEventListener( "touch", listen_off)


		if (contador ==  1) then

			 sonido=audio.loadStream("music/pictograma/picto2-leon.mp3", {loops = -1, channel = channel2})
			 tempo=audio.getDuration(sonido)
			 audio.play(sonido)
			 time[0]=timer.performWithDelay( tempo -3000, sin_pause, 1)


		elseif (contador == 2) then

			sonido=audio.loadStream("music/pictograma/picto2-elefante.mp3", {loops = -1, channel = channel2})
		    tempo=audio.getDuration(sonido)
		    audio.play(sonido)
		    time[0]=timer.performWithDelay( tempo, sin_pause, 1)


		elseif (contador == 3) then

			sonido=audio.loadStream("music/pictograma/picto2-jirafa.mp3", {loops = -1, channel = channel2})
		    tempo=audio.getDuration(sonido)
		    audio.play(sonido)
		    time[0]=timer.performWithDelay( tempo, sin_pause, 1)


		elseif (contador == 4) then

			sonido=audio.loadStream("music/pictograma/picto2-rino.mp3", {loops = -1, channel = channel2})
		    tempo=audio.getDuration(sonido)
		    audio.play(sonido)
		    time[0]=timer.performWithDelay( tempo, sin_pause, 1)


		elseif (contador == 5) then

			sonido=audio.loadStream("music/pictograma/picto2-hienas.mp3", {loops = -1, channel = channel2})
		    tempo=audio.getDuration(sonido)
		    audio.play(sonido)
		    time[0]=timer.performWithDelay( tempo, sin_pause, 1)


		elseif (contador == 6) then

			sonido=audio.loadStream("music/pictograma/picto2-suricata.mp3", {loops = -1, channel = channel2})
		    tempo=audio.getDuration(sonido)
		    audio.play(sonido)
		    time[0]=timer.performWithDelay( tempo, sin_pause, 1)

		end


	end 

end

function sin_pause()

		 play2:addEventListener( "touch", listen_on)
		 play2.alpha=1

		 pause.alpha=0
		 pause:removeEventListener( "touch", listen_off)

		 audio.stop(channel2)
		 audio.dispose(channel2)

		 audio.setVolume( 0.03, { channel=_G.channel})
		 audio.setMaxVolume( 0.03, { channel=_G.channel})


		 audio.resume( _G.channel)

end



function listen_off(event)
	
	if event.phase == "began" then


	     play2:addEventListener( "touch", listen_on)
		 play2.alpha=1

		 pause.alpha=0
		 pause:removeEventListener( "touch", listen_off)

		 audio.stop(channel2)
		 audio.dispose(channel2)
		 timer.cancel(time[0])
		 audio.resume( _G.channel)


	end

end




function move_image( event )

	local self = event.target

	_G.collision= false

	if event.phase == "began" then

		physics.removeBody( self )
	    display.getCurrentStage():setFocus( event.target )
	    self.markX = self.x    -- store x location of object
	    self.markY = self.y    -- store y location of object

	    _G.moveX=self.x
	    _G.moveY=self.y

	elseif event.phase == "moved" then

	  	  local x = (event.x - event.xStart) + self.markX
	  	  local y = (event.y - event.yStart) + self.markY

	      self.x, self.y = x, y

    elseif event.phase == "ended"  or event.phase == "cancelled" then


    	  audio.stop(channel2)
	      audio.dispose(channel2)
	      channel2=audio.findFreeChannel()
	      audio.setVolume( 1, { channel=channel2})
	      audio.setMaxVolume( 1, { channel=channel2})

    	  physics.addBody( self, "dynamic", { isSensor=true} )
	   	  display.getCurrentStage():setFocus(nil)



	end

end



function onCollision (event)

	local self= event.target

	if (event.phase == "began") then


	 if (event.other.surfaceType ~= "fondo"  and _G.collision == false) then


		  if (self.surfaceType == "leon" and event.other.surfaceType =="ian"  and contador == 1) then

		  self:removeEventListener( "touch", move_image )
		  _G.collision= true
		   contador=2
		   texto1.text="Perfecto,\nes el león,\ncontinúa"
		   mostrarSig(1)
		   sonido=audio.loadStream("music/explorador/leon2.mp3", {loops = -1, channel = channel2})
		   audio.play(sonido)

		  elseif (self.surfaceType == "elefante" and event.other.surfaceType == "ian2" and contador == 2) then

		  self:removeEventListener( "touch", move_image )
		  _G.collision= true
		  contador=3
		  texto1.text="Perfecto,\nes el elefante,\ncontinúa"
		  mostrarSig(2)
		  sonido=audio.loadStream("music/explorador/elefante2.mp3", {loops = -1, channel = channel2})
		  audio.play(sonido)

		  elseif (self.surfaceType == "jirafa" and event.other.surfaceType == "ian3" and contador == 3 ) then

		  self:removeEventListener( "touch", move_image )
		  _G.collision= true
		  contador=4
		  texto1.text="Perfecto,\nes la jirafa,\ncontinúa"
		  mostrarSig(3)
		  sonido=audio.loadStream("music/explorador/jirafa2.mp3", {loops = -1, channel = channel2})
		  audio.play(sonido)

		  elseif (self.surfaceType == "rinoceronte" and event.other.surfaceType == "ian4" and contador == 4) then

		  self:removeEventListener( "touch", move_image )
		  _G.collision= true
		  contador=5
		  texto1.text="Perfecto,\nes el rinoceronte,\ncontinúa"
		  mostrarSig(4)
		  sonido=audio.loadStream("music/explorador/rino2.mp3", {loops = -1, channel = channel2})
		   audio.play(sonido)

		  elseif (self.surfaceType == "hienas" and event.other.surfaceType == "ian5" and contador == 5) then

		  self:removeEventListener( "touch", move_image )
		  _G.collision= true
		  contador=6
		  mostrarSig(5)
		  texto1.text="Perfecto,\nson las hienas,\ncontinúa"
		  
		  sonido=audio.loadStream("music/explorador/hienas2.mp3", {loops = -1, channel = channel2})
		  audio.play(sonido)


		  elseif (self.surfaceType == "suricata" and event.other.surfaceType == "ian6" and contador == 6) then

		  self:removeEventListener( "touch", move_image )
		  _G.collision= true
		  contador=7
		  mostrarSig(6)
		  texto1.text="¡Te felicito, eres\nmuy hábil para esto!"
		  audio.pause( _G.channel)

		  sonido=audio.loadStream("music/explorador/Frase 33.mp3", {loops = -1, channel = channel2})
		  audio.play(sonido)

		  transition.fadeOut( nube2, {time=1000} )
		  transition.fadeOut( play2, {time=1000} )
		  transition.fadeOut( pause, {time=1000} )

		  audio.pause( _G.channel)


		  end

	   elseif (_G.collision == false) then

	 	physics.removeBody( self )
	 	--physics.removeBody( event.other.surfaceType)
	  	transition.moveTo( self, {x=_G.moveX, y=_G.moveY} )
	  	_G.collision= true
	  

	  	if (validar == 1) then

	  	validar=2
	  	audio.stop(channel2)
	  	audio.dispose(channel2)
	  	channel2=audio.findFreeChannel()
	  	audio.setVolume( 1, { channel=channel2})
	    audio.setMaxVolume( 1, { channel=channel2})

        variar=math.random()


		if ( variar < 0.33) then
	  	
	  	texto1.text="¡¡Ánimo!!"

	  	sonido=audio.loadStream("music/explorador/animo.mp3", {loops = -1, channel = channel2})
		audio.play(sonido)
		timer.performWithDelay( 1, validar_on, 1)


	    elseif (variar < 0.66) then

	    texto1.text="¡¡Tú puedes!!"

	  	sonido=audio.loadStream("music/explorador/puedes.mp3", {loops = -1, channel = channel2})
		audio.play(sonido)
		timer.performWithDelay( 1000, validar_on, 1)

	    elseif (variar < 1) then

	    texto1.text="¿Estás seguro?"
        
        sonido=audio.loadStream("music/explorador/seguro.mp3", {loops = -1, channel = channel2})
		audio.play(sonido)
		timer.performWithDelay( 1000, validar_on, 1)

	    end

    	
       end

	end

  end

end 

function validar_on()
	
	validar=1

end


function mostrarSig( count)
	

	if (count == 1) then

		transition.fadeIn( cuadro2, {time=1000} )
		tran2.isVisible=true
		tran2.bodyType="static"
		transition.fadeIn( tran2, {time=1000} )
		transition.fadeIn( letra4, {time=1000} )
		--transition.fadeIn( letra3, {time=1000} )

	elseif (count == 2) then

		transition.fadeIn( cuadro3, {time=1000} )
		tran3.isVisible=true
		transition.fadeIn( tran3, {time=1000} )
		transition.fadeIn( letra5, {time=1000} )
		


	elseif (count == 3) then
		transition.fadeIn( cuadro4, {time=1000} )
		tran4.isVisible=true
		transition.fadeIn( tran4, {time=1000} )
		transition.fadeIn( letra6, {time=1000} )
		--transition.fadeIn( letra5, {time=1000} )

	elseif (count == 4) then

		transition.fadeIn( cuadro5, {time=1000} )
		tran5.isVisible=true
		transition.fadeIn( tran5, {time=1000} )
		transition.fadeIn( letra7, {time=1000} )

	elseif (count == 5) then

		transition.fadeIn( letra8, {time=1000} )
		transition.fadeIn( cuadro6, {time=1000} )
		tran6.isVisible=true
		transition.fadeIn( tran6, {time=1000} )

	elseif (count == 6) then


		transition.fadeIn( letra9, {time=1000} )
		transition.fadeIn( letra10, {time=1000} )
		grabar.isVisible=true
		--transition.fadeIn( icono,{time=1000})
		timer.performWithDelay( 3000, texto_grabar, 1)

	end

 end


	--[[function texto_cancion()

		texto1.text= "Ahora cantemos\njuntos la canción,\ny si quieres puedes\ngrabar tu voz."
		transition.fadeIn( texto1, {time=1000} )
		grabar.isVisible=true
		timer.performWithDelay( 3000, texto_grabar, 1)


	end]]

	function texto_grabar()

		texto1.text= "Ahora cantemos\njuntos la canción,\ny si quieres puedes\ngrabar tu voz."

		transition.fadeIn( grabar, {time=1000} )
		transition.fadeIn( boton, {time=1000} )
		transition.fadeIn( barra, {time=1000} )
		transition.fadeIn( nube, {time=1000} )
		transition.fadeIn( flechaB, {time=1000} )
		timer.performWithDelay( 2000, blink, 1 )

		channel=audio.findFreeChannel()
		audio.setVolume( 1, { channel=channel})
		audio.setMaxVolume( 1, { channel=channel})

		sonido=audio.loadStream("music/explorador/Frase 34.mp3", {loops = -1, channel = channel})
		audio.play(sonido)

		timer.performWithDelay( 5000, cancion_on, 1)

	end


function cancion_on()

		--audio.stop( _G.channel)
		channel=audio.findFreeChannel()
		audio.setVolume( 0.10, { channel=channel})
		audio.setMaxVolume( 0.10, { channel=_channel})
		sonido=audio.loadStream("music/pictograma/cuento2.mp3", {loops = -1, channel = channel})
		audio.play(sonido)
		transition.fadeIn( icono,{time=1000})

end




function blink(event)

	transition.blink( flechaB, {time=3000} )

end



function record(event)
    
  if event.phase == "began" then    

  	flechaB.isVisible=false
  	os.remove( system.pathForFile( "ian.wav", system.DocumentsDirectory ))


       if (audioHandle ~= nil) then
                
                --stop audio before disposing it
                if (audio.isChannelActive(audioChannel)) then
                    audio.stop(audioChannel)
                end
                      
                audio.dispose(audioHandle)
        end 
            
        r:startRecording()
        play.isVisible=true
        transition.fadeIn( play, {time=2000})

        audio.stop(channel)
	    audio.dispose(channel)
	    channel=audio.findFreeChannel()


        sonido=audio.loadStream("music/pictograma/cuento2.mp3", {loops = -1, channel = channel})
		audio.play(sonido)
		grabar:removeEventListener( "touch", record)

    end
end


function stop(event)

    if event.phase == "began" then

     audio.stop(channel)
     audio.dispose(channel)

     r:stopRecording()
     grabar:addEventListener( "touch", record)

     audioHandle = audio.loadSound( "ian.wav", system.DocumentsDirectory )
        
     audioChannel = audio.play(audioHandle)

    end
    
end

function start( event )
	
	if event.phase == "began" then

	  audio.resume( _G.channel)
	  storyboard.gotoScene("selectJuegos2","fade",400)
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


function texto_1()
	
	transition.fadeIn( texto1, {time=1000} )
	sonido=audio.loadStream("music/explorador/Frase 32.mp3", {loops = -1, channel = channel})
	audio.play(sonido)

end






function scene:enterScene( event)

	fondo.enterFrame=validar_Musica
	Runtime:addEventListener("enterFrame", fondo)

	_G.okPictograma=true
	--audio.setVolume( 0.20, { channel=_G.channel })
	--audio.setMaxVolume( 0.30, { channel=_G.channel })

    animal1:addEventListener( "touch", move_image)
    animal2:addEventListener( "touch", move_image)
    animal3:addEventListener( "touch", move_image)
    animal4:addEventListener( "touch", move_image)
    animal5:addEventListener( "touch", move_image)
    animal6:addEventListener( "touch", move_image)

    grabar:addEventListener( "touch", record)
    play:addEventListener( "touch", stop)
    play2:addEventListener( "touch", listen_on)

    sonido=audio.loadStream("music/explorador/Parrafo 27.mp3", {loops = -1, channel = channel})
	audio.play(sonido)

    --timer.performWithDelay( 4000, show_letra, 1)

    icono:addEventListener( "touch", start)
    boton:addEventListener( "touch", start)


    animal3:addEventListener("collision", onCollision)
    animal1:addEventListener( "collision", onCollision)
    animal2:addEventListener( "collision", onCollision)
    animal4:addEventListener( "collision", onCollision)
    animal5:addEventListener( "collision", onCollision)
    animal6:addEventListener( "collision", onCollision)
   -- _G.okPictograma= true

    if (_G.sinMusica == true ) then

		corchea.isVisible=false
		corchea2.isVisible=true
		audio.pause(_G.channel)
		corchea:removeEventListener( "touch", sin_musica)
		corchea2:addEventListener( "touch", con_musica )

	end

	timer.performWithDelay( 0, texto_1, 1)


end



function scene:exitScene( event )

	animal1:removeEventListener( "touch", move_image)
    animal2:removeEventListener( "touch", move_image)
    animal3:removeEventListener( "touch", move_image)
    grabar:removeEventListener( "touch", record)
    play:removeEventListener( "touch", stop)
    icono:removeEventListener( "touch", start)
    tran1:removeEventListener( "collision", onCollision )
    
  
  	channel=audio.findFreeChannel()
	audio.setVolume( 1, { channel=channel})
	audio.setMaxVolume( 1, { channel=channel})
	
    audio.stop(audioChannel)
    audio.dispose(audioChannel)
    audio.stop(channel)
    audio.dispose(channel)
    

    transition.cancel()
    --audio.dispose( channel )
    os.remove( system.pathForFile( "ian.wav", system.DocumentsDirectory ) )
    storyboard.removeScene("sabanaCuento2Pictograma")


end

function scene:destroyScene( event )
	    

end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene