display.setStatusBar(display.HiddenStatusBar)
local storyboard= require "storyboard"
_G.personaje="niño"
_G.rutaNombre="img/".. _G.personaje ..".png"
_G.name=""
_G.rutaM1="music/fondo/juego1.mp3"
_G.rutaM2="music/fondo/juego2.mp3"

_G.channel=audio.findFreeChannel()
audio.setVolume( 0.04, { channel=_G.channel })
audio.setMaxVolume( 0.04, { channel=_G.channel })

_G.font=native.newFont( "fonts/comic.ttf", 18)
_G.tamano= 18
_G.explicar=true
--storyboard.gotoScene("sabanaIntro")
storyboard.gotoScene("introduction")



--_G.ian= 21
