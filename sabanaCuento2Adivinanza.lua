local storyboard = require ("storyboard")
local scene= storyboard.newScene()
local fondo, boton, icono, ambiente1, ambiente2, signo, sonido
local planeta, animal3, circulo1, circulo2, circulo3, circulo4, texto1, flechaA, alert1, flechaB
local circulo5, circulo6, circulo7, circulo8, sonido, icono, tools1, planeta, titulo, icono2, equis, text1, text2
local aniBol1=true
local aniBol2=false
local aniBol3=false
local screenGroup
local listo=false
local newFont=_G.font
local textoDes
local variar=1
local primera=true
local valida=true

_G.okAdivinanza=true
_G.explicar=false



_G.pistaOK= false
_G.count=1
_G.Co= false
_G.Hi= false
_G.Ce= false
_G.Av= false
_G.Nu= false
_G.Ji= false

local time={}

--audio.reserveChannels(4)
local channel--=audio.findFreeChannel()



function scene:createScene( event )

	screenGroup= self.view

	fondo=display.newImage("img/sabana1.jpg",1024,600)
	fondo.x=display.contentWidth/2
	fondo.y=display.contentHeight/2
	fondo.alpha=0.95


	nube=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 400, 170, 12 )
	nube.x=display.contentCenterX-300
	nube.y=display.contentCenterY-200
	nube.strokeWidth = 6
	nube:setStrokeColor( 0, 0, 0 )
	--nube:setFillColor( .98, .941, .745)
	nube.alpha=1

	texto1 = display.newText("Haz llegado al juego de las Adivinanzas", 0, 0, newFont, _G.tamano )
	texto1.x= display.contentCenterX -300
	texto1.y=display.contentCenterY -220
	texto1:setFillColor( 0, 0, 0)
	texto1.alpha=0

	bannerDown=display.newRoundedRect( display.contentCenterX, display.contentCenterY, 350, 70, 21 )
	bannerDown.x= display.contentCenterX 
	bannerDown.y= display.contentCenterY + 240
	bannerDown.strokeWidth = 6
	bannerDown:setStrokeColor( 0, 0, 0 )
	bannerDown:setFillColor( .98, .941, .745)



	circulo2 = display.newCircle( 100, 100, 10 )
	circulo2:setFillColor( 0.5,0,0 )
	circulo2.strokeWidth = 3
	circulo2:setStrokeColor( 0, 0, 0 )
	circulo2.x=display.contentCenterX -120
	circulo2.y=display.contentCenterY +250

	
	circulo3 = display.newCircle( 100, 100, 10 )
	circulo3:setFillColor( 0.5,0,0 )
	circulo3.strokeWidth = 3
	circulo3:setStrokeColor( 0, 0, 0 )
	circulo3.x=display.contentCenterX -90
	circulo3.y=display.contentCenterY +250


	circulo4 = display.newCircle( 100, 100, 10 )
	circulo4:setFillColor( 0.5,0,0 )
	circulo4.strokeWidth = 3
	circulo4:setStrokeColor( 0, 0, 0 )
	circulo4.x=display.contentCenterX -60
	circulo4.y=display.contentCenterY +250


    circulo6 = display.newCircle( 100, 100, 10 )
	circulo6:setFillColor( 0.5,0,0 )
	circulo6.strokeWidth = 3
	circulo6:setStrokeColor( 0, 0, 0 )
	circulo6.x=display.contentCenterX +60
	circulo6.y=display.contentCenterY +250


	circulo7 = display.newCircle( 100, 100, 10 )
	circulo7:setFillColor( 0.5,0,0 )
	circulo7.strokeWidth = 3
	circulo7:setStrokeColor( 0, 0, 0 )
	circulo7.x=display.contentCenterX +90
	circulo7.y=display.contentCenterY +250


	circulo8 = display.newCircle( 100, 100, 10 )
	circulo8:setFillColor( 0.5,0,0 )
	circulo8.strokeWidth = 3
	circulo8:setStrokeColor( 0, 0, 0 )
	circulo8.x=display.contentCenterX +120
	circulo8.y=display.contentCenterY +250


	signo = display.newImage( "img/interrogacion.png")
	signo.x=display.contentCenterX
	signo.y=display.contentCenterY +240
	signo:scale( 0.13, 0.13 )


	animal0= display.newImage( "img/jirafa.png" )
	animal0.x= display.contentCenterX -430
	animal0.y= display.contentCenterY + 30
	animal0:scale(1.20, 1.20)

	animal1= display.newImage( "img/Elefante.png" )
	animal1.x= display.contentCenterX -300
	animal1.y= display.contentCenterY +200
	animal1:scale(1.30, 1.30)

	animal2= display.newImage( "img/Leon.png" )
	animal2.x= display.contentCenterX +300
	animal2.y= display.contentCenterY +180
	animal2:scale(1.20, 1.20)

	animal3= display.newImage( "img/Hienas.png" )
	animal3.x= display.contentCenterX -230
	animal3.y= display.contentCenterY +70
	animal3:scale(0.90, 0.90)


	animal4= display.newImage( "img/Suricata.png" )
	animal4.x= display.contentCenterX +420
	animal4.y= display.contentCenterY +100
	animal4:scale( 0.70, 0.70)


	animal5= display.newImage( "img/Rinoceronte.png" )
	animal5.x= display.contentCenterX +150
	animal5.y= display.contentCenterY +100
	animal5:scale(1.20, 1.20)



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


	barra=display.newImage( "img/banner2.png")
	barra:scale( 1.20, 0.95)
	barra.x=display.contentCenterX + 340
	barra.y=display.contentCenterY - 260

	pistas= display.newImage( "img/pista.png")
	pistas.x=display.contentCenterX +220
	pistas.y=display.contentCenterY -260
	pistas:scale( 0.13, 0.13 )

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

	flechaA= display.newImage( "img/flecha2.png")
	flechaA.x=display.contentCenterX 
	flechaA.y=display.contentCenterY + 150
	flechaA.alpha=0
	flechaA:scale(0.04, 0.035)

	flechaB= display.newImage( "img/flecha1.png")
	flechaB.x=display.contentCenterX + 220
	flechaB.y=display.contentCenterY -180
	flechaB.alpha=0
	flechaB:scale(0.04, 0.035)

	alert1=display.newImage("img/cuadro3.png")
	alert1.x=display.contentCenterX
	alert1.y=display.contentCenterY -30
	alert1:scale( 0.60, 0.60 )
	alert1.alpha=0

	texto2=display.newText("", 0 , 0, newFont, _G.tamano)
	texto2.x= display.contentCenterX 
	texto2.y= display.contentCenterY - 50
	texto2:setFillColor( 0,0,0 )
	texto2.alpha=0

	texto3=display.newText("", 0 , 0, newFont, _G.tamano)
	texto3.x= display.contentCenterX 
	texto3.y= display.contentCenterY - 50
	texto3:setFillColor( 0,0,0 )
	texto3.alpha=0


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

	te1= display.newText("LA SABANA: Es un lugar que se caracteriza \npor su poca vegetación, su suelo es seco y\npresenta poca cantidad de hierba y arbustos.",0,0, newFont, _G.tamDic)
	te1.isVisible=true
	te1.x=display.contentCenterX -220
	te1.y=display.contentCenterY -180
	te1:setFillColor( 0, 0, 0)
	te1.alpha=0

	te2= display.newText("JIRAFA: Es el mamífero más alto, se caracteriza\npor tener un largo cuello y manchas en la pelaje.\nSe alimenta de hojas, ramas de árboles y frutos.", 0, 0, newFont, _G.tamDic)
	te2.isVisible= true
	te2:setFillColor( 0, 0, 0)
	te2.x=display.contentCenterX -205
	te2.y=display.contentCenterY -80
	te2.alpha=0

	te3= display.newText("COCODRILO: Gran reptil carnívoro que vive en\nlugares de agua dulce como ríos y lagos.\nSu mayor característica, es su piel escamosa,\ndura y seca.", 0, 0, newFont, _G.tamDic)
	te3.isVisible= true
	te3:setFillColor( 0, 0, 0)
	te3.x=display.contentCenterX -205
	te3.y=display.contentCenterY +30
	te3.alpha=0

	te4= display.newText("SURICATA: Pequeño mamífero que vive en\ncuevas subterráneas. Se alimenta de insectos,\naunque a veces come huevos y vegetales.", 0, 0, newFont, _G.tamDic)
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


	skip=display.newImage("img/forward.png")
	skip.x=display.contentCenterX + 430
	skip.y=display.contentCenterY + 220
	skip:scale(0.50,0.50)

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

	texto21=display.newText("¿ Quieres salir ?", 0 , 0, newFont, _G.tamano)
	texto21.x= display.contentCenterX 
	texto21.y= display.contentCenterY - 50
	texto21:setFillColor( 0,0,0 )
	texto21.alpha=0


	screenGroup:insert(fondo)
	screenGroup:insert(nube)
	screenGroup:insert(bannerDown)
	screenGroup:insert(texto1)
	screenGroup:insert(circulo2)
	screenGroup:insert(circulo3)
	screenGroup:insert(circulo4)
	screenGroup:insert(circulo6)
	screenGroup:insert(circulo7)
	screenGroup:insert(circulo8)
	screenGroup:insert(signo)
	screenGroup:insert(animal0)
	screenGroup:insert(animal3)
	screenGroup:insert(animal1)
	screenGroup:insert(animal2)
	screenGroup:insert(animal4)
	screenGroup:insert(animal5)
	screenGroup:insert(icono)
	screenGroup:insert(boton)
	screenGroup:insert(barra)
	screenGroup:insert(corchea)
	screenGroup:insert(corchea2)
	screenGroup:insert(mundo)
	screenGroup:insert(dicci)
	screenGroup:insert(pistas)
	screenGroup:insert(skip)
	screenGroup:insert(flechaA)
	screenGroup:insert(flechaB)
    screenGroup:insert(alert1)
	screenGroup:insert(texto2)
	screenGroup:insert(texto3)
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

	screenGroup:insert(botonAceptar)
	screenGroup:insert(botonCancelar)
	screenGroup:insert(texto21)

