class BrandModel extends Backbone.Model

    defaults :
    
        id        : ''
        label     : ''
        image     : ''
        url       : ''
        window    : ''
        priority  : 0.0

    initialize : ->

        if @get( 'url' ).length > 0.0

            if @get( 'url' ).indexOf( '#' ) == 0.0

                @set
                    window : '_self'

            else

                @set
                    window : '_blank'

        @set
            priority : parseFloat( @get( 'priority' ) )