class CreditGroupCollection extends Backbone.Collection

    model : CreditGroupModel

    parse : ( response_ ) ->

        modelsArray = []

        for itemEntry in response_[ 'feed' ][ 'entry' ]

            itemModel  = new CreditGroupModel
                id       : itemEntry[ 'gsx$id' ][ '$t' ]
                label    : itemEntry[ 'gsx$label' ][ '$t' ]
                project  : itemEntry[ 'gsx$project' ][ '$t' ]
            
            modelsArray.push itemModel

        return modelsArray