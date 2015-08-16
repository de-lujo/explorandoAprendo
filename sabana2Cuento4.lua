local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local fondo, boton, icono, explorador, planeta, titulo, screenGroup, sonido
local time={}
--audio.reserveChannels(4)
local channel=audio.findFreeChannel()


function scene:createScene( event )

	screenGroup= self.view

	fondo=display.newImage("img/cu204.png",1024,600)
	fondo.x=display.contentWidth/2
	fondo.y=display.contentHeight/2
	--fondo:scale( 0.70, 0.70 )

	nube=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 500, 150, 12 )
	nube.x=display.contentCenterX -250
	nube.y=display.contentCenterY-200
	nube.strokeWidth = 6
	nube:setStrokeColor( 0, 0, 0 )
	nube.alpha=0


	barra=display.newImage( "img/banner2.png")
	barra:scale( 0.24, 0.26)
	barra.x=display.contentCenterX + 380
	barra.y=display.contentCenterY - 220


	corchea= display.newImage( "img/corchea.png")
	corchea.x= display.contentCenterX + 380
	corchea.y= display.contentCenterY - 260
	corchea.isVisible=true
	corchea:scale( 0.13, 0.13 )

	corchea2= display.newImage( "img/corchea2.png")
	corchea2.x= display.contentCenterX + 380
	corchea2.y= display.contentCenterY - 260
	corchea2.isVisible=false
	corchea2:scale( 0.13, 0.13 )

	mundo= display.newImage( "img/planeta1.png")
	mundo.x= display.contentCenterX + 460
	mundo.y= display.contentCenterY - 260
	mundo:scale( 0.13, 0.13 )

	dicci= display.newImage( "img/diccionario.png")
	dicci.x= display.contentCenterX + 300
	dicci.y= display.contentCenterY - 260
	dicci:scale( 0.13, 0.13)

	icono=display.newImage("img/flecha01.png")
	icono.x=display.contentCenterX + 430
	icono.y=display.contentCenterY + 200
	icono:scale( 0.30, 0.30 )
	icono.alpha=0
	icono.isVisible=false
	
	boton=display.newImage("img/Flecha02.png")
	boton.x=display.contentCenterX - 480
	boton.y=display.contentCenterY + 200
	boton.alpha=1 
	boton:scale( 0.30, 0.30 )

	text1 = display.newText("Al día siguiente, fue el turno del grandísimo Rinoceronte:".. "\n\nEn la mañana despertó con su cuerno pintado".." \ny lleno de flores", 0, 0, native.systemFont, 18 )
	text1:setFillColor( 0, 0, 0)
	text1.x= display.contentCenterX-245
	text1.y= display.contentCenterY-200
	text1.alpha=0

	nota=display.newImage( "img/book1.png")
	nota.x=display.contentCenterX
	nota.y=display.contentCenterY
	nota.isVisible=true
	nota.alpha=0
	nota:scale( 0.88, 0.70 )

	arrow= display.newImage( "img/286.png")
	arrow.x=display.contentCenterX +390
	arrow.y=display.contentCenterY +210
	arrow.isVisible=true
	arrow.alpha=0
	arrow:scale( 0.09, 0.09 )

	arrow2 = display.newImage( "img/287.png")
	arrow2.x=display.contentCenterX -390
	arrow2.y=display.contentCenterY +210
	arrow2.isVisible=true
	arrow2.alpha=0
	arrow2:scale( 0.09, 0.09 )

	equis = display.newImage( "img/X.png")
	equis.x= display.contentCenterX +390
	equis.y= display.contentCenterY -200
	equis.isVisible=true
	equis.alpha=0
	equis:scale( 0.09, 0.09 )

	te1= display.newText("LA SABANA: Es un lugar que se caracteriza \npor su poca vegetación, su suelo es seco y\npresenta poca cantidad de hierba y arbustos.",0,0, native.systemFont, 18)
	te1.isVisible=true
	te1.x=display.contentCenterX -220
	te1.y=display.contentCenterY -180
	te1:setFillColor( 0, 0, 0)
	te1.alpha=0

	te2= display.newText("JIRAFA: Es el mamífero más alto, se caracteriza\npor tener un largo cuello y manchas en la pelaje.\nSe alimenta de hojas, ramas de árboles y frutos.", 0, 0, native.systemFont, 18)
	te2.isVisible= true
	te2:setFillColor( 0, 0, 0)
	te2.x=display.contentCenterX -205
	te2.y=display.contentCenterY -80
	te2.alpha=0

	te3= display.newText("COCODRILO: Gran reptil carnívoro que vive en\nlugares de agua dulce como ríos y lagos.\nSu mayor característica, es su piel escamosa,\ndura y seca.", 0, 0, native.systemFont, 18)
	te3.isVisible= true
	te3:setFillColor( 0, 0, 0)
	te3.x=display.contentCenterX -205
	te3.y=display.contentCenterY +30
	te3.alpha=0

	te4= display.newText("SURICATA: Pequeño mamífero que vive en\ncuevas subterráneas. Se alimenta de insectos,\naunque a veces come huevos y vegetales.", 0, 0, native.systemFont, 18)
	te4.isVisible= true
	te4:setFillColor( 0, 0, 0)
	te4.x=display.contentCenterX -210
	te4.y=display.contentCenterY +130
	te4.alpha=0


	img1=display.newImage( "img/sabana.jpg")
	img1.x=display.contentCenterX +250
	img1.y=display.contentCenterY -180
	img1.isVisible=true
	img1.alpha=0
	img1:scale( 0.14, 0.14)
	img1:setStrokeColor( 0,0,0)
	img1.strokeWidth = 3
	img1.surfaceType= "sabana"



	img2=display.newImage( "img/jirafa.png")
	img2.x=display.contentCenterX + 90
	img2.y=display.contentCenterY -100
	img2.isVisible=true
	img2.alpha=0
	img2.surfaceType="jirafa"
	--img2:scale( 0.90, 0.90)

	img3=display.newImage( "img/Cocodrilo.png")
	img3.x=display.contentCenterX +230
	img3.y=display.contentCenterY 
	img3.isVisible=true
	img3.alpha=0
	img3.surfaceType="cocodrilo"
	--img3:scale( 0.14, 0.14)

	img4=display.newImage( "img/Suricata.png")
	img4.x=display.contentCenterX +100
	img4.y=display.contentCenterY +110
	img4.isVisible=true
	img4.alpha=0
	img4:scale( 0.90, 0.90)
	img4.surfaceType="suricata"


	img5=display.newImage( "img/nu.png")
	img5.x=display.contentCenterX +250
	img5.y=display.contentCenterY -180
	img5.isVisible=false
	img5.alpha=0
	img5.surfaceType="nu"
	--img5:scale( 0.14, 0.14)


	img6=display.newImage( "img/Leon.png")
	img6.x=display.contentCenterX + 100
	img6.y=display.contentCenterY -90
	img6.isVisible=false
	img6.alpha=0
	img6.surfaceType="leon"
	--img2:scale( 0.90, 0.90)

	img7=display.newImage( "img/Elefante.png")
	img7.x=display.contentCenterX +230
	img7.y=display.contentCenterY +20
	img7.isVisible=false
	img7.alpha=0
	img7.surfaceType="elefante"
	--img3:scale( 0.14, 0.14)

	img8=display.newImage( "img/Hienas.png")
	img8.x=display.contentCenterX +100
	img8.y=display.contentCenterY +120
	img8.isVisible=false
	img8.alpha=0
	img8.surfaceType="hienas"
	--img8:scale( 0.90, 0.90)

	img9=display.newImage( "img/Cebra.png")
	img9.x=display.contentCenterX +250
	img9.y=display.contentCenterY -180
	img9.isVisible=false
	img9.alpha=0
	img9.surfaceType="cebra"
	--img9:scale( 0.14, 0.14)


	img10=display.newImage( "img/Hipo.png")
	img10.x=display.contentCenterX + 100
	img10.y=display.contentCenterY -100
	img10.isVisible=false
	img10.alpha=0
	img10.surfaceType="hipopotamo"
	--img2:scale( 0.90, 0.90)

	img11=display.newImage( "img/avestruz.png")
	img11.x=display.contentCenterX +300
	img11.y=display.contentCenterY 
	img11.isVisible=false
	img11.alpha=0
	img11.surfaceType="avestruz"
	--img3:scale( 0.14, 0.14)

	img12=display.newImage( "img/Rinoceronte.png")
	img12.x=display.contentCenterX +100
	img12.y=display.contentCenterY +110
	img12.isVisible=false
	img12.alpha=0
	img12.surfaceType="rinoceronte"
	--img12:scale( 0.90, 0.90)


	screenGroup:insert(fondo)
	screenGroup:insert(nube)
	screenGroup:insert(text1)
	screenGroup:insert(boton)
	screenGroup:insert(icono)
	screenGroup:insert(barra)
	screenGroup:insert(corchea)
	screenGroup:insert(corchea2)
	screenGroup:insert(mundo)
	screenGroup:insert(dicci)
	screenGroup:insert(nota)
	screenGroup:insert(arrow)
	screenGroup:insert(arrow2)
	screenGroup:insert(equis)
	screenGroup:insert(te1)
	screenGroup:insert(te2)
	screenGroup:insert(te3)
	screenGroup:insert(te4)
	screenGroup:insert(img1)
	screenGroup:insert(img2)
	screenGroup:insert(img3)
	screenGroup:insert(img4)
	screenGroup:insert(img5)
	screenGroup:insert(img6)
	screenGroup:insert(img7)
	screenGroup:insert(img8)
	screenGroup:insert(img9)
	screenGroup:insert(img10)
	screenGroup:insert(img11)
	screenGroup:insert(img12)


