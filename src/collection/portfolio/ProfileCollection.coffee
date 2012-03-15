class ProfileCollection extends Backbone.Collection

    model : ProfileModel

    parse : ( response_ ) ->

        modelsArray = []

        for itemEntry in response_[ 'feed' ][ 'entry' ]

            itemModel  = new ProfileModel
                id       : itemEntry[ 'gsx$id' ][ '$t' ]
                label    : itemEntry[ 'gsx$label' ][ '$t' ]
                url      : itemEntry[ 'gsx$url' ][ '$t' ]

            modelsArray.push itemModel

        return modelsArray