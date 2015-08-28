display.setStatusBar(display.HiddenStatusBar)
local storyboard= require "storyboard"
_G.personaje="niño"
_G.name=""
_G.rutaM1="music/fondo/juego1.mp3"
_G.rutaM2="music/fondo/juego2.mp3"
_G.channel=audio.findFreeChannel()
--storyboard.gotoScene("sabanaIntro")
storyboard.gotoScene("introduction")



--_G.ian= 21