end





function reHoja( event)


if event.phase == "began" then

		time[7]=timer.performWithDelay( 0, noText, 1)
		time[8]=timer.performWithDelay( 1000, devuelveHoja, 1)
		time[9]=timer.performWithDelay( 2000, onText, 1)

	end


	
end


function stopTime( event)

	timer.pause(time[0])
	timer.pause(time[1])
	--timer.pause(time[2])
	--timer.pause(time[3])

end


function goTime(event)

    timer.resume(time[0])
	timer.resume(time[1])
	--timer.resume(time[2])
	--timer.resume(time[3])
	--[[timer.resume(time[4])
	timer.resume(time[5])
	timer.resume(time[6])
	timer.resume(time[7])
	timer.resume(time[8])
	timer.resume(time[9])]]


end



function devuelveHoja( event )

if (_G.hoja == 3) then
  		
  	te1.text="ÑU: Mamífero que posee largas barbas que\ncuelgan de su cuello, además de una cola\nmuy parecida a la del caballo. Vive en\ngrupos y se alimenta de hierba fresca."
  	te1.x=display.contentCenterX - 230
  	te1.y=display.contentCenterY -170
  	te2.text="LEÓN: Es un mamífero que pertenece a la familia\nde los grandes felinos carnívoros, la mayor\ncaracterística de esta especie es la gran\nmelena que posee el macho."
  	te2.x=display.contentCenterX - 210
  	te2.y=display.contentCenterY -70
  	te3.text="ELEFANTE: Es el mamífero más grande que \nexiste, posee una larga trompa, enormes orejas\ny colmillos. Se alimenta principalmente de hierba,\ncorteza de árboles y arbustos."
  	te3.x=display.contentCenterX - 210
  	te4.text="HIENA: Es un mamífero carnívoro, que se\ncaracteriza principalmente por sus aullidos,\nlas cuales parecen fuertes carcajadas."
    te4.x=display.contentCenterX - 235


  	img5.isVisible=true
  	transition.fadeIn( img5, {time=1000} )
  	img6.isVisible=true
  	transition.fadeIn( img6, {time=1000} )
  	img7.isVisible=true
  	transition.fadeIn( img7, {time=1000} )
  	img8.isVisible=true
  	transition.fadeIn( img8, {time=1000} )
  	transition.fadeIn( arrow, {time=1000})

  	_G.hoja=2


  	elseif (_G.hoja == 2) then

  	te1.text= "LA SABANA: Es un lugar que se caracteriza \npor su poca vegetación, su suelo es seco y\npresenta poca cantidad de hierba y arbustos."
	te1.x=display.contentCenterX -220
	te1.y=display.contentCenterY -180

	te2.text= "JIRAFA: Es el mamífero más alto, se caracteriza\npor tener un largo cuello y manchas en la pelaje.\nSe alimenta de hojas, ramas de árboles y frutos."
	te2.x=display.contentCenterX -205
	te2.y=display.contentCenterY -80

	te3.text= "COCODRILO: Gran reptil carnívoro que vive en\nlugares de agua dulce como ríos y lagos.\nSu mayor característica, es su piel escamosa,\ndura y seca."
	te3.x=display.contentCenterX -205
	te3.y=display.contentCenterY +30

	te4.text= "SURICATA: Pequeño mamífero que vive en\ncuevas subterráneas. Se alimenta de insectos,\naunque a veces come huevos y vegetales."
	te4.x=display.contentCenterX -210
	te4.y=display.contentCenterY +130


  	img1.isVisible=true
  	transition.fadeIn( img1, {time=1000} )
  	img2.isVisible=true
  	transition.fadeIn( img2, {time=1000} )
  	img3.isVisible=true
  	transition.fadeIn( img3, {time=1000} )
  	img4.isVisible=true
  	transition.fadeIn( img4, {time=1000} )
  	transition.fadeOut( arrow2, {time=500})
  	_G.hoja=1

    end






