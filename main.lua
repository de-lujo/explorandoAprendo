display.setStatusBar(display.HiddenStatusBar)
local storyboard= require "storyboard"
_G.personaje="niño"
_G.rutaNombre="img/".. _G.personaje ..".png"
_G.name=""
_G.tamDic=16
_G.rutaM1="music/fondo/juego1.mp3"  -- Ruta de la música de fondo
_G.rutaM2="music/fondo/juego2.mp3" -- Ruta de la música de fondo


--

_G.channel=1 --audio.findFreeChannel(1)     -- Canal de musica de fondo.
_G.channel2=2 --audio.findFreeChannel(2)  -- Canal de diálogos de la aplicación.
_G.channel3=3 --audio.findFreeChannel(3)   -- Canal de diálogos 2 de la aplicación.
_G.channel4=4--audio.findFreeChannel(4)    -- Canal de la canción del pictograma.

_G.volChannel=0.10 -- Volumen del canal 1
_G.volChannel2=1
_G.volChannel3=1
_G.volChannel4=0.01

--audio.reserveChannels(1)
	


--Seteamos en volumen de la música de fondo.
audio.setVolume( _G.volChannel, { channel=_G.channel })
audio.setMaxVolume( _G.volChannel, { channel=_G.channel })

--Seteamos en volumen de la música de fondo.
audio.setVolume( _G.volChannel2, { channel=_G.channel2 })
audio.setMaxVolume( _G.volChannel2, { channel=_G.channel2 })

--Seteamos en volumen de la música de fondo.
audio.setVolume( _G.volChannel3, { channel=_G.channel3})
audio.setMaxVolume( _G.volChannel3, { channel=_G.channel3 })

--Seteamos en volumen de la canción pictograma.
audio.setVolume( _G.volChannel4, { channel=_G.channel4 })
audio.setMaxVolume( _G.volChannel4, { channel=_G.channel4})




_G.font=native.newFont( "fonts/comic.ttf", 18)
_G.tamano= 18
_G.explicar=true
--storyboard.gotoScene("sabanaIntro")
storyboard.gotoScene("introduction")



