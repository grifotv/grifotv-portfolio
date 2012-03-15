class ProfileModel extends Backbone.Model

    defaults :
    
        id      : ''
        label   : ''
        url     : ''
        window  : ''

    initialize : ->

        if @get( 'url' ).length > 0.0

            if @get( 'url' ).indexOf( '#' ) == 0.0

                @set
                    window : '_self'

            else

                @set
                    window : '_blank'