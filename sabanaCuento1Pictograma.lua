local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local fondo, boton, icono, ambiente1, ambiente2, planeta, explorador, bannerDown
local animal1, animal2, animal3, hoja, tran1, grabar, play, screenGroup, letra, sonido
local chocar=false

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

	fondo=display.newImage("img/sabana.jpg",1024,600)
	fondo.x=display.contentWidth/2
	fondo.y=display.contentHeight/2
	fondo.surfaceType = "fondo"
	fondo.alpha=0.50
	physics.addBody( fondo, "static")


	animal1= display.newImage( "img/Cebra.png" )
	animal1.x= display.contentCenterX -350
	animal1.y= display.contentCenterY -50
	animal1.surfaceType ="cebra"
	animal1:scale( 0.80, 0.80 )


	animal2= display.newImage( "img/Hipo.png" )
	animal2.x= display.contentCenterX +430
	animal2.y= display.contentCenterY +100
	animal2.surfaceType ="hipopotamo"
	animal2:scale( 0.80, 0.80 )


	animal3= display.newImage( "img/Cocodrilo.png" )
	animal3.x= display.contentCenterX +430
	animal3.y= display.contentCenterY -200
	animal3.surfaceType ="cocodrilo"
	animal3:scale( 0.80, 0.80 )


	animal4= display.newImage( "img/nu.png" )
	animal4.x= display.contentCenterX +430
	animal4.y= display.contentCenterY -50
	animal4.surfaceType ="nu"
	animal4:scale( 0.80, 0.80 )

	animal5= display.newImage( "img/avestruz.png" )
	animal5.x= display.contentCenterX -350
	animal5.y= display.contentCenterY +120
	animal5.surfaceType ="avestruz"
	animal5:scale( 0.80, 0.80 )
 

	cuadro1 = display.newRoundedRect( 0, 0, 130, 70, 0 )
	cuadro1.x= display.contentCenterX -100
	cuadro1.y= display.contentCenterY -220
	cuadro1.strokeWidth = 3
	cuadro1:setStrokeColor( 0, 0, 0 )

	tran1 = display.newRoundedRect( 0, 0, 15, 15, 0 )
	tran1.x= display.contentCenterX -70
	tran1.y= display.contentCenterY -220
	tran1.surfaceType = "ian"
	physics.addBody( tran1, "static")

    cuadro2 = display.newRoundedRect( 0, 0, 130, 85, 0 )
	cuadro2.x= display.contentCenterX + 180
	cuadro2.y= display.contentCenterY - 160
	cuadro2.strokeWidth = 3
	cuadro2:setStrokeColor( 0, 0, 0 )
	cuadro2.alpha=0

	tran2 = display.newRoundedRect( 0, 0, 15, 15, 0 )
	tran2.x= display.contentCenterX +210
	tran2.y= display.contentCenterY -160 
	tran2.surfaceType = "ian2"
	physics.addBody( tran2, "static")
	tran2.isVisible=false
	tran2.alpha=0


	cuadro3 = display.newRoundedRect( 0, 0, 110, 90, 0 )
	cuadro3.x= display.contentCenterX +130
	cuadro3.y= display.contentCenterY - 60
	cuadro3.strokeWidth = 3
	cuadro3:setStrokeColor( 0, 0, 0 )
	cuadro3.alpha=0


	tran3 = display.newRoundedRect( 0, 0, 15, 15, 0 )
	tran3.x= display.contentCenterX + 170
	tran3.y= display.contentCenterY -60 
	tran3.surfaceType = "ian3"
	tran3.isVisible=false
	tran3.alpha=0
	physics.addBody( tran3, "static")


	cuadro4 = display.newRoundedRect( 0, 0, 100, 110, 0 )
	cuadro4.x= display.contentCenterX -10
	cuadro4.y= display.contentCenterY +20
	cuadro4.strokeWidth = 3
	cuadro4:setStrokeColor( 0, 0, 0 )
	cuadro4.alpha=0


	tran4 = display.newRoundedRect( 0, 0, 15, 15, 0 )
	tran4.x= display.contentCenterX + 30
	tran4.y= display.contentCenterY + 20 
	tran4.surfaceType = "ian4"
	tran4.isVisible=false
	tran4.alpha=0
	physics.addBody( tran4, "static")


	cuadro5 = display.newRoundedRect( 0, 0, 135, 75, 0 )
	cuadro5.x= display.contentCenterX + 60
	cuadro5.y= display.contentCenterY + 180
	cuadro5.strokeWidth = 3
	cuadro5:setStrokeColor( 0, 0, 0 )
	cuadro5.alpha=0

	tran5 = display.newRoundedRect( 0, 0, 15, 15, 0 )
	tran5.x= display.contentCenterX + 100
	tran5.y= display.contentCenterY + 180
	tran5.surfaceType = "ian5"
	tran5.isVisible=false
	tran5.alpha=0
	physics.addBody( tran5, "static")


	bannerDown=display.newRoundedRect( 0, 0, 600, 550, 21 )
	bannerDown.x= display.contentCenterX +10
	bannerDown.y= display.contentCenterY 
	bannerDown.strokeWidth = 6
	bannerDown:setStrokeColor( 0, 0, 0 )
	bannerDown:setFillColor( .827, .902, .898)

	letra= display.newText("Coco, coco, ", 0, 0, native.systemFont, 16)
	letra.x= display.contentCenterX -220
	letra.y=display.contentCenterY -220
	letra.alpha=1
	letra:setFillColor( 0, 0, 0)

	letra2= display.newText(", sumergido en un río, levantando sus ojitos,", 0, 0, native.systemFont, 16)
	letra2.x= display.contentCenterX +140
	letra2.y=display.contentCenterY -220
	letra2.alpha=1
	letra2:setFillColor( 0, 0, 0)

	letra3= display.newText("para ver a sus amigos. Ahí viene una rayada, es la ", 0, 0, native.systemFont, 16)
	letra3.x= display.contentCenterX -80
	letra3.y=display.contentCenterY -160
	letra3.alpha=0
	letra3:setFillColor( 0, 0, 0)

	letra4= display.newText("en la sabana. Más atrás con grandes cuernos", 0, 0, native.systemFont, 16)
	letra4.x= display.contentCenterX -100
	letra4.y=display.contentCenterY -70
	letra4.alpha=0
	letra4:setFillColor( 0, 0, 0)

    letra5= display.newText("en la sabana.", 0, 0, native.systemFont, 16)
	letra5.x= display.contentCenterX +240
	letra5.y=display.contentCenterY -70
	letra5.alpha=0
	letra5:setFillColor( 0, 0, 0)

	letra6= display.newText("Se divisan muchas plumas,", 0, 0, native.systemFont, 16)
	letra6.x= display.contentCenterX -170
	letra6.y=display.contentCenterY +10
	letra6.alpha=0
	letra6:setFillColor( 0, 0, 0)

	letra7= display.newText("en la sabana.", 0, 0, native.systemFont, 16)
	letra7.x= display.contentCenterX +100
	letra7.y=display.contentCenterY +10
	letra7.alpha=0
	letra7:setFillColor( 0, 0, 0)

	letra8= display.newText("Esperemos un momento, falta alguien por nombrar, animalito corpulento", 0, 0, native.systemFont, 16)
	letra8.x= display.contentCenterX -10
	letra8.y=display.contentCenterY +110
	letra8.alpha=0
	letra8:setFillColor( 0, 0, 0)

	letra9= display.newText("bajo el agua debe estar, Hipo, hipo, ", 0, 0, native.systemFont, 16)
	letra9.x= display.contentCenterX -140
	letra9.y=display.contentCenterY +170
	letra9.alpha=0
	letra9:setFillColor( 0, 0, 0)

	letra10= display.newText("a mi lado tú estas,", 0, 0, native.systemFont, 16)
	letra10.x= display.contentCenterX +200
	letra10.y=display.contentCenterY +170
	letra10.alpha=0
	letra10:setFillColor( 0, 0, 0)

	letra11= display.newText("¡Comencemos a bailar!.", 0, 0, native.systemFont, 16)
	letra11.x= display.contentCenterX -180
	letra11.y=display.contentCenterY +240
	letra11.alpha=0
	letra11:setFillColor( 0, 0, 0)


	grabar = display.newImage("img/Grabar.png")
    grabar.x = display.contentCenterX +380
    grabar.y = display.contentCenterY -140
    grabar:scale( 0.13, 0.13)
    grabar.isVisible=false
    grabar.alpha=0


    play = display.newImage("img/play.png")
    play.x = display.contentCenterX +450
    play.y = display.contentCenterY -140
    play:scale( 0.13, 0.13)
    play.isVisible=false
    play.alpha=0


    barra=display.newRoundedRect( 0, 0, 180, 80, 21 )
	barra.x= display.contentCenterX +410
	barra.y= display.contentCenterY -140
	barra.strokeWidth = 6
	barra:setStrokeColor( 0, 0, 0 )
	barra:setFillColor( .827, .902, .898)
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


	nube=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 180, 100, 12 )
	nube.x=display.contentCenterX-400
	nube.y=display.contentCenterY-220
	nube.strokeWidth = 6
	nube:setStrokeColor( 0, 0, 0 )
	nube:setFillColor( .827, .902, .898)
	nube.alpha=0

	texto1= display.newText("Ahora Graba" .. "\ntu ¡canción!", 0, 0, native.systemFont, 16)
	texto1.x= display.contentCenterX -400
	texto1.y=display.contentCenterY -220
	texto1.alpha=0
	texto1:setFillColor( 0, 0, 0)


	flechaB= display.newImage( "img/flecha1.png")
	flechaB.x=display.contentCenterX + 380
	flechaB.y=display.contentCenterY -60
	flechaB.alpha=0
	flechaB:scale(0.04, 0.035)

 

	screenGroup:insert(fondo)
	screenGroup:insert(bannerDown)
	screenGroup:insert(cuadro1)
	screenGroup:insert(cuadro2)
	screenGroup:insert(cuadro3)
	screenGroup:insert(cuadro4)
	screenGroup:insert(cuadro5)
	screenGroup:insert(tran1)
	screenGroup:insert(tran2)
	screenGroup:insert(tran3)
	screenGroup:insert(tran4)
	screenGroup:insert(tran5)
	screenGroup:insert(animal1)
	screenGroup:insert(animal2)
	screenGroup:insert(animal3)
	screenGroup:insert(animal4)
	screenGroup:insert(animal5)
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
	screenGroup:insert(letra11)
	screenGroup:insert(barra)
	screenGroup:insert(icono)
	screenGroup:insert(boton)
	screenGroup:insert(grabar)
	screenGroup:insert(flechaB)
	screenGroup:insert(play)
	screenGroup:insert(nube)
	screenGroup:insert(texto1)


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

    	  physics.addBody( self, "dynamic", { isSensor=true} )
	   	  display.getCurrentStage():setFocus(nil)	   	  
	end

