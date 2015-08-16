local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local fondo, boton, icono, ambiente1, ambiente2, planeta,sonido

local channel=audio.findFreeChannel()


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
	explorador.x=display.contentCenterX -150
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
	dialog.x=display.contentCenterX +60
	dialog.y=display.contentCenterY +190
	dialog.alpha=0
	dialog:scale( 0.60, 0.60)

	text1= display.newText( _G.name .. "\nSelecciona un juego", display.contentCenterX, display.contentCenterY, native.systemFont, 18 )
	text1.x=display.contentCenterX +80
	text1.y=display.contentCenterY +190
	text1:setFillColor( 0, 0, 0)
	text1.alpha=0




	screenGroup:insert(fondo)
	screenGroup:insert(ambiente1)
	screenGroup:insert(ambiente2)
	screenGroup:insert(icono)
	screenGroup:insert(explorador)
	screenGroup:insert(boton)
	screenGroup:insert(dialog)
	screenGroup:insert(text1)


end


function move_explorador( event )
	
	transition.fadeIn( explorador, {time=2000})
	transition.fadeIn( dialog, {time=2000} )
	transition.fadeIn( text1, {time=2000} )
	sonido=audio.loadStream("music/explorador/Frase 15.mp3", {loops = -1, channel = channel})
	audio.play(sonido)

end



function redirCuento1( event )

if event.phase == "began" then

	  storyboard.gotoScene("sabanaCuento1Adivinanza","fade",400)
	end

end


function redirCuento2( event)

if event.phase == "began" then

	  storyboard.gotoScene("sabanaCuento1Pictograma","fade",400)
	end

end

function start( event)
	
	if event.phase == "began" then

	  --audio.fadeOut({channel=1, time =2000} )
	  _G.cuento1=true
	  storyboard.gotoScene("elegirCuento","fade",400)
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
	
	fondo.enterFrame=validar_Musica
	Runtime:addEventListener("enterFrame", fondo)

	ambiente1:addEventListener( "touch", redirCuento1)
	ambiente2:addEventListener( "touch", redirCuento2)
	boton:addEventListener( "touch", start )

	if (_G.okAdivinanza == true) then

	ambiente1:removeEventListener( "touch", redirCuento1)
	
	end


	if (_G.okPictograma == true) then

	ambiente2:removeEventListener( "touch", redirCuento2)

	end

	if (_G.okAdivinanza == true and _G.okPictograma == true) then

	text1.text="Muy Bien, continuemos..." .. "\nPresiona la flecha derecha"
    boton:removeEventListener( "touch", start )
    icono.isVisible=true
    transition.fadeIn( icono, {time=1000})
    icono:addEventListener( "touch", start )

    end
	
	move_explorador(event)

end



function scene:exitScene( event )
	
   ambiente1:removeEventListener( "touch", redirCuento1)
   ambiente2:removeEventListener( "touch", redirCuento2)
   storyboard.removeScene("selectJuegos")


end

function scene:destroyScene( event )
	


end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene