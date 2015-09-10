local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local sonido, nombre
local fondo, boton, icono, explorador, planeta, titulo, icono2, equis, text1, text2, text3, personaje, screenGroup
_G.rutaM2="music/fondo/juego2.mp3"

local time={}
local channel
local newFont=_G.font


function scene:createScene( event )

	screenGroup= self.view

	fondo=display.newImage("img/sabana.jpg")
	fondo.x=display.contentCenterX
	fondo.y=display.contentCenterY


	explorador=display.newImage("img/explorador4.png",300,400)
	explorador.x=display.contentCenterX -300
	explorador.y=display.contentCenterY +190
	explorador:scale( 0.40, 0.40 )
	explorador.alpha=0


	personaje=display.newImage(_G.rutaNombre,300,400)
	personaje.x=display.contentCenterX -170
	personaje.y=display.contentCenterY +200
	personaje:scale( 0.30, 0.30 )
	personaje.alpha=0

	barra=display.newImage( "img/banner2.png")
	barra:scale( 1, 0.95)
	barra.x=display.contentCenterX + 375
	barra.y=display.contentCenterY - 260


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
	boton.alpha=0  
	boton:scale( 0.30, 0.30 )

	text3= display.newText( _G.name .. "\nHaz llegado a La Sabana,\nun lugar donde encontrarás\nmuchos animales salvajes\ny poca vegetación.", 0, 0, newFont, _G.tamano )
	text3.x=display.contentCenterX-100
	text3.y=display.contentCenterY +20
	text3:setFillColor( 0, 0, 0)
	text3.alpha=0

	dialog= display.newImage("img/globo1.png")
	dialog.x=display.contentCenterX-120
	dialog.y=display.contentCenterY +30
	dialog.alpha=0
	dialog:scale( 0.80, 0.60)

	flecha1= display.newImage( "img/flecha1.png")
	flecha1.x=display.contentCenterX + 300
	flecha1.y=display.contentCenterY - 180
	flecha1.alpha=0
	flecha1:scale(0.04, 0.035)

	flecha2= display.newImage( "img/flecha1.png")
	flecha2.x=display.contentCenterX + 380
	flecha2.y=display.contentCenterY - 180
	flecha2.alpha=0
	flecha2:scale(0.04, 0.035)

	flecha3= display.newImage( "img/flecha1.png")
	flecha3.x=display.contentCenterX + 460
	flecha3.y=display.contentCenterY - 180
	flecha3.alpha=0
	flecha3:scale(0.04, 0.035)

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
	equis:scale( 0.50, 0.50 )


	te1= display.newText("LA SABANA: Es un lugar que se caracteriza \npor su poca vegetación, su suelo es seco y\npresenta poca cantidad de hierba y arbustos.",0,0, newFont, 16)
	te1.isVisible=true
	te1.x=display.contentCenterX -220
	te1.y=display.contentCenterY -180
	te1:setFillColor( 0, 0, 0)
	te1.alpha=0

	te2= display.newText("JIRAFA: Es el mamífero más alto, se caracteriza\npor tener un largo cuello y manchas en la pelaje.\nSe alimenta de hojas, ramas de árboles y frutos.", 0, 0, newFont, 16)
	te2.isVisible= true
	te2:setFillColor( 0, 0, 0)
	te2.x=display.contentCenterX -205
	te2.y=display.contentCenterY -80
	te2.alpha=0

	te3= display.newText("COCODRILO: Gran reptil carnívoro que vive en\nlugares de agua dulce como ríos y lagos.\nSu mayor característica, es su piel escamosa,\ndura y seca.", 0, 0, newFont, 16)
	te3.isVisible= true
	te3:setFillColor( 0, 0, 0)
	te3.x=display.contentCenterX -205
	te3.y=display.contentCenterY +30
	te3.alpha=0

	te4= display.newText("SURICATA: Pequeño mamífero que vive en\ncuevas subterráneas. Se alimenta de insectos,\naunque a veces come huevos y vegetales.", 0, 0, newFont, 16)
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

	alert1=display.newImage("img/cuadro3.png")
	alert1.x=display.contentCenterX
	alert1.y=display.contentCenterY -30
	alert1:scale( 0.60, 0.60 )
	alert1.alpha=0

	botonAceptar=display.newImage("img/aceptar.png")
	botonAceptar.x=display.contentCenterX +100
	botonAceptar.y=display.contentCenterY +40  
	botonAceptar.alpha=0
	botonAceptar:scale( 0.50, 0.50 )

	botonCancelar=display.newImage("img/cancelar.png")
	botonCancelar.x=display.contentCenterX -100
	botonCancelar.y=display.contentCenterY +43 
	botonCancelar.alpha=0
	botonCancelar:scale( 0.50, 0.50 )

	texto21=display.newText("¿ Quieres salir ?", 0 , 0, newFont, 18)
	texto21.x= display.contentCenterX 
	texto21.y= display.contentCenterY - 50
	texto21:setFillColor( 0,0,0 )
	texto21.alpha=0



	screenGroup:insert(fondo)
	screenGroup:insert(boton)
	screenGroup:insert(explorador)
	screenGroup:insert(personaje)
	screenGroup:insert(icono)
	screenGroup:insert(dialog)
	screenGroup:insert(text3)
	screenGroup:insert(barra)
	screenGroup:insert(corchea)
	screenGroup:insert(corchea2)
	screenGroup:insert(mundo)
	screenGroup:insert(dicci)
	screenGroup:insert(flecha1)
	screenGroup:insert(flecha2)
	screenGroup:insert(flecha3)
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
	screenGroup:insert(alert1)
	screenGroup:insert(botonAceptar)
	screenGroup:insert(botonCancelar)
	screenGroup:insert(texto21)




