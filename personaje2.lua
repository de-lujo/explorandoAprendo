local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local screenGroup, fondo, texto, nina, nino, boton, titulo, flag, text1, alert1,text2, personaje, sonido

local otherChannel
local time={}


function scene:createScene( event )

	screenGroup= self.view

	fondo=display.newImage("img/mapa.png",1024,600)
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

	titulo = display.newText("Ingresa tu nombre", display.contentCenterX, display.contentCenterY , native.systemFont, 18 )
	titulo:setFillColor( 0, 0, 0)
	titulo.alpha=0

	texto= native.newTextField( 200, 150, 220, 45 )
	texto.x= display.contentCenterX 
	texto.y= display.contentCenterY + 80
	texto.alpha=0


	nube=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 350, 120, 12 )
	nube.x=display.contentCenterX-270
	nube.y=display.contentCenterY-220
	nube.strokeWidth = 6
	nube:setStrokeColor( 0, 0, 0 )
	--nube:setFillColor( .827, .902, .898)
	nube.alpha=0


	text1= display.newText("Antes de comenzar..." .. "\nme gustaría saber tu nombre...", display.contentCenterX-263, display.contentCenterY-220, "fonts/3.otf", 18 )
	text1:setFillColor( 0, 0, 0)
	text1.alpha=0

	alert1=display.newImage("img/cuadro3.png")
	alert1.x=display.contentCenterX
	alert1.y=display.contentCenterY
	alert1:scale( 0.24, 0.24)
	alert1.alpha=0

	text2=display.newText("", display.contentCenterX, display.contentCenterY - 50, native.systemFont, 18)
	text2:setFillColor( 0, 0, 0)
	text2.alpha=0

	recta = display.newRoundedRect( display.contentCenterX, display.contentCenterY, 180, 80, 12 )
	recta.strokeWidth = 3
	recta:setStrokeColor( 0, 0, 0 )
	--recta:setFillColor( .827, .902, .898)
	recta.alpha=0
	recta.isVisible=true

	personaje=display.newImage("img/".._G.personaje..".png",300,400)
	personaje.x=display.contentCenterX -220
	personaje.y=display.contentCenterY +100
	personaje:scale( 0.40, 0.40 )
	personaje.alpha=0
	
    bueno=display.newImage("img/bueno.png")
	bueno.x=display.contentCenterX -20
	bueno.y=display.contentCenterY +30
	bueno:scale( 0.15, 0.15 )
	bueno.alpha=0


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
	screenGroup:insert(bueno)







end

function start( event )
	
	if event.phase == "began" then

       if (texto.text ~= "") then

	 		 _G.name=texto.text
	 		 storyboard.gotoScene("selectAmbiente","fade",400)

	   else

	   	validarIn("Espera, debes ingresar el nombre.")

	   end

	end
end


function back( event )
	
	if event.phase == "began" then

	 		 storyboard.gotoScene("personaje","fade",400)

	end

end


function validarIn( name )

	alert1:addEventListener( "touch", validarNombreOut)
	text2.text=name

	transition.fadeIn( alert1, { time= 1000} )
	transition.fadeIn( text2, { time= 1000} )
	transition.fadeIn( bueno, { time= 1000} )
	transition.to(fondo, { time= 1000, alpha=0.30} )
	transition.to(nina, { time= 1000, alpha=0.30} )
	transition.to(nino, { time= 1000, alpha=0.30} )
	transition.to(boton, { time= 1000, alpha=0.30} )
	transition.to(boton1, { time= 1000, alpha=0.30} )
	transition.to(recta, { time= 1000, alpha=0.30} )
	transition.to(titulo, { time= 1000, alpha=0.30} )
	transition.to(nube, { time= 1000, alpha=0.30} )
	transition.to(texto, { time= 1000, alpha=0.30} )
	transition.to(text1, { time= 1000, alpha=0.30} )

end

function validarNombreOut( name )


	alert1:removeEventListener( "touch", validarNombreOut)
	transition.fadeOut( alert1, {time=1000} )
	transition.fadeOut( text2, {time=1000})
	transition.fadeOut( bueno, {time=1000} )

	transition.to(fondo, { time= 1000, alpha=0.75} )
	transition.to(boton, { time= 1000, alpha=1} )
	transition.to(boton1, { time= 1000, alpha=1} )
	transition.to(titulo, { time= 1000, alpha=1} )
	transition.to(nube, { time= 1000, alpha=1} )
	transition.to(text1, { time= 1000, alpha=1} )
	transition.to(texto, { time= 1000, alpha=1} )
	transition.to(recta, { time= 1000, alpha=1} )



end





function elegirNino( event )

nina.strokeWidth = 0
nino:setStrokeColor( 1, 1, 1 )
nino.strokeWidth = 10
_G.personaje="niño"
flag=true

end


function elegirNina( event )
	
nino.strokeWidth = 0
nina:setStrokeColor (1, 1, 1)
nina.strokeWidth = 10	
_G.personaje="niña"
flag=true

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
end

function texto2( event )

	text1.text= "¿Cómo te llamas?" .. "\nescribe tu nombre"
	transition.fadeIn( text1, {time=1000} )
	otherChannel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 2.mp3", {loops = -1, channel = otherChannel})
	audio.play(sonido)
end

function texto3( event )
	
	text1.text= "Para continuar, presiona la flecha"
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

	 for i=0,5 do
	 timer.cancel(time[i])
	 end

	 transition.cancel()
	 audio.stop(otherChannel)

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
	time[1]=timer.performWithDelay( 1500, texto1, 1)
	time[2]=timer.performWithDelay( 5500, destexto,1)
	time[3]=timer.performWithDelay( 6500, texto2, 1)
	time[4]=timer.performWithDelay( 13500, destexto,1)
	time[5]=timer.performWithDelay( 14000, texto3, 1)

	

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





