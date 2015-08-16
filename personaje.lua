local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local screenGroup, fondo, texto, nina, nino, boton, titulo, flag, text1, alert1, text2, sonido

local otherChannel
local time={}


function scene:createScene( event )

	screenGroup= self.view

	fondo=display.newImage("img/mapa.png",1024,600)
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

	bueno=display.newImage("img/bueno.png")
	bueno.x=display.contentCenterX -20
	bueno.y=display.contentCenterY +30
	bueno:scale( 0.15, 0.15 )
	bueno.alpha=0


	nube=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 350, 120, 12 )
	nube.x=display.contentCenterX-270
	nube.y=display.contentCenterY-220
	nube.strokeWidth = 6
	nube:setStrokeColor( 0, 0, 0 )
	nube.alpha=0


	text1= display.newText("Ahora elige a tu personaje" .. "\npara comenzar esta aventura", display.contentCenterX-263, display.contentCenterY-220, "fonts/3.otf", 18 )
	text1:setFillColor( 0, 0, 0)
	text1.alpha=0

	alert1=display.newImage("img/cuadro3.png")
	alert1.x=display.contentCenterX
	alert1.y=display.contentCenterY
	alert1:scale( 0.24, 0.24 )
	alert1.alpha=0

	text2=display.newText("", display.contentCenterX, display.contentCenterY -50, native.systemFont, 18)
	text2:setFillColor( 0, 0, 0)
	text2.alpha=0

	
	screenGroup:insert(fondo)
	screenGroup:insert(nina)
	screenGroup:insert(nino)
	screenGroup:insert(boton)
	screenGroup:insert(nube)
	screenGroup:insert(text1)
	screenGroup:insert(alert1)
	screenGroup:insert(text2)
	screenGroup:insert(bueno)





end

function start( event )
	
	if event.phase == "began" then

	 	  if (flag == true ) then

	 		 --_G.name=texto.text
	 		 storyboard.gotoScene("personaje2","fade",400)
	  	  
	  	  else

	  	  	 validarIn("Espera!! debes elegir un personaje !!!")

	  	  end

	end
end


function validarIn( name )

	bueno:addEventListener( "touch", validarNombreOut)
	text2.text=name

	transition.fadeIn( alert1, { time= 1000} )
	transition.fadeIn( text2, { time= 1000} )
	transition.fadeIn( bueno, { time= 1000} )
	transition.to(fondo, { time= 1000, alpha=0.30} )
	transition.to(nina, { time= 1000, alpha=0.30} )
	transition.to(nino, { time= 1000, alpha=0.30} )
	transition.to(boton, { time= 1000, alpha=0.30} )
	transition.to(nube, { time= 1000, alpha=0.30} )
	transition.to(text1, { time= 1000, alpha=0.30} )

end

function validarNombreOut( name )


	bueno:removeEventListener( "touch", validarNombreOut)
	transition.fadeOut( alert1, {time=1000} )
	transition.fadeOut( text2, {time=1000})
	transition.fadeOut( bueno, {time=1000} )
	transition.to(fondo, { time= 1000, alpha=0.75} )
	transition.to(nina, { time= 1000, alpha=1} )
	transition.to(nino, { time= 1000, alpha=1} )
	transition.to(boton, { time= 1000, alpha=1} )
	transition.to(nube, { time= 1000, alpha=1} )
	transition.to(text1, { time= 1000, alpha=1} )

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
	--texto.alpha=1

end

function destexto( event )
	transition.fadeOut( text1, {time=500} )
end

function texto1( event )

	transition.fadeIn( text1, {time=1000} )
	otherChannel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 2.mp3", {loops = -1, channel = otherChannel})
	audio.play(sonido)

end

function texto2( event )

	text1.text= "Te invito a escribir tu nombre" .. "\nen el espacio en blanco y a elegir" .. "\nel personaje que te representará"
	transition.fadeIn( text1, {time=1000} )
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

	 for i=0,3 do
	 timer.cancel(time[i])
	 end

	 transition.cancel()
	 audio.stop(otherChannel)

end




function scene:enterScene( event)
	
	flag=false

	boton:addEventListener( "touch", start)
	nino:addEventListener( "touch", elegirNino)
	nina:addEventListener( "touch", elegirNina)
	time[0]=timer.performWithDelay( 0, startNube, 1)
	time[1]=timer.performWithDelay( 1500, texto1, 1)
	time[2]=timer.performWithDelay( 13500, destexto,1)
	time[3]=timer.performWithDelay( 14000, texto3, 1)

	fondo.enterFrame=validar_Musica
	Runtime:addEventListener("enterFrame", fondo)
	

end


function scene:exitScene( event )

   boton:removeEventListener("touch", start)
   nino:removeEventListener( "touch", elegirNino)
   nina:removeEventListener( "touch", elegirNina)
   cancelAll(event)
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