end

function reHoja( event)


if event.phase == "began" then

		--time[16]=timer.performWithDelay( 0, noText, 1)
		time[17]=timer.performWithDelay( 1000, devuelveHoja, 1)
		--time[18]=timer.performWithDelay( 2000, onText, 1)

	end


	
end


function stopTime( event)

	timer.pause(time[0])
	timer.pause(time[1])
	timer.pause(time[2])
	timer.pause(time[3])
	timer.pause(time[4])
	timer.pause(time[5])
	timer.pause(time[6])
	timer.pause(time[7])
	timer.pause(time[8])
	timer.pause(time[9])
	timer.pause(time[10])
	timer.pause(time[11])
	timer.pause(time[12])

end


function goTime(event)

    timer.resume(time[0])
	timer.resume(time[1])
	timer.resume(time[2])
	timer.resume(time[3])
	timer.resume(time[4])
	timer.resume(time[5])
	timer.resume(time[6])
	timer.resume(time[7])
	timer.resume(time[8])
	timer.resume(time[9])
	timer.resume(time[10])
	timer.resume(time[11])
	timer.resume(time[12])
	
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
  	img12.isVisible=false
  	--transition.fadeIn( img5, {time=1000} )
  	img6.isVisible=true
  	img11.isVisible=false
  	--transition.fadeIn( img6, {time=1000} )
  	img7.isVisible=true
  	img10.isVisible=false
  	--transition.fadeIn( img7, {time=1000} )
  	img8.isVisible=true
  	img9.isVisible=false
  	--transition.fadeIn( img8, {time=1000} )
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
  	img5.isVisible=false

  	--transition.fadeIn( img1, {time=1000} )
  	img2.isVisible=true
  	img6.isVisible=false

  	--transition.fadeIn( img2, {time=1000} )
  	img3.isVisible=true
  	img7.isVisible=false

  	--transition.fadeIn( img3, {time=1000} )
  	img4.isVisible=true
  	img8.isVisible=false

  	--transition.fadeIn( img4, {time=1000} )
  	transition.fadeOut( arrow2, {time=500})
  	
  	_G.hoja=1

    end



end