end

function avHoja( event )
	

	if event.phase == "began" then

		time[4]=timer.performWithDelay( 0, noText, 1)
		time[5]=timer.performWithDelay( 1000, validaHoja, 1)
		time[6]=timer.performWithDelay( 2000, onText, 1)

	end



end

function validaHoja (event)

	if (_G.hoja == 1) then
  		
  	te1.text="ÑU: Mamífero que posee largas barbas que\ncuelgan de su cuello, además de una cola\nmuy parecida a la del caballo. Vive en\ngrupos y se alimenta de hierba fresca."
  	te1.x=display.contentCenterX - 230
  	te1.y=display.contentCenterY -170
  	te2.text="LEÓN: Es un mamífero que pertenece a la familia\nde los grandes felinos carnívoros, la mayor\ncaracterística de esta especie es la gran\nmelena que posee el macho."
  	te2.x=display.contentCenterX - 210
  	te2.y=display.contentCenterY -70
  	te3.text="ELEFANTE: Es el mamífero más grande que \nexiste, posee una larga trompa, enormes orejas\ny colmillos. Se alimenta principalmente de hierba,\ncorteza de árboles y arbustos."
  	te3.x=display.contentCenterX - 210
  	te4.text="HIENA: Es un mamífero carnívoro, que se\ncaracteriza principalmente por sus aullidos,\nlas cuales parecen fuertes carcajadas."
    te4.x=display.contentCenterX - 235


  	img5.isVisible=true
  	transition.fadeIn( img5, {time=1000} )
  	img6.isVisible=true
  	transition.fadeIn( img6, {time=1000} )
  	img7.isVisible=true
  	transition.fadeIn( img7, {time=1000} )
  	img8.isVisible=true
  	transition.fadeIn( img8, {time=1000} )
  	transition.fadeIn( arrow2, {time=1000} )
  	_G.hoja=2


  	elseif (_G.hoja == 2) then

  	te1.text="CEBRA: Mamífero que se caracteriza por su \npelaje negro con rayas blancas. Es un animal\nherbívoro, por lo que se alimenta de hierbas. "
  	te1.x=display.contentCenterX - 230
  	te1.y=display.contentCenterY -190
  	te2.text="HIPOPÓTAMO: Mamífero que se caracteriza por\nsu gran boca y fuerte mandíbula. Vive en ríos\ny lagos, pero en las noches sale del agua\npara alimentarse de hierbas."
  	te2.x=display.contentCenterX - 215
  	te2.y=display.contentCenterY -90
  	te3.text="AVESTRUZ: Ave que se destaca por sus largas\npatas, permitiendo correr a gran velocidad,\nademás tiene un largo cuello que no posee\nplumas. Se alimenta de frutos, vegetales\ne insectos."
  	te3.x=display.contentCenterX - 215
  	te3.y=display.contentCenterY +20
  	te4.text="RINOCERONTE: Mamífero que se\ncaracteriza por ser solitario y muy protector\nde su territorio. Es un animal herbívoro,\nque se alimenta de hierbas."
    te4.x=display.contentCenterX - 235
    te4.y=display.contentCenterY +130


  	img9.isVisible=true
  	transition.fadeIn( img9, {time=1000} )
  	img10.isVisible=true
  	transition.fadeIn( img10, {time=1000} )
  	img11.isVisible=true
  	transition.fadeIn( img11, {time=1000} )
  	img12.isVisible=true
  	transition.fadeIn( img12, {time=1000} )
  	transition.fadeOut( arrow, {time=500})
  	_G.hoja=3
  	


    end

