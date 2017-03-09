var sense = require( 'sense-hat-led' )

var R = [ 255,   0,   0 ]
var X = [ 255, 255, 255 ]
var _ = [   0,   0,   0 ]

var blankScreen = [
  _, _, _, _, _, _, _, _,
  _, _, _, _, _, _, _, _,
  _, _, _, _, _, _, _, _,
  _, _, _, _, _, _, _, _,
  _, _, _, _, _, _, _, _,
  _, _, _, _, _, _, _, _,
  _, _, _, _, _, _, _, _,
  _, _, _, _, _, _, _, _,
]

var questionMark = [
  _, _, _, R, R, _, _, _,
  _, _, R, _, _, R, _, _,
  _, _, _, _, _, R, _, _,
  _, _, _, _, R, _, _, _,
  _, _, _, R, _, _, _, _,
  _, _, _, R, _, _, _, _,
  _, _, _, _, _, _, _, _,
  _, _, _, R, _, _, _, _,
]

setInterval( function() {
  var image = Math.random() >= 0.5 ?
    blankScreen : questionMark
  sense.setPixels( image )
})