end

function reHoja( event)


if event.phase == "began" then

		--time[10]=timer.performWithDelay( 0, noText, 1)
		time[11]=timer.performWithDelay( 0 , devuelveHoja, 1)
		--time[12]=timer.performWithDelay( 2000, onText, 1)

	end


	
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
  	transition.fadeIn( arrow, {time=300})

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
  	transition.fadeOut( arrow2, {time=300})
  	
  	_G.hoja=1

    end


end

function avHoja( event )
	

	if event.phase == "began" then

		--time[7]=timer.performWithDelay( 0, noText, 1)
		time[8]=timer.performWithDelay( 0, validaHoja, 1)
		--time[9]=timer.performWithDelay( 2000, onText, 1)

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
  	transition.fadeIn( arrow2, {time=300} )
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
  	transition.fadeOut( arrow, {time=300})
  	_G.hoja=3
  	


    end

end


function noText()
	
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

function onText()
	transition.fadeIn( te1, {time=500} )
	transition.fadeIn( te2, {time=500} )
	transition.fadeIn( te3, {time=500} )
	transition.fadeIn( te4, {time=500} )
end


function fade_out( event )
	
 if event.phase == "began" then

 	valida= false
	onText()
	audio.stop(_G.channel3)
	audio.stop(_G.channel2)

	_G.hoja=1
	--channel2= audio.findFreeChannel()
	img1.isVisible=true
	img2.isVisible=true
	img3.isVisible=true
	img4.isVisible=true



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
	transition.to( pistas, {time=1000, alpha=0.30} )


	palabra= audio.loadStream("music/diccionario/titulo.mp3", {channel = _G.channel3, loops = 0})
    audio.play(palabra)

    if (listo == false) then
    cancelar()
    end

    icono:removeEventListener( "touch", start)
	boton:removeEventListener("touch", volver_ambiente)
	mundo:removeEventListener( "touch", volver_ambiente)
	signo:removeEventListener("touch", signo_on)
	--corchea:removeEventListener( "touch", sin_musica )
	pistas:removeEventListener( "touch", pistas_on )
	dicci:removeEventListener( "touch", fade_out )