end


function noText( event )
	
	transition.fadeOut( te1, {time=500} )
	transition.fadeOut( te2, {time=500} )
	transition.fadeOut( te3, {time=500} )
	transition.fadeOut( te4, {time=500} )
	transition.fadeOut( img1, {time=500})
	transition.fadeOut( img2, {time=500})
	transition.fadeOut( img3, {time=500})
	transition.fadeOut( img4, {time=500})
	transition.fadeOut( img5, {time=500})
	transition.fadeOut( img6, {time=500})
	transition.fadeOut( img7, {time=500})
	transition.fadeOut( img8, {time=500})
	transition.fadeOut( img9, {time=500})
	transition.fadeOut( img10, {time=500})
	transition.fadeOut( img11, {time=500})
	transition.fadeOut( img12, {time=500})

end

function onText( event )
	transition.fadeIn( te1, {time=1000} )
	transition.fadeIn( te2, {time=1000} )
	transition.fadeIn( te3, {time=1000} )
	transition.fadeIn( te4, {time=1000} )
end


function fade_out( event )
	
 if event.phase == "began" then


	stopTime(event)
	onText(event)
	_G.hoja=1
	transition.fadeIn( equis, {time=1000} )
	transition.fadeIn( nota, {time=1000} )
	transition.fadeIn( arrow, {time=1000} )
	transition.fadeIn( img1, {time=1000} )
	transition.fadeIn( img2, {time=1000} )
	transition.fadeIn( img3, {time=1000} )
	transition.fadeIn( img4, {time=1000} )
	transition.to( fondo, {time=1000, alpha=0.30} )
	transition.to( nube, {time=1000, alpha=0.30} )
	transition.to( text1, {time=1000, alpha=0.30} )
	transition.to( boton, {time=1000, alpha=0.30} )
	transition.to( icono, {time=1000, alpha=0.30} )
	transition.to( barra, {time=1000, alpha=0.30} )
	transition.to( corchea, {time=1000, alpha=0.30} )
	transition.to( corchea2, {time=1000, alpha=0.30} )
	transition.to( mundo, {time=1000, alpha=0.30} )
	transition.to( dicci, {time=1000, alpha=0.30} )

	palabra= audio.loadStream("music/diccionario/titulo.mp3", {channel = 2, loops = -1})
    audio.play(palabra)

    icono:removeEventListener( "touch", start)
	boton:removeEventListener("touch",back)
	mundo:removeEventListener( "touch", volver_ambiente)
	corchea:removeEventListener( "touch", sin_musica )

