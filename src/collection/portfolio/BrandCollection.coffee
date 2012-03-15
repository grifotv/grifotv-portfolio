class BrandCollection extends Backbone.Collection

    model : BrandModel

    comparator : ( model_ ) ->
    
        return model_.get( 'priority' ) * 10.0 + ( Math.random() * 10.0 )

    parse : ( response_ ) ->

        modelsArray = []

        for itemEntry in response_[ 'feed' ][ 'entry' ]

            itemModel  = new BrandModel
                id       : itemEntry[ 'gsx$id' ][ '$t' ]
                label    : itemEntry[ 'gsx$label' ][ '$t' ]
                image    : itemEntry[ 'gsx$image' ][ '$t' ]
                url      : itemEntry[ 'gsx$url' ][ '$t' ]
                priority : itemEntry[ 'gsx$priority' ][ '$t' ]

            modelsArray.push itemModel

        return modelsArray