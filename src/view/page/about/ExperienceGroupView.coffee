class ExperienceGroupView extends Backbone.View

    className   : 'new-row'
    numLeftChar : 0.0

    initialize : ->

        @template               = _.template $( '#template_experience_group' ).html()

        @lineLeftTemplate       = _.template $( '#template_line_left' ).html()
        @lineRightTemplate      = _.template $( '#template_line_right' ).html()
        @lineRightPlusTemplate  = _.template $( '#template_line_right_plus' ).html()
        @lineGapTemplate        = _.template $( '#template_line_gap' ).html()


    render : =>

        $( @el ).append @template
            label : @model.get 'label'

        for experienceModel in grifo.experienceCollection.models
            # TODO: find smarter way to filter, with Underscore
            if ( experienceModel.get( 'group' ) == @model.get('id') )
                @appendExperience experienceModel

        $( '.inner-left' , @el ).append @lineGapTemplate()
        $( '.inner-left' , @el ).append @lineGapTemplate()

        $( '.inner-right' , @el ).append @lineGapTemplate()
        $( '.inner-right' , @el ).append @lineGapTemplate()

        #console.log( 478 - 29 - @numLeftChar * 7 )
        $( '.inner-right', @el ).css( 'max-width' , 478.0 - 29.0 - @numLeftChar * 7.0 )

        return @


    appendExperience : ( model_ ) =>

        # numLeftChar
        if model_.get( 'left' ).split( '<' )[ 0 ].length > @numLeftChar

            @numLeftChar = model_.get( 'left' ).split( '<' )[ 0 ].length

        # left
        if model_.get( 'left' ).length > 0.0

            $( '.inner-left', @el ).append @lineLeftTemplate
                label : model_.get( 'left' )
        else

            $( '.inner-left', @el ).append @lineGapTemplate()
        
        # right
        if model_.get( 'right' ).length > 0.0

            if model_.get( 'plus_url' ).length > 0.0

                $( '.inner-right', @el ).append @lineRightPlusTemplate
                    label  : model_.get( 'right' )
                    url    : model_.get( 'plus_url' )
                    window : model_.get( 'window' )
            else

                $( '.inner-right', @el ).append @lineRightTemplate
                    label:      model_.get( 'right' )
        else

            $( '.inner-right', @el ).append @lineGapTemplate()