function avHoja( event )
	

	if event.phase == "began" then

		--time[5]=timer.performWithDelay( 0, noText, 1)
		time[6]=timer.performWithDelay( 0, validaHoja, 1)
		--time[7]=timer.performWithDelay( 2000, onText, 1)

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
  	img5.alpha=1
  	img1.isVisible=false
  	--transition.fadeIn( img5, {time=1000} )
  	img6.isVisible=true
  	img6.alpha=1
  	img2.isVisible=false

  	--transition.fadeIn( img6, {time=1000} )
  	img7.isVisible=true
  	img7.alpha=1
  	img3.isVisible=false

  	--transition.fadeIn( img7, {time=1000} )
  	img8.isVisible=true
  	img8.alpha=1
  	img4.isVisible=false

  	--transition.fadeIn( img8, {time=1000} )
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
  	img9.alpha=1
  	img5.isVisible=false

  	--transition.fadeIn( img9, {time=1000} )
  	img10.isVisible=true
  	img10.alpha=1
  	img6.isVisible=false

  	--transition.fadeIn( img10, {time=1000} )
  	img11.isVisible=true
  	img11.alpha=1
  	img7.isVisible=false

  	--transition.fadeIn( img11, {time=1000} )
  	img12.isVisible=true
  	img12.alpha=1
  	img8.isVisible=false

  	--transition.fadeIn( img12, {time=1000} )
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

	channel2= audio.findFreeChannel()
	_G.hoja=1
	transition.fadeIn( equis, {time=1000} )
	transition.fadeIn( nota, {time=1000} )
	transition.fadeIn( arrow, {time=1000} )
	onText(event)
	img1.isVisible=true
	img2.isVisible=true
	img3.isVisible=true
	img4.isVisible=true

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
	transition.to( banner, {time=1000, alpha=0.30} )
	transition.to( explorador, {time=1000, alpha=0} )

	--transition.to( pause, {time=1000, alpha=0.30} )
	transition.to( play2, {time=1000, alpha=0.30} )
	transition.to( rewind, {time=1000, alpha=0.30} )
	transition.to( forward, {time=1000, alpha=0.30} )

	palabra= audio.loadStream("music/diccionario/titulo.mp3", {channel = channel2, loops = 0})
    audio.play(palabra)

    icono:removeEventListener( "touch", start)
	boton:removeEventListener("touch", back)
	mundo:removeEventListener( "touch", volver_ambiente)
	--corchea:removeEventListener( "touch", sin_musica )
	dicci:removeEventListener( "touch", fade_out )

end

end


function fade_in( event )

 if event.phase == "began" then

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
	transition.to( explorador, {time=1000, alpha=1} )



	transition.to( banner, {time=1000, alpha=1} )
	--transition.to( pause, {time=1000, alpha=1} )
	transition.to( play2, {time=1000, alpha=1} )
	transition.to( rewind, {time=1000, alpha=1} )
	transition.to( forward, {time=1000, alpha=1} )


	audio.stop( channel2)
	audio.dispose( channel2)

    icono:addEventListener( "touch", start)
	boton:addEventListener("touch",back)
	mundo:addEventListener( "touch", volver_ambiente)
	corchea:addEventListener( "touch", sin_musica )
	dicci:addEventListener( "touch", fade_out )

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


function volver_ambiente( event )
	
	if event.phase == "began" then



	  transition.fadeIn( texto21, {time=1000})
	  transition.fadeIn( botonAceptar, {time=1000})
	  transition.fadeIn( botonCancelar, {time=1000})
	  transition.fadeIn( alert1, {time=1000})	
	  fadeOut()	
	  transition.to( dicci, {time=1000, alpha=0.30})	
	  transition.to( personaje, {time=1000, alpha=0.30})
	  transition.to( dialog, {time=1000, alpha=0.30} )	
	  transition.to( explorador, {time=1000, alpha=0.30} )	

	  channel2= audio.findFreeChannel()
	  palabra= audio.loadStream("music/explorador/salir.mp3", {channel = channel2, loops = 0})
      audio.play(palabra)


	  botonAceptar:addEventListener("touch", aceptar)
	  botonCancelar:addEventListener("touch", cancelar)
	  mundo:removeEventListener("touch", volver_ambiente)
	  dicci:removeEventListener( "touch", fade_out)
	  boton:removeEventListener("touch", back)
      icono:removeEventListener( "touch", start)
	  --audio.stop(_G.channel)
	  --storyboard.gotoScene("elegirCuento","fade",400)
	end
end


function aceptar( event)
	
	if event.phase == "began" then

		audio.stop(_G.channel)
	  	storyboard.gotoScene("selectAmbiente","fade",400)

	end
end

function cancelar( event)
	
	if event.phase == "began" then

	  transition.fadeOut( texto21, {time=500})
	  transition.fadeOut( botonAceptar, {time=500})
	  transition.fadeOut( botonCancelar, {time=500})
	  transition.fadeOut( alert1, {time=500})
	  fadeIn()
	  --transition.fadeIn( dicci, {time=500} )
	  transition.fadeIn( personaje, {time=500} )
	  transition.fadeIn( dialog, {time=500} )
	  transition.fadeIn( explorador, {time=500} )
	  transition.fadeIn( text3, {time=1000} )
	 		 

	  botonAceptar:removeEventListener("touch", aceptar)
	  botonCancelar:removeEventListener("touch", cancelar)
	  mundo:addEventListener("touch",volver_ambiente)
	  dicci:addEventListener( "touch", fade_out)
	  boton:addEventListener("touch", back)
      icono:addEventListener( "touch", start)


		
	end
