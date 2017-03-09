var fs = require( 'fs' )
var path = require( 'path' )
var sense = null

var logfile = path.join( __dirname, '..', 'sense-hat.log' )

function log( value ) {
  if( value instanceof Error ) {
    value = {
      time: new Date(),
      event: 'error',
      error: {
        type: value.constructor.name,
        message: value.message,
        code: value.code,
        stack: value.stack,
      }
    }
  }
  var line = JSON.stringify( value, null, 2 ) + '\n'
  fs.writeFile( logfile, line, { flag: 'a' }, function( error ) {
    if( error ) console.log( error )
  })
}

function cycleScreen() {

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

  var image = Math.random() >= 0.5 ?
    blankScreen : questionMark

  log({
    time: new Date(),
    event: 'cycle',
    image: image === questionMark ?
      'questionMark' : 'blank'
  })

  sense.setPixels( image )

}

log({ time: new Date(), event: 'start' })

try {
  sense = require( 'sense-hat-led' )
} catch( error ) {
  log( error )
}

if( sense != null ) {
  setInterval( cycleScreen, 1000 )
}