end

end


function fade_in( event)

 if event.phase == "began" then

 	valida= true


    if (listo == false) then

    	pistas:addEventListener( "touch", pistas_on) 
    	activar()

    	if (primera == true) then

    		pistas:removeEventListener("touch", pistas_on)
    		cancelar()

    	end

    end

    transition.fadeOut( equis, {time=500} )
	transition.fadeOut( nota, {time=500} )
	transition.fadeOut( arrow, {time=500} )
	transition.fadeOut( arrow2, {time=500} )
	noText()
	transition.fadeOut( img1, {time=500} )
	transition.fadeOut( img2, {time=500} )
	transition.fadeOut( img3, {time=500} )
	transition.fadeOut( img4, {time=500} )
	transition.fadeOut( img5, {time=500} )
	transition.fadeOut( img6, {time=500} )
	transition.fadeOut( img7, {time=500} )
	transition.fadeOut( img8, {time=500} )
	transition.fadeOut( img9, {time=500} )
	transition.fadeOut( img10, {time=500} )
	transition.fadeOut( img11, {time=500} )
	transition.fadeOut( img12, {time=500} )


	transition.to( fondo, {time=500, alpha=1} )
	transition.to( nube, {time=500, alpha=1} )
	transition.to( text1, {time=500, alpha=1} )
	transition.to( boton, {time=500, alpha=1} )
	transition.to( icono, {time=500, alpha=1} )
	transition.to( barra, {time=500, alpha=1} )
	transition.to( corchea, {time=500, alpha=1} )
	transition.to( corchea2, {time=500, alpha=1} )
	transition.to( mundo, {time=500, alpha=1} )
	transition.to( dicci, {time=500, alpha=1} )
	transition.fadeIn( pistas, {time=500} )

	
	icono:addEventListener( "touch", start)
	boton:addEventListener("touch",volver_ambiente)
	mundo:addEventListener( "touch", volver_ambiente)
	--corchea:addEventListener( "touch", sin_musica )
	signo:addEventListener("touch", signo_on)
	dicci:addEventListener( "touch", fade_out)

	--audio.stop(channel)
	--audio.dispose(channel)
	audio.stop(_G.channel3)
	audio.stop( _G.channel2)


 end
	
end


function musicDicci( event )

	local self= event.target

	--audio.stop(_G.channel3)

	if event.phase == "began" then

		audio.stop(_G.channel3)
		audio.stop(_G.channel2)
		--channel2=audio.findFreeChannel()

		 if (self.surfaceType == "sabana") then

		 sonido=audio.loadSound("music/diccionario/La sabana.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)

		 elseif (self.surfaceType == "jirafa") then

		 sonido=audio.loadSound("music/diccionario/Jirafa.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)

		 elseif (self.surfaceType == "cocodrilo") then

		 sonido=audio.loadSound("music/diccionario/Cocodrilo.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)

		 elseif (self.surfaceType == "suricata") then

		 sonido=audio.loadSound("music/diccionario/Suricata.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)


		 elseif (self.surfaceType == "nu") then

		 sonido=audio.loadSound("music/diccionario/Nu.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)


		 elseif (self.surfaceType == "leon") then

		 sonido=audio.loadSound("music/diccionario/Leon.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)


		 elseif (self.surfaceType == "elefante") then

		 sonido=audio.loadSound("music/diccionario/Elefante.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)


		 elseif (self.surfaceType == "hienas") then

		 sonido=audio.loadSound("music/diccionario/Hienas.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)


		 elseif (self.surfaceType == "cebra") then

		 sonido=audio.loadSound("music/diccionario/Cebra.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)


		 elseif (self.surfaceType == "avestruz") then

		 sonido=audio.loadSound("music/diccionario/Avestruz.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)


		 elseif (self.surfaceType == "hipopotamo") then

		 sonido=audio.loadSound("music/diccionario/Hipopotamo.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)


		 elseif (self.surfaceType == "rinoceronte") then

		 sonido=audio.loadSound("music/diccionario/Rinoceronte.mp3", {loops = 0, channel = _G.channel3})
		 audio.play(sonido)

		end

	end


end


function destexto( event )
	transition.fadeOut( texto1, {time=500} )
end


function texto_1( event )

	texto1.text= "Para comenzar debes escuchar\natentamente y luego elige el animal\nque consideras adecuado."
	transition.fadeIn( texto1, {time=1000} )

	--channel=audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 22.mp3", {loops = -1, channel = _G.channel2})
	audio.play(sonido)
end

function texto_4( event )
	
	_G.pistaOK= true
	fadeOut()
	texto1.text= "Acá cuentas con el boton Pista,\nel cual te ayudará a resolverlas."
	transition.fadeIn( texto1, {time=1000} )
	transition.fadeIn( flechaB, {time=1000} )
	timer.performWithDelay( 2000, blinkFlechaB, 1)

	--channel=audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 23.mp3", {loops = -1, channel = _G.channel2})
	audio.play(sonido)
end


function texto_2( event )

	flechaB.isVisible=false
	texto1.text= "Ahora solo debes presionar\nel Boton que indica la flecha."
	
	--channel=audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 24.mp3", {loops = -1, channel = _G.channel2})
	audio.play(sonido)

	transition.fadeIn( texto1, {time=1000} )
	transition.fadeIn( flechaA, {time=1000} )
	signo:addEventListener( "touch", signo_on )
	
	--activar()
	--cancelar()
	timer.performWithDelay(2000, blinkFlechaA, 1)
	
end

function blinkFlechaA (event)

 transition.blink( flechaA, {time=4000} )

end

function blinkFlechaB (event)

 _G.pistaOK=false
 transition.blink( flechaB, {time=4000} )

end


function texto_3()
	
	texto1.text= "Selecciona la imagen\n¿A quién pertenece?"
	transition.fadeIn( texto1, {time=1000} )
	
	valida= true
	primera=false
	--channel=audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 25.mp3", {loops = -1, channel = _G.channel2})
	audio.play(sonido)

	icono:addEventListener( "touch", start)
	boton:addEventListener("touch", volver_ambiente)
	mundo:addEventListener( "touch", volver_ambiente)
	corchea:addEventListener( "touch", sin_musica )
	pistas:addEventListener( "touch", pistas_on)
	dicci:addEventListener( "touch", fade_out)
	signo:addEventListener( "touch", signo_on )

	activar()
	skip.isVisible=false

end


function fadeOut()
	
	transition.to( fondo, {time=1500, alpha=0.30} )
	signo:removeEventListener("touch", signo_on )
	icono:removeEventListener( "touch", start)
	boton:removeEventListener("touch", volver_ambiente)
	mundo:removeEventListener( "touch", volver_ambiente)
	--corchea:removeEventListener( "touch", sin_musica )
	pistas:removeEventListener( "touch", pistas_on)
	dicci:removeEventListener( "touch", fade_out)
	--cancelar()

	if (_G.pistaOK == false) then 

		transition.to( nube, {time=1500, alpha=0.30} )
		transition.to( pistas, {time=1500, alpha=0.30} )
		transition.fadeOut( texto1, {time=500} )

	end


	transition.to( bannerDown, {time=1500, alpha=0.30} )
	transition.to( boton, {time=1500, alpha=0.30} )
	transition.to( corchea, {time=1500, alpha=0.30} )
	transition.to( corchea2, {time=1500, alpha=0.30} )
	transition.to( barra, {time=1500, alpha=0.30} )
	transition.to( circulo2, {time=1500, alpha=0.30} )
	transition.to( circulo3, {time=1500, alpha=0.30} )
	transition.to( circulo4, {time=1500, alpha=0.30} )
	transition.to( circulo6, {time=1500, alpha=0.30} )
	transition.to( circulo7, {time=1500, alpha=0.30} )
	transition.to( circulo8, {time=1500, alpha=0.30} )
	transition.to( mundo, {time=1500, alpha=0.30} )
	transition.to( dicci, {time=1500, alpha=0.30} )
	transition.to( signo, {time=1500, alpha=0.30} )
	transition.to( animal3, {time=1500, alpha=0.30} )
	transition.to( animal1, {time=1500, alpha=0.30} )
	transition.to( animal2, {time=1500, alpha=0.30} )
	transition.to( animal4, {time=1500, alpha=0.30} )
	transition.to( animal5, {time=1500, alpha=0.30} )
	transition.to( animal0, {time=1500, alpha=0.30} )


end

function fadeIn()
	
	transition.fadeOut( alert1, {time=1000} )
	transition.fadeOut( texto2, {time=1000})
	transition.to( fondo, {time=1500, alpha=0.95} )
	transition.fadeIn( nube, {time=1500})
	transition.fadeIn( bannerDown, {time=1500} )
	transition.fadeIn( corchea, {time=1500} )
	transition.fadeIn( corchea2, {time=1500} )
	transition.fadeIn( barra, {time=1500} )
	transition.fadeIn( circulo2, {time=1500} )
	transition.fadeIn( circulo3, {time=1500} )
	transition.fadeIn( circulo4, {time=1500} )
	transition.fadeIn( circulo6, {time=1500} )
	transition.fadeIn( circulo7, {time=1500} )
	transition.fadeIn( circulo8, {time=1500} )
	transition.fadeIn( mundo, {time=1500} )
	transition.fadeIn( dicci, {time=1500} )
	transition.fadeIn( signo, {time=1500} )
	transition.fadeIn( animal3, {time=1500} )
	transition.fadeIn( animal1, {time=1500} )
	transition.fadeIn( animal2, {time=1500} )
	transition.fadeIn( animal4, {time=1500} )
	transition.fadeIn( animal5, {time=1500} )
	transition.fadeIn( animal0, {time=1500} )
	transition.fadeIn( pistas, {time=1500} )
	transition.fadeIn( boton, {time=1500} )



end



function texto_6()
	
 texto1.text= _G.adiv1 
 transition.fadeIn( texto1, {time=1000} )

end



function vuelve(event)

if event.phase == "began" then
	
  if (valida == true) then
	
	if (listo == false) then
    cancelar()
    timer.performWithDelay( 0, mensaje, 1)
    timer.performWithDelay( 2000, activar, 1)
    end

   end

end

end

function correcto()
	
	pistas:removeEventListener( "touch", pistas_on )
	dicci:removeEventListener( "touch", fade_out)
	mundo:removeEventListener( "touch", volver_ambiente)
	signo:removeEventListener( "touch", signo_on)

	cancelar()
	listo=true

	time[8]=timer.performWithDelay( 0, destexto, 1)
	time[9]=timer.performWithDelay( 1000, texto_6, 1)
	time[10]=timer.performWithDelay( 5000, destexto, 1)
	time[11]=timer.performWithDelay( 6000, prox_adivinanza, 1)
end

function prox_adivinanza()
	
	
	dicci:addEventListener( "touch", fade_out)
	mundo:addEventListener( "touch", volver_ambiente)
	signo:addEventListener( "touch", signo_on)

	texto1.text="Sigue con la próxima adivinanza…"
	transition.fadeIn( texto1, {time=1000} )
	sonido=audio.loadStream("music/explorador/Frase 29.mp3", {loops = -1, channel = _G.channel2})
	audio.play(sonido)

end


function final()
	
	timer.performWithDelay( 0, destexto, 1)
	_G.adiv1= "¡Felicitaciones!"
	icono.isVisible=true
	timer.performWithDelay( 1000, texto_6, 1)
	sonido=audio.loadStream("music/explorador/Frase 28.mp3", {loops = -1, channel = _G.channel2})
	audio.play(sonido)


end


function final_2()

	timer.performWithDelay( 0, destexto, 1)
	_G.adiv1= "Para seguir jugando presiona la flecha"
	icono.isVisible=true
	timer.performWithDelay( 1000, texto_6, 1)
	sonido=audio.loadStream("music/explorador/Frase 27.mp3", {loops = -1, channel = _G.channel2})
	audio.play(sonido)


end


function activar()
	-- body

	    animal4:addEventListener("touch", animal4_on )
 		animal5:addEventListener("touch", animal5_on )
 		animal2:addEventListener("touch", animal2_on )
 		animal1:addEventListener("touch", animal1_on )
 		animal3:addEventListener("touch", animal3_on )
 		animal0:addEventListener( "touch", animal0_on )

end

function cancelar()
	
	--if event.phase == "began" then

		animal4:removeEventListener("touch", animal4_on )
 		animal5:removeEventListener("touch", animal5_on )
 		animal2:removeEventListener("touch", animal2_on )
 		animal1:removeEventListener("touch", animal1_on )
 		animal3:removeEventListener("touch", animal3_on )
 		animal0:removeEventListener( "touch", animal0_on )

 	--end

end

function mensaje()

  		--stopAudio()
  		
  		audio.stop(_G.channel2)
  		--audio.dispose(channel2)
  		--channel2= audio.findFreeChannel()


        variar=math.random()

		if ( variar < 0.33) then
	  	
	  	texto1.text="¿Necesitas ayuda?\nSelecciona una pista."

	  	sonido=audio.loadStream("music/explorador/Frase 26.mp3", {loops = -1, channel = _G.channel2})
		audio.play(sonido)

	    elseif (variar < 0.66) then

	    texto1.text="Vuelve a intentarlo."

	  	sonido=audio.loadStream("music/explorador/vuelve.mp3", {loops = -1, channel = _G.channel2})
		audio.play(sonido)

	    elseif (variar < 1) then

	    texto1.text="¡¡Tú puedes!!"

	  	sonido=audio.loadStream("music/explorador/puedes.mp3", {loops = -1, channel = _G.channel2})
		audio.play(sonido)

	    end

end




function animal0_on (event)

	if event.phase == "began" then

	 if (valida == true) then


	 if (_G.count == 1 and _G.Ji == true) then

	   stopAudio()
	   _G.count=2
	   circulo2:setFillColor(0,1,0)
	   _G.adiv1="¡Muy bien!, la adivinanza" .."\n corresponde a la Jirafa."
	   correcto ()
	   sonido=audio.loadStream("music/explorador/jirafa1.mp3", {loops = -1, channel = _G.channel2})
	   audio.play(sonido)



	  else

	       if (_G.count ~= 1) then
		   	vuelve(event)
		   	--timer.performWithDelay( 2000, activar, 1)
		   end
	
	  end 

	 end
	
	end

	if event.phase == "ended" then
		
		--fondo:removeEventListener( "touch", animal0_on )

	end

 end


function animal3_on (event)

	if event.phase == "began" then

	 if (valida == true) then

	   if (_G.count == 2 and _G.Co == true) then

	   	stopAudio()
	   _G.count=3
	   circulo3:setFillColor(0,1,0)
	   _G.adiv1="¡Muy bien!, la adivinanza" .."\n corresponde a las Hienas."
	   correcto()
	   sonido=audio.loadStream("music/explorador/hienas1.mp3", {loops = -1, channel = _G.channel2})
	   audio.play(sonido)


	   else

	       if (_G.count ~= 2) then
			   		
			   		vuelve(event)
		   	--timer.performWithDelay( 2000, activar, 1)
		   end
	
	    end 

	  end

	end

	if event.phase == "ended" then

	   --animal3:removeEventListener( "touch", animal3_on )

  	end

end

function animal5_on (event)


	if event.phase == "began" then

	 if (valida == true) then

	  if (_G.count == 3 and _G.Hi == true) then

	  	stopAudio()
	    _G.count=4
	    circulo4:setFillColor(0,1,0)
	    _G.adiv1="¡Muy bien!, la adivinanza" .."\n corresponde al Rinoceronte."
	    correcto()
	    sonido=audio.loadStream("music/explorador/rino1.mp3", {loops = -1, channel = _G.channel2})
	    audio.play(sonido)


	  else

	   	if (_G.count ~= 3) then
		   	
		   	vuelve(event)
		   	--timer.performWithDelay( 2000, activar, 1)
		   
		   end
	
	    end 

	  end
	
	end 


	if event.phase == "ended" then

	   --animal5:removeEventListener( "touch", animal5_on )

  	end

end

function animal4_on (event)

	if event.phase == "began" then

	  if (valida == true) then
	
		if (_G.count == 4 and _G.Ce == true) then

			stopAudio()
	   		_G.count=5
	   		circulo6:setFillColor(0,1,0)
	   		_G.adiv1="¡Muy bien!, la adivinanza" .."\n corresponde a la Suricata."
	   	    correcto()
	   	    sonido=audio.loadStream("music/explorador/suri1.mp3", {loops = -1, channel = _G.channel2})
	        audio.play(sonido)



		else

	   		if (_G.count ~= 4) then

		   		vuelve(event)
		   		--timer.performWithDelay( 2000, activar, 1)

		   end
	
		end 

	 end
	
	end 
  	
	if event.phase == "ended" then

	  --animal4:removeEventListener( "touch", animal4_on )

  	end

end


function animal2_on (event)

	if event.phase == "began" then

	  if (valida == true) then

		if (_G.count == 5 and _G.Av == true) then


			stopAudio()
	   		_G.count=6
	        circulo7:setFillColor(0,1,0)
	        _G.adiv1="¡Muy bien!, la adivinanza" .."\n corresponde al León."
	        correcto()
	        sonido=audio.loadStream("music/explorador/leon1.mp3", {loops = -1, channel = _G.channel2})
	        audio.play(sonido)



		else
		   	 if (_G.count ~= 5) then
		   	 
	   				vuelve(event)
		   			--timer.performWithDelay( 2000, activar, 1)

		    end

		end

	  end
	
	 end

	   
	if event.phase == "ended" then

	--animal2:removeEventListener( "touch", animal2_on )

	end

end


function animal1_on (event)

	if event.phase == "began" then

	  if (valida == true) then

		if (_G.count == 6 and _G.Nu == true) then

			stopAudio()
	   		_G.count=7
	        circulo8:setFillColor(0,1,0)
	        --signo:removeEventListener( "touch", signo_on )
	        --pistas:removeEventListener( "touch", pistas_on )
	        _G.adiv1="¡Muy bien!, la adivinanza" .."\n corresponde al Elefante."

	        timer.performWithDelay( 0, correcto, 1)
	        timer.performWithDelay( 3000, final, 1)
	        timer.performWithDelay( 6000, final_2, 1)

	        _G.okAdivinanza=true
	        sonido=audio.loadStream("music/explorador/elefante1.mp3", {loops = 0, channel = _G.channel2})
	        audio.play(sonido)


		else
		   	
		   	if (_G.count ~= 6) then

		   	 	vuelve(event)
		   		--timer.performWithDelay( 2000, activar, 1)

		    end

		end

	  end
	 
	end

	if event.phase == "ended" then

	-- animal1:removeEventListener( "touch", animal1_on )

	end

end

function stopAudio()
	
	audio.stop(_G.channel3)
	--audio.dispose(channel)
	audio.stop(_G.channel2)
	--audio.dispose(channel2)


end



function signo_on( event )

 	if event.phase == "began" then

 		fadeOut()

 	    valida=false
 		flechaA.isVisible=false
 		listo=false	 
 		transition.fadeIn( alert1, {time=1000} )
 		signo:removeEventListener( "touch", signo_on )

		audio.stop(_G.channel2)
 		--audio.dispose(_G.channel2)
 		

 		if (_G.count == 1) then
 		texto2.text= "Con su cuello largo saca las hojas " .. "\nde los árboles, con solo estirarse." 
		_G.Ji=true

 		elseif (_G.count == 2) then
 		texto2.text= "Somos las criaturas más astutas" .. "\ne inteligentes del reino animal." .. "\nSomos conocidas por nuestra" .. "\nparticular risa, aunque a veces".. "\nno simpatiza."
 		_G.Co=true


 		elseif (_G.count == 3) then
 		texto2.text= "Grande y gris soy," .. "\nsiempre en el lodo estoy." .. "\nMe reconocen por mis dos cuernos" .. "\ny por lo solitario que soy."
		_G.Hi=true
	 		
 		elseif (_G.count == 4) then
 		texto2.text= "Pequeña y curiosa" .. "\nvivo alerta a los movimientos." .. "\nRealizo profundas excavaciones" .. "\nen busca de insectos."
		_G.Ce=true
		
		elseif (_G.count == 5) then
 		texto2.text= "Tengo una larga melena," .. "\nsoy fuerte y veloz," .. "\nabro la boca muy grande" .. "\ny doy miedo con mi voz."
		_G.Av=true

		elseif (_G.count == 6) then
 		texto2.text= "Tengo orejas muy grandes" .. "\nsoy un enorme animal," .. "\ntengo una pancita gigante" .. "\ny la nariz más larga" .. "\nque te puedas imaginar."
 		_G.Nu=true
 		
 		end


 		transition.fadeIn( texto2, {time=1000} )
 		timer.performWithDelay( 0, destexto, 1)
 		timer.performWithDelay( 0, sonido_Adivinaza, 1 )
 		timer.performWithDelay( 10000, fadeIn, 1 )
 		timer.performWithDelay( 12000, texto_3 )


	end

end

function sonido_Adivinaza()

	audio.stop(_G.channel2)

    if (_G.count == 1) then

	sonido=audio.loadSound("music/adivinanzas/Jirafa.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)

	elseif (_G.count == 2) then

	sonido=audio.loadSound("music/adivinanzas/Hienas.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)

	elseif (_G.count == 3) then

	sonido=audio.loadSound("music/adivinanzas/Rinoceronte.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)

	elseif (_G.count == 4) then

	sonido=audio.loadSound("music/adivinanzas/Suricata.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)


	elseif (_G.count == 5) then

	sonido=audio.loadSound("music/adivinanzas/Leon.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)


    elseif (_G.count == 6) then

	sonido=audio.loadSound("music/adivinanzas/Elefante.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)

    end


end

function sonido_Pistas( event )

	audio.stop(_G.channel2)

    if (_G.count == 1) then

	sonido=audio.loadSound("music/pistas/Jirafa.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)

	elseif (_G.count == 2) then

	sonido=audio.loadSound("music/pistas/Hiena.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)

	elseif (_G.count == 3) then

	sonido=audio.loadSound("music/pistas/Rinoceronte.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)

	elseif (_G.count == 4) then

	sonido=audio.loadSound("music/pistas/Suricata.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)


	elseif (_G.count == 5) then

	sonido=audio.loadSound("music/pistas/Leon.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)


    elseif (_G.count == 6) then

	sonido=audio.loadSound("music/pistas/Elefante.mp3", {loops = 0, channel = _G.channel2})
	audio.play(sonido)

    end


end



function start( event )
	
	if event.phase == "began" then

	  storyboard.gotoScene("selectJuegos2","fade",400)

	end
end

function volver_ambiente( event )
	
	if event.phase == "began" then

	  transition.pause()
	  fadeOut()
	  audio.pause(_G.channel2)


	  --valida=false

	  if (listo == false) then

	  cancelar()

	  end

	  transition.fadeIn( texto21, {time=1000})
	  transition.fadeIn( botonAceptar, {time=1000})
	  transition.fadeIn( botonCancelar, {time=1000})
	  transition.fadeIn( alert1, {time=1000})					 
	  botonAceptar:addEventListener("touch", aceptar)
	  botonCancelar:addEventListener("touch", cancelar_2)

	  --channel2= audio.findFreeChannel()
	  palabra= audio.loadStream("music/explorador/salir.mp3", {channel = _G.channel3, loops = 0})
      audio.play(palabra)
	 
	end
end


function aceptar( event)
	
	if event.phase == "began" then

		audio.stop(_G.channel)
	  	storyboard.gotoScene("selectJuegos2","fade",400)

	end
end

function cancelar_2( event)
	
	if event.phase == "began" then

	  transition.fadeOut( texto21, {time=500})
	  transition.fadeOut( botonAceptar, {time=500})
	  transition.fadeOut( botonCancelar, {time=500})
	  transition.fadeOut( alert1, {time=500})	
	  transition.fadeIn( texto1, {time=500} )
	  --valida=true

	  fadeIn()				 
				 
	  botonAceptar:removeEventListener("touch", aceptar)
	  botonCancelar:removeEventListener("touch", cancelar_2)

	    signo:addEventListener("touch", signo_on )
		icono:addEventListener( "touch", start)
		boton:addEventListener("touch", volver_ambiente)
		mundo:addEventListener( "touch", volver_ambiente)
		--corchea:removeEventListener( "touch", sin_musica )
		
		dicci:addEventListener( "touch", fade_out)
		
		if (listo == false) then 

			activar()
			pistas:addEventListener( "touch", pistas_on)

		end
	  

		
	end
end

function sin_musica ( event )

if event.phase == "began" then

	_G.sinMusica=true
	corchea.isVisible=false
	corchea2.isVisible=true
	audio.pause(_G.channel)
	corchea:removeEventListener( "touch", sin_musica)
	corchea2:addEventListener( "touch", con_musica )

	end


end

function con_musica ( event )

if event.phase == "began" then

	_G.sinMusica=false
	corchea.isVisible=true
	corchea2.isVisible=false
	audio.resume(_G.channel)
	corchea:addEventListener( "touch", sin_musica)
	corchea2:removeEventListener( "touch", con_musica )


	end

end


function pistas_Out (event)

	transition.to( fondo, {time=1500, alpha=0.30} )
	transition.fadeIn( alert1, {time=1000} )
	transition.fadeIn( texto3, {time=1500} )
	transition.to( nube, {time=1500, alpha=0.30} )
	transition.to( pistas, {time=1500, alpha=0.30} )
	transition.to( texto1, {time=500, alpha=0.30 } )
	transition.to( bannerDown, {time=1500, alpha=0.30} )
	transition.to( boton, {time=1500, alpha=0.30} )
	transition.to( corchea, {time=1500, alpha=0.30} )
	transition.to( corchea2, {time=1500, alpha=0.30} )
	transition.to( barra, {time=1500, alpha=0.30} )
	transition.to( circulo2, {time=1500, alpha=0.30} )
	transition.to( circulo3, {time=1500, alpha=0.30} )
	transition.to( circulo4, {time=1500, alpha=0.30} )
	transition.to( circulo6, {time=1500, alpha=0.30} )
	transition.to( circulo7, {time=1500, alpha=0.30} )
	transition.to( circulo8, {time=1500, alpha=0.30} )
	transition.to( mundo, {time=1500, alpha=0.30} )
	transition.to( dicci, {time=1500, alpha=0.30} )
	transition.to( signo, {time=1500, alpha=0.30} )
	transition.to( animal3, {time=1500, alpha=0.30} )
	transition.to( animal1, {time=1500, alpha=0.30} )
	transition.to( animal2, {time=1500, alpha=0.30} )
	transition.to( animal4, {time=1500, alpha=0.30} )
	transition.to( animal5, {time=1500, alpha=0.30} )




end


function pistas_on ( event )

	if event.phase == "began" then

		valida=false

	
 		if (_G.count == 1) then 
 		texto2.text= "Tiene el cuello más largo ."

 	    elseif (_G.count == 2) then 
 		texto2.text= "Tiene su pelaje de color café,\ncon pequeñas manchas negras."

 		elseif (_G.count == 3) then 
 		texto2.text= "Tiene una gran cabeza y pequeñas orejas."

 		elseif (_G.count == 4) then 
 		texto2.text= "Para mirar a su alrededor,\nse levanta en dos patas."

 		elseif (_G.count == 5) then 
 		texto2.text= "Tiene una gran melena."

 		elseif (_G.count == 6) then 
 		texto2.text= "Tiene una larga trompa."

 	    end



 	    fadeOut()

 	    if (listo == false) then
 	    cancelar()
 		end

 	    --cancelar()

 		flechaA.isVisible=false
 		transition.fadeIn( alert1, {time=1000} )
 		transition.fadeIn( texto2, {time=1000} )
 		stopAudio()

 		--audio.stop( channel)
 		--audio.dispose( channel)

 		--channel= audio.findFreeChannel()
 		sonido=audio.loadSound("music/pistas/Titulo.mp3", {loops = 0, channel = _G.channel2})
	    audio.play(sonido)


 	    --timer.performWithDelay( 0, destexto, 1)
 		timer.performWithDelay( 3000, sonido_Pistas, 1 )
 		timer.performWithDelay( 7000, fadeIn, 1 )
 		timer.performWithDelay( 9000, texto_3 )

 	 end
    --sonido = audio.loadSound("music/pista.mp3", {loops = -1, channel = 2})
    --audio.play(sonido)
end

function validar_Musica( event )
	
	if (audio.isChannelActive(_G.channel) == false) then

		--_G.channel= audio.findFreeChannel()
		--audio.setVolume( 0.03, { channel=_G.channel })
		--audio.setMaxVolume( 0.03, { channel=_G.channel })
		sonido=audio.loadStream(_G.rutaM2, {loops = -1, channel = _G.channel})
		audio.play(sonido)

	end

end

function cancelAll()

	for i=1,7 do
	 timer.cancel(time[i])
	end

	 
	if (listo == true) then

		for i=8,11 do
	 	timer.cancel(time[i])
	 	end

	end


	 --audio.stop(channel)
	 audio.stop( _G.channel2 )
	 --audio.dispose(channel)
	 --audio.dispose( _G.channel2 )


end


function tutorial()

	time[1]=timer.performWithDelay( 6000, destexto ,1)
	time[2]=timer.performWithDelay( 7000, texto_1, 1)
	time[3]=timer.performWithDelay( 13000, destexto, 1)
	time[4]=timer.performWithDelay( 14000, texto_4, 1)
	time[5]=timer.performWithDelay( 20000, destexto, 1)
	time[6]=timer.performWithDelay( 21000, fadeIn, 1)
	time[7]=timer.performWithDelay( 22000, texto_2, 1 )

end

function texto_sinTuto()

	
	texto1.text= "Pulsa el botón para comenzar\nuna nueva adivinanza."
	transition.fadeIn( texto1, {time=1000} )
	mundo:addEventListener( "touch", volver_ambiente)
	corchea:addEventListener( "touch", sin_musica )
	--pistas:addEventListener( "touch", pistas_on)
	--dicci:addEventListener( "touch", fade_out)
	--cancelar()
	--fondo:addEventListener( "touch", fondo_on)
end




function saltarTutorial( event )
	
if event.phase == "began" then


	for i=1,7 do
	timer.cancel( time[i] )
	end

	audio.stop(_G.channel3)
	--audio.dispose(channel)
	audio.stop(_G.channel2)
	--audio.dispose(channel2)
	transition.cancel()

	signo:addEventListener( "touch", signo_on )
	boton:addEventListener( "touch", volver_ambiente)
	--pistas:removeEventListener("")

	timer.performWithDelay(0, fadeIn, 1)
	flechaA.isVisible=false
	flechaB.isVisible=false
	transition.to( skip, {time=1000, alpha=0} )
	timer.performWithDelay( 500, destexto, 1 )	
	timer.performWithDelay( 1000, texto_sinTuto, 1 )

 end

end



function scene:enterScene( event)
	

	fondo.enterFrame=validar_Musica
	Runtime:addEventListener("enterFrame", fondo)
	--listo=true

    skip:addEventListener( "touch", saltarTutorial )
    arrow:addEventListener( "touch", avHoja)
	arrow2:addEventListener( "touch", reHoja)

	icono:addEventListener( "touch", start)
	--boton:addEventListener("touch", start)
	--pistas:addEventListener( "touch", pistas_on )

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

	_G.okAdivinanza=true


	if (_G.sinMusica == true ) then

		corchea.isVisible=false
		corchea2.isVisible=true
		audio.pause(_G.channel)
		corchea:removeEventListener( "touch", sin_musica)
		corchea2:addEventListener( "touch", con_musica )

	end

	transition.fadeIn( texto1, {time=1000})

	--channel=audio.findFreeChannel()
	sonido=audio.loadStream("music/explorador/Frase 21.mp3", {loops = 0, channel =_G.channel2})
	audio.play(sonido)
	tutorial()


end



function scene:exitScene( event )


	animal4:removeEventListener("touch", animal4_on )
	animal5:removeEventListener("touch", animal5_on )
	animal2:removeEventListener("touch", animal2_on )
	animal1:removeEventListener("touch", animal1_on )
	animal3:removeEventListener("touch", animal3_on )
	signo:removeEventListener( "touch", signo_on )
	icono:removeEventListener( "touch", start)
	mundo:removeEventListener( "touch", volver_ambiente)
	corchea:removeEventListener( "touch", sin_musica )

	skip:removeEventListener( "touch", saltarTutorial )
    arrow:removeEventListener( "touch", avHoja)
	arrow2:removeEventListener( "touch", reHoja)

	boton:removeEventListener("touch", volver_ambiente)

	equis:removeEventListener( "touch", fade_in)
	img1:removeEventListener( "touch", musicDicci)
	img2:removeEventListener( "touch", musicDicci)
	img3:removeEventListener( "touch", musicDicci)
	img4:removeEventListener( "touch", musicDicci)
	img5:removeEventListener( "touch", musicDicci)
	img6:removeEventListener( "touch", musicDicci)
	img7:removeEventListener( "touch", musicDicci)
	img8:removeEventListener( "touch", musicDicci)
	img9:removeEventListener( "touch", musicDicci)
	img10:removeEventListener( "touch", musicDicci)
	img11:removeEventListener( "touch", musicDicci)
	img12:removeEventListener( "touch", musicDicci)
	cancelAll()
	storyboard.removeScene("sabanaCuento2Adivinanza")


	
end

function scene:destroyScene( event )



end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene