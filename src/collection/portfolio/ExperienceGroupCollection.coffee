class ExperienceGroupCollection extends Backbone.Collection

    model : ExperienceGroupModel

    parse : ( response_ ) ->

        modelsArray = []

        for itemEntry in response_[ 'feed' ][ 'entry' ]

            itemModel  = new ExperienceGroupModel
                id     : itemEntry[ 'gsx$id' ][ '$t' ]
                label  : itemEntry[ 'gsx$label' ][ '$t' ]
                column : parseFloat( itemEntry[ 'gsx$column' ][ '$t' ] )

            modelsArray.push itemModel

        return modelsArray