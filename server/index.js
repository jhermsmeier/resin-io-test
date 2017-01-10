var http = require( 'http' )
var os = require( 'os' )

var server = http.createServer()

server.once( 'listening', function() {
  console.log( 'listening on', this.address() )
})

server.on( 'request', function( req, res ) {
  console.log( req.method, req.url )
  if( req.url === '/' ) {
    res.write( JSON.stringify( { host: os.hostname() }, null, 2 ) )
    res.end()
  } else {
    res.statusCode = 404
    res.end()
  }
})

server.listen( 8080 )