end



function onCollision (event)

	local self= event.target


	if (event.phase == "began") then

	 if (event.other.surfaceType ~= "fondo"  and _G.collision == false) then


		  if (self.surfaceType == "cocodrilo" and event.other.surfaceType =="ian") then

		  self:removeEventListener( "touch", move_image )
		  _G.collision= true
		   mostrarSig(1)
		   sonido=audio.loadStream("music/explorador/Frase 32.mp3", {loops = -1, channel = channel})
		   audio.play(sonido)

		  elseif (self.surfaceType == "cebra" and event.other.surfaceType == "ian2") then

		  self:removeEventListener( "touch", move_image )
		  _G.collision= true
		  mostrarSig(2)
		   sonido=audio.loadStream("music/explorador/Frase 32.mp3", {loops = -1, channel = channel})
		   audio.play(sonido)

		  elseif (self.surfaceType == "nu" and event.other.surfaceType == "ian3") then

		  self:removeEventListener( "touch", move_image )
		  _G.collision= true
		  mostrarSig(3)
		  sonido=audio.loadStream("music/explorador/Frase 32.mp3", {loops = -1, channel = channel})
		  audio.play(sonido)

		  elseif (self.surfaceType == "avestruz" and event.other.surfaceType == "ian4") then

		  self:removeEventListener( "touch", move_image )
		  _G.collision= true
		  mostrarSig(4)
		  sonido=audio.loadStream("music/explorador/Frase 32.mp3", {loops = -1, channel = channel})
		   audio.play(sonido)

		  elseif (self.surfaceType == "hipopotamo" and event.other.surfaceType == "ian5") then

		  self:removeEventListener( "touch", move_image )
		  _G.collision= true
		  mostrarSig(5)
		  audio.pause( _G.channel)
		  sonido=audio.loadStream("music/pictograma/cuento1.mp3", {loops = -1, channel = channel})
		  audio.play(sonido)
		  
		  end

	 elseif (_G.collision == false) then

	 	physics.removeBody( self )
	 	--physics.removeBody( event.other.surfaceType)
	  	transition.moveTo( self, {x=_G.moveX, y=_G.moveY} )
	  	_G.collision= true
	  	sonido=audio.loadStream("music/explorador/Frase 30.mp3", {loops = -1, channel = channel})
		audio.play(sonido)
	  	--print( self.surfaceType )

    	
       end

	end

