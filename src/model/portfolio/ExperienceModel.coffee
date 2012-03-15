class ExperienceModel extends Backbone.Model

    defaults :
    
        left      : ''
        right     : ''
        plus_url  : ''
        window    : ''
        group     : ''

    initialize : ->

        if @get( 'plus_url' ).length > 0.0

            if @get( 'plus_url' ).indexOf( '#' ) == 0.0

                @set
                    window : '_self'

            else
                @set
                    window : '_blank'