end



function back( event )
	
	if event.phase == "began" then

	  storyboard.gotoScene("personaje2","fade",400)
	end
end


function start( event )
	
	if event.phase == "began" then

	  audio.stop(_G.channel)
	  storyboard.gotoScene("elegirCuento","fade",400)
	
	end


end

function sin_musica ( event )

if event.phase == "began" then

	corchea.isVisible=false
	corchea2.isVisible=true
	audio.pause(_G.channel)
	corchea:removeEventListener( "touch", sin_musica)
	corchea2:addEventListener( "touch", con_musica )
	_G.sinMusica=true

	end


end

function con_musica ( event )

if event.phase == "began" then

	corchea.isVisible=true
	corchea2.isVisible=false
	audio.resume(_G.channel)
	corchea:addEventListener( "touch", sin_musica)
	corchea2:removeEventListener( "touch", con_musica )
	_G.sinMusica=false

	end

end



function fadeOut()
	
transition.to( fondo, {time=1500, alpha=0.50} )
transition.to( boton, {time=1500, alpha=0.50} )
transition.to( mundo, {time=1500, alpha=0.50} )
transition.to( corchea, {time=1500, alpha=0.50} )
transition.to( corchea2, {time=1500, alpha=0.50} )
transition.to( barra, {time=1500, alpha=0.50} )
transition.to( icono, {time=1500, alpha=0.50} )
transition.to( icono3, {time=1500, alpha=0.50} )
transition.fadeOut( text3, {time=500} )



end

function fadeIn()
	
transition.fadeIn( fondo, {time=1500} )
transition.fadeIn( boton, {time=1500} )
transition.fadeIn( dicci, {time=1500} )
transition.fadeIn( mundo, {time=1500} )
transition.fadeIn( corchea, {time=1500} )
transition.fadeIn( corchea2, {time=1500} )
transition.fadeIn( barra, {time=1500} )
transition.fadeIn( icono, {time=1500} )
transition.fadeOut( text3, {time=1500} )
transition.fadeOut( flecha2, {time=1500} )

end

function destexto( event )
	transition.fadeOut( text3, {time=500} )
end


function texto1( event )

	transition.fadeIn( text3, {time=1000} )
	channel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 7.mp3", {loops = -1, channel = channel})
	audio.play(sonido)
end

function texto10( event )
	
	text3.text="\nAntes de iniciar, te invitamos".."\na conocer algunas herramientas\nque puedes utilizar:"
	transition.fadeIn( text3, {time=1000} )
	channel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 8.mp3", {loops = -1, channel = channel})
	audio.play(sonido)
	
end

function texto2( event )

	screenGroup:remove(explorador )

	explorador=display.newImage("img/explorador.png",300,400)
	explorador.x=display.contentCenterX -300
	explorador.y=display.contentCenterY +190
	explorador:scale( 0.40, 0.40 )
	screenGroup:insert( explorador)

	transition.fadeIn( flecha1, {time=1000} )

	text3.text= "Diccionario:".. "\nPuedes presionarlo cada vez" .. "\nque quieras consultar lo que" .. "\nsignifica una palabra\no cómo se escribe."
	transition.fadeIn( text3, {time=1000} )

	channel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 9.mp3", {loops = -1, channel = channel})
	audio.play(sonido)

end


function texto3( event )


	text3.text="Planeta tierra: ".. "\nTe llevará a la última actividad."
	transition.fadeIn( flecha3, {time=1000} )
	transition.fadeOut( flecha1, {time=500} )
	transition.fadeIn( text3, {time=1000} )
	transition.to( dicci, {time=500, alpha=0.50} )
	transition.fadeIn(mundo, {time= 1000})

	channel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 10.mp3", {loops = -1, channel = channel})
	audio.play(sonido)


end

