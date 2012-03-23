class TagGroupCollection extends Backbone.Collection

    model : TagGroupModel

    parse : ( response_ ) ->

        modelsArray = []

        for itemEntry in response_[ 'feed' ][ 'entry' ]

            itemModel  = new TagGroupModel
                id       : itemEntry[ 'gsx$id' ][ '$t' ]
                label    : itemEntry[ 'gsx$label' ][ '$t' ]

            modelsArray.push itemModel

        return modelsArray