end

end


function fade_in( event )

 if event.phase == "began" then

    goTime(event)
	audio.fadeOut( sonido, {time=1000} )
    transition.fadeOut( equis, {time=1000} )
	transition.fadeOut( nota, {time=1000} )
	transition.fadeOut( arrow, {time=1000} )
	transition.fadeOut( arrow2, {time=1000} )
	noText(event)
	transition.fadeOut( img1, {time=1000} )
	transition.fadeOut( img2, {time=1000} )
	transition.fadeOut( img3, {time=1000} )
	transition.fadeOut( img4, {time=1000} )
	transition.fadeOut( img5, {time=1000} )
	transition.fadeOut( img6, {time=1000} )
	transition.fadeOut( img7, {time=1000} )
	transition.fadeOut( img8, {time=1000} )
	transition.fadeOut( img9, {time=1000} )
	transition.fadeOut( img10, {time=1000} )
	transition.fadeOut( img11, {time=1000} )
	transition.fadeOut( img12, {time=1000} )


	transition.to( fondo, {time=1000, alpha=1} )
	transition.to( nube, {time=1000, alpha=1} )
	transition.to( text1, {time=1000, alpha=1} )
	transition.to( boton, {time=1000, alpha=1} )
	transition.to( icono, {time=1000, alpha=1} )
	transition.to( barra, {time=1000, alpha=1} )
	transition.to( corchea, {time=1000, alpha=1} )
	transition.to( corchea2, {time=1000, alpha=1} )
	transition.to( mundo, {time=1000, alpha=1} )
	transition.to( dicci, {time=1000, alpha=1} )
	
	icono:addEventListener( "touch", start)
	boton:addEventListener("touch",back)
	mundo:addEventListener( "touch", volver_ambiente)
	corchea:addEventListener( "touch", sin_musica )

	audio.stop( channel)
	audio.dispose( channel )

 end
	