function texto4( event)
	
	text3.text= "Música:".."\nsi quieres apagar la" .. "\nmúsica de fondo tienes" .. "\nque presionar este icono."

	transition.fadeIn( flecha2, {time=1000} )
    transition.fadeOut( flecha3, {time=500} )
	transition.fadeIn( text3, {time=1000} )
	transition.to( mundo, {time=500, alpha=0.50} )
	transition.fadeIn( corchea,{time= 1000})

	channel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 11.mp3", {loops = -1, channel = channel})
	audio.play(sonido)


end

function texto5( event)
	
	screenGroup:remove( explorador )

	explorador=display.newImage("img/explorador2.png",300,400)
	explorador.x=display.contentCenterX -300
	explorador.y=display.contentCenterY +190
	explorador:scale( 0.40, 0.40 )
	screenGroup:insert( explorador)

	text3.text= "Empecemos!!!" 
	
	transition.fadeIn( text3, {time=1000} )

	channel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 12.mp3", {loops = -1, channel = channel})
	audio.play(sonido)

	
end

function texto6( event)
	
	screenGroup:remove( explorador )

	explorador=display.newImage("img/explorador3.png",300,400)
	explorador.x=display.contentCenterX -300
	explorador.y=display.contentCenterY +190
	explorador:scale( 0.40, 0.40 )
	screenGroup:insert(explorador)

	icono.isVisible=true
	transition.fadeIn( icono, {time=3000} )
	text3.text= "¡¡Continuemos!!"
	transition.fadeIn( text3, {time=1000} )
	--boton:addEventListener("touch",back)
	--icono:addEventListener( "touch", start)
	mundo:addEventListener( "touch", volver_ambiente)
	corchea:addEventListener( "touch", sin_musica )
	dicci:addEventListener( "touch", fade_out)
	
	channel= audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 13.mp3", {loops = -1, channel = channel})
	audio.play(sonido)

    
end


function validar_Musica( event )
	
	if (audio.isChannelActive(_G.channel) == false) then

		_G.channel= audio.findFreeChannel()
		audio.setVolume( 0.03, { channel=_G.channel })
		audio.setMaxVolume( 0.03, {channel=_G.channel })
		sonido=audio.loadStream(_G.rutaM1, {loops = -1, channel = _G.channel})
		audio.play(sonido)

	end

end


function cancelAll()

	 for i=1,12 do
	  timer.cancel(time[i])
	 end

	 transition.cancel()
	 audio.stop(channel)
	 audio.dispose(channel)

end



function scene:enterScene( event)

	fondo.enterFrame=validar_Musica
	Runtime:addEventListener("enterFrame", fondo)
	
	arrow:addEventListener( "touch", avHoja)
	arrow2:addEventListener( "touch", reHoja)
	equis:addEventListener( "touch", fade_in)
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
	boton:addEventListener("touch", back)
	icono.isVisible=true
	icono:addEventListener( "touch", start)
    transition.fadeIn( icono, {time=3000} )

	transition.fadeIn( explorador, {time=1000} )
	transition.fadeIn( personaje, {time=1000} )
	transition.fadeIn( dialog, {time=1000} )
	transition.fadeIn( boton, {time=1000} )
	time[0]=timer.performWithDelay( 0, texto1, 1)
	time[1]=timer.performWithDelay( 8000, destexto, 1)
	time[2]=timer.performWithDelay( 9000, texto10, 1)
	time[3]=timer.performWithDelay( 14000, fadeOut, 1)
	time[4]=timer.performWithDelay( 16000, texto2, 1)
	time[5]=timer.performWithDelay( 23000, destexto, 1)
	time[6]=timer.performWithDelay( 24000, texto3, 1)
	time[7]=timer.performWithDelay( 28000, destexto, 1)
	time[8]=timer.performWithDelay( 29000, texto4, 1)
	time[9]=timer.performWithDelay( 35000, fadeIn, 1)
	time[10]=timer.performWithDelay( 37000, texto5, 1)
	time[11]=timer.performWithDelay( 39000, destexto, 1)
	time[12]=timer.performWithDelay( 40000, texto6, 1)



end


function scene:exitScene( event )

   icono:removeEventListener("touch",start)
   mundo:removeEventListener( "touch", volver_ambiente)
   corchea:removeEventListener( "touch", sin_musica )
   dicci:removeEventListener( "touch", fade_out)
   equis:removeEventListener( "touch", fade_in)
   boton:removeEventListener("touch", back)
   cancelAll()
   storyboard.removeScene("sabanaIntro")


end

function scene:destroyScene( event )
	-- body
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene
