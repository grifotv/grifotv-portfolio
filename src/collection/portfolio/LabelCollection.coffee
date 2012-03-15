class LabelCollection extends Backbone.Collection

    model : LabelModel

    parse : ( response_ ) ->

        modelsArray = []

        for itemEntry in response_[ 'feed' ][ 'entry' ]

            itemModel  = new LabelModel
                id    : itemEntry[ 'gsx$id' ][ '$t' ]
                label : itemEntry[ 'gsx$label' ][ '$t' ]
            
            modelsArray.push itemModel

        return modelsArray