end


function musicDicci( event )

	local self= event.target


	if event.phase == "began" then

		audio.stop(channel)

		 if (self.surfaceType == "sabana") then

		 sonido=audio.loadSound("music/diccionario/La sabana.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)

		 elseif (self.surfaceType == "jirafa") then

		 sonido=audio.loadSound("music/diccionario/Jirafa.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)

		 elseif (self.surfaceType == "cocodrilo") then

		 sonido=audio.loadSound("music/diccionario/Cocodrilo.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)

		 elseif (self.surfaceType == "suricata") then

		 sonido=audio.loadSound("music/diccionario/Suricata.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)


		 elseif (self.surfaceType == "nu") then

		 sonido=audio.loadSound("music/diccionario/Nu.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)


		 elseif (self.surfaceType == "leon") then

		 sonido=audio.loadSound("music/diccionario/Leon.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)


		 elseif (self.surfaceType == "elefante") then

		 sonido=audio.loadSound("music/diccionario/Elefante.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)


		 elseif (self.surfaceType == "hienas") then

		 sonido=audio.loadSound("music/diccionario/Hienas.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)


		 elseif (self.surfaceType == "cebra") then

		 sonido=audio.loadSound("music/diccionario/Cebra.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)


		 elseif (self.surfaceType == "avestruz") then

		 sonido=audio.loadSound("music/diccionario/Avestruz.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)


		 elseif (self.surfaceType == "hipopotamo") then

		 sonido=audio.loadSound("music/diccionario/Hipopotamo.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)


		 elseif (self.surfaceType == "rinoceronte") then

		 sonido=audio.loadSound("music/diccionario/Rinoceronte.mp3", {loops = 0, channel = channel})
		 audio.play(sonido)

		end

	end


end



function destexto( event )
	transition.fadeOut( text1, {time=500} )
end


function texto1( event )

	sonido=audio.loadStream("music/cuento2/Parrafo 9.mp3", {loops = -1, channel = channel})
	audio.play(sonido)

	text1.text= "lo que lo hizo gritar por montones: ¡WAAAAAAAAAAA!" .. "\n\n(Mientras tanto, las hienas se reían: ¡JIJIJI!)"
	transition.fadeIn( text1, {time=1000} )
	icono.isVisible=true
	transition.fadeIn( icono, {time=3000} )
end

function start( event )
	
	if event.phase == "began" then

	  storyboard.gotoScene("sabana2Cuento5","fade",400)
	end
end

function back( event )
	
	if event.phase == "began" then

	  storyboard.gotoScene("sabana2Cuento3","fade",400)
	end
end


function volver_ambiente( event )
	
	if event.phase == "began" then

	  storyboard.gotoScene("selectAmbiente","fade",400)
	end


end

function sin_musica ( event )

if event.phase == "began" then

	corchea.isVisible=false
	corchea2.isVisible=true
	audio.pause(_G.channel)
	corchea:removeEventListener( "touch", sin_musica)
	corchea2:addEventListener( "touch", con_musica )

	end


end

function con_musica ( event )

if event.phase == "began" then

	corchea.isVisible=true
	corchea2.isVisible=false
	audio.resume(_G.channel)
	corchea:addEventListener( "touch", sin_musica)
	corchea2:removeEventListener( "touch", con_musica )

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

	
    icono:addEventListener( "touch", start)
	boton:addEventListener("touch",back)
	mundo:addEventListener( "touch", volver_ambiente)
	corchea:addEventListener( "touch", sin_musica )
	dicci:addEventListener( "touch", fade_out)
	arrow:addEventListener( "touch", avHoja)
	arrow2:addEventListener( "touch", reHoja)
	equis:addEventListener( "touch", fade_in)
	transition.fadeIn( nube, {time=2000} )
	transition.fadeIn( text1, {time=2000} )


	sonido=audio.loadStream("music/cuento2/Parrafo 8.mp3", {loops = -1, channel = channel})
	audio.play(sonido)

	img1:addEventListener( "touch", musicDicci)
	img2:addEventListener( "touch", musicDicci)
	img3:addEventListener( "touch", musicDicci)
	img4:addEventListener( "touch", musicDicci)
	img5:addEventListener( "touch", musicDicci)
	img6:addEventListener( "touch", musicDicci)
	img7:addEventListener( "touch", musicDicci)
	img8:addEventListener( "touch", musicDicci)
	img9:addEventListener( "touch", musicDicci)
	img10:addEventListener( "touch", musicDicci)
	img11:addEventListener( "touch", musicDicci)
	img12:addEventListener( "touch", musicDicci)

	if (_G.sinMusica == true ) then

			corchea.isVisible=false
			corchea2.isVisible=true
			audio.pause(_G.channel)
			corchea:removeEventListener( "touch", sin_musica)
			corchea2:addEventListener( "touch", con_musica )

		end

	time[0]=timer.performWithDelay(9000, destexto, 1)
	time[1]=timer.performWithDelay(10000, texto1, 1)


end



function scene:exitScene( event )

   icono:removeEventListener("touch",start)
   mundo:removeEventListener( "touch", volver_ambiente)
   corchea:removeEventListener( "touch", sin_musica )
   dicci:removeEventListener( "touch", fade_out)
   storyboard.removeScene("sabana2Cuento4")


end

function scene:destroyScene( event )
	-- body
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene