local storyboard = require "storyboard"
local scene= storyboard.newScene()


local planeta, fondo, planeta, boton, titulo, screenGroup, dialog, text1, newFont
local sonido= audio.loadStream(_G.rutaM1, {loops = -1, channel = _G.channel})
audio.setVolume( 0.30, { channel=_G.channel })
audio.setMaxVolume( 0.40, { channel=_G.channel })
local time={}


local sonido2, otherChannel

local sheetOptions=
{
	width=685,
	height=600,
	numFrames=10,
	sheetContentWidth = 2744,  
    sheetContentHeight = 1802 

}

local sequences_Planeta = {
    {
        name = "planetaRun",
        start = 1,
        count = 10,
        time = 3000,
        loopCount = 0,
        loopDirection = "bounce"
    }
}


function scene:createScene( event )

	screenGroup= self.view

	fondo=display.newImage("img/mapa.png",1024,600)
	fondo.x=display.contentCenterX
	fondo.y=display.contentCenterY
	fondo.alpha=0.70

	boton=display.newImage("img/comenzar.png")
	boton.x=display.contentWidth-100
	boton.y=display.contentHeight-100 
	boton.alpha=0
	boton.isVisible=false
	boton:scale( 0.25, 0.25 )

	explorador4=display.newImage("img/explorador4.png")
	explorador4.x=display.contentCenterX -350
	explorador4.y=display.contentCenterY +150
	explorador4.alpha=0
	explorador4:scale( 0.40, 0.40 )


	explorador3=display.newImage("img/explorador3.png")
	explorador3.x=display.contentCenterX -350
	explorador3.y=display.contentCenterY +150
	explorador3.alpha=0
	explorador3:scale( 0.40, 0.40 )

	explorador=display.newImage("img/explorador.png")
	explorador.x=display.contentCenterX -350
	explorador.y=display.contentCenterY +150
	explorador.alpha=0
	explorador:scale( 0.40, 0.40 )

    newFont= native.newFont( "fonts/5.otf", 14)


	dialog= display.newImage("img/dialogo4.png")
	dialog.x=display.contentCenterX-150
	dialog.y=display.contentCenterY+140 
	dialog.alpha=0
	dialog.isVisible=false
	dialog:scale( 0.65, 0.65)

	text1= display.newText("¡Hola!!".."\nSoy Pablo el explorador".. "\nvengo de un país" .. "\nllamado Chile", display.contentCenterX-263, display.contentCenterY-130, newFont, 18 )
	text1.x=display.contentCenterX-100
	text1.y=display.contentCenterY +140
	text1:setFillColor( 0, 0, 0)
	text1.alpha=0

	--[[titulo = display.newText("ExploraAprendo", display.contentCenterX, display.contentCenterY, "nas", 48 )
	titulo:setFillColor( 1, 1, 1)
	titulo.alpha=0]]

	titulo=display.newImage("img/logo.png")
	titulo.x=display.contentCenterX 
	titulo.y=display.contentCenterY
	titulo.alpha=0
	titulo:scale( 0.70, 0.70)

	sheet_planeta=graphics.newImageSheet("img/planetas.png", sheetOptions)
	runningPlaneta= display.newSprite( sheet_planeta, sequences_Planeta )

	runningPlaneta.x=display.contentCenterX +50
	runningPlaneta.y=display.contentCenterY-100
	runningPlaneta.alpha=0
	runningPlaneta.isVisible=false
	runningPlaneta:scale( 0.60, 0.60 )
	runningPlaneta:play()

	
	screenGroup:insert(fondo)
	screenGroup:insert(boton)
	screenGroup:insert(runningPlaneta)
	screenGroup:insert(explorador4)
	screenGroup:insert(explorador3)
	screenGroup:insert(explorador)
	screenGroup:insert(titulo)
	screenGroup:insert(dialog)
	screenGroup:insert(text1)

end

function start( event )
	
	if event.phase == "began" then
	   storyboard.gotoScene("personaje","fade",400)
	end
end

function animaTitulo (event)

	transition.to(titulo, {time=1000, alpha=0})

end

function desaTitulo(event)
	
	transition.to(titulo, {time=1000, alpha=1})

end

function image (event)
	
	transition.to( runningPlaneta,{time=3000, alpha=1} )
	runningPlaneta.isVisible=true

end

function button_in( event )
	
	boton:addEventListener("touch",start)
	transition.to( boton, {time=1500, alpha=1} )
	boton.isVisible=true
	--transition.blink( boton, {time=5000} )


end

function explora_in( event )
	
	transition.to( explorador4, {time=1500, alpha=1} )


end

function letra (event)

transition.to( dialog, {time=1500, alpha=1} )
dialog.isVisible=true

end


function destexto( event )
	
	transition.to( text1, {time=1000, alpha=0} )
end


function texto( event ) --10500

	transition.to( text1, {time=1000, alpha=1} ) --11500

	otherChannel= audio.findFreeChannel()
	sonido2= audio.loadStream("music/explorador/Frase 1.mp3", {loops = -1, channel = otherChannel})
	audio.play(sonido2)


end


function texto2( event ) --16000

	text1.text="pero me encanta conocer ".."\ndistintos lugares del mundo ".. "\n¡Acompáñame!"
	transition.to(text1, {time=1000, alpha=1} ) --17000
	explorador4.alpha=0
	explorador3.alpha=1
	
end


function texto3( event) -- 21500
	text1.text= "¡Comencemos la aventura!."
	transition.to( text1, {time=1000, alpha=1} )
	explorador3.alpha=0
	explorador.alpha=1

end

function cancelAll()

	 for i=0,10 do
	 timer.cancel(time[i])
	 end

	 transition.cancel()
	 audio.stop(otherChannel)

end



function scene:enterScene(event)

	audio.play(sonido)
	time[0]=timer.performWithDelay( 0, desaTitulo, 1)
	timer.performWithDelay( 0, button_in, 1)

	time[1]=timer.performWithDelay( 5000, animaTitulo, 1)
	time[2]=timer.performWithDelay( 6200, image, 1)
	time[3]=timer.performWithDelay( 6200, explora_in, 1)
	time[4]=timer.performWithDelay( 9300, letra, 1)
	time[5]=timer.performWithDelay( 10500, texto, 1 )
	time[6]=timer.performWithDelay( 16000, destexto, 1)
	time[7]=timer.performWithDelay( 17000, texto2, 1 )
	time[8]=timer.performWithDelay( 22000, destexto, 1) 
	time[9]=timer.performWithDelay( 23000, texto3, 1 )
	time[10]=timer.performWithDelay( 24500, button_in, 1)


end

function scene:exitScene( event )

	boton:removeEventListener("touch",start)
	cancelAll(event)
	storyboard.removeScene("introduction")

end

function scene:destroyScene( event )
	-- body
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene