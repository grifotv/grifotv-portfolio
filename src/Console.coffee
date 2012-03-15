# adding fake console to browsers that doesn't have it

if !window[ 'console' ]

    window.console = {}

    console.log = ( e_ )->
        return e_
        #$( '#console' ).prepend e_ + '<br />' 
        #$( 'body' ).prepend $( '#console' )

    console.dir    = console.log

    #$( 'body' ).prepend '<div id="console"></div>'