end 


function mostrarSig( count)
	

	if (count == 1) then

		transition.fadeIn( cuadro2, {time=1000} )
		tran2.isVisible=true
		transition.fadeIn( tran2, {time=1000} )
		transition.fadeIn( letra3, {time=1000} )

	elseif (count == 2) then

		transition.fadeIn( cuadro3, {time=1000} )
		tran3.isVisible=true
		transition.fadeIn( tran3, {time=1000} )
		transition.fadeIn( letra4, {time=1000} )
		transition.fadeIn( letra5, {time=1000} )


	elseif (count == 3) then
		transition.fadeIn( cuadro4, {time=1000} )
		tran4.isVisible=true
		transition.fadeIn( tran4, {time=1000} )
		transition.fadeIn( letra6, {time=1000} )
		transition.fadeIn( letra7, {time=1000} )


	elseif (count == 4) then

		transition.fadeIn( cuadro5, {time=1000} )
		tran5.isVisible=true
		transition.fadeIn( tran5, {time=1000} )
		transition.fadeIn( letra8, {time=1000} )
		transition.fadeIn( letra9, {time=1000} )

	elseif (count == 5) then

		transition.fadeIn( letra10, {time=1000} )
		transition.fadeIn( letra11, {time=1000} )
		transition.fadeIn( boton, {time=1000} )
		grabar.isVisible=true
		transition.fadeIn( grabar, {time=1000} )
		transition.fadeIn( barra, {time=1000} )
		transition.fadeIn( nube, {time=1000} )
		transition.fadeIn( texto1, {time=1000} )
		--sonido=audio.loadStream("music/explorador/Frase35.mp3", {loops = -1, channel = channel})
		--audio.play(sonido)
		transition.fadeIn( flechaB, {time=1000} )
		timer.performWithDelay( 2000, blink, 1 )

	end


end




function blink(event)

	transition.blink( flechaB, {time=3000} )

end



function record(event)
    
  if event.phase == "began" then    

  	flechaB.isVisible=false  

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

    end
end


function stop(event)

    if event.phase == "began" then

     r:stopRecording()

     audioHandle = audio.loadSound( "ian.wav", system.DocumentsDirectory )
        
     audioChannel = audio.play(audioHandle)

    end
    
end

function start( event )
	
	if event.phase == "began" then


	  audio.resume( _G.channel)
	  storyboard.gotoScene("selectJuegos","fade",400)
	end
end


function validar_Musica( event )
	
	if (audio.isChannelActive(_G.channel) == false) then

		_G.channel= audio.findFreeChannel()
		audio.setVolume( 0.30, { channel=_G.channel })
		audio.setMaxVolume( 0.40, { channel=_G.channel })
		sonido=audio.loadStream(_G.rutaM2, {loops = -1, channel = _G.channel})
		audio.play(sonido)

	end

end






function scene:enterScene( event)

	--fondo.enterFrame=validar_Musica
	--Runtime:addEventListener("enterFrame", fondo)


    animal1:addEventListener( "touch", move_image)
    animal2:addEventListener( "touch", move_image)
    animal3:addEventListener( "touch", move_image)
    animal4:addEventListener( "touch", move_image)
    animal5:addEventListener( "touch", move_image)

    grabar:addEventListener( "touch", record)
    play:addEventListener( "touch", stop)

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
   -- _G.okPictograma= true

    if (_G.sinMusica == true ) then

		corchea.isVisible=false
		corchea2.isVisible=true
		audio.pause(_G.channel)
		corchea:removeEventListener( "touch", sin_musica)
		corchea2:addEventListener( "touch", con_musica )

	end


end



function scene:exitScene( event )

	animal1:removeEventListener( "touch", move_image)
    animal2:removeEventListener( "touch", move_image)
    animal3:removeEventListener( "touch", move_image)
    grabar:removeEventListener( "touch", record)
    play:removeEventListener( "touch", stop)
    icono:removeEventListener( "touch", start)
    tran1:removeEventListener( "collision", onCollision )
    
  
    audio.stop(audioChannel)
    audio.dispose( audioHandle )
    audio.stop(channel)
    transition.cancel()
    audio.dispose( channel )
    os.remove( system.pathForFile( "ian.wav", system.DocumentsDirectory ) )
   	physics.removeBody( animal3 )
   	physics.removeBody( tran1 )
    storyboard.removeScene("sabanaCuento1Pictograma")


end

function scene:destroyScene( event )
	    

end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene