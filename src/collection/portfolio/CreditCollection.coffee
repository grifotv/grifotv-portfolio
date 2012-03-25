class CreditCollection extends Backbone.Collection

    model : CreditModel

    parse : ( response_ ) ->

        modelsArray = []

        for itemEntry in response_[ 'feed' ][ 'entry' ]

            itemModel  = new CreditModel
                label    : itemEntry[ 'gsx$label' ][ '$t' ]
                profiles : itemEntry[ 'gsx$profiles' ][ '$t' ].split( ',' )
                group    : itemEntry[ 'gsx$group' ][ '$t' ]
                
            modelsArray.push itemModel

        return modelsArray