class TagCollection extends Backbone.Collection

    model : TagModel

    parse : ( response_ ) ->

        modelsArray = []

        for itemEntry in response_[ 'feed' ][ 'entry' ]

            itemModel  = new TagModel
                id          : itemEntry[ 'gsx$id' ][ '$t' ]
                short_title : itemEntry[ 'gsx$shorttitle' ][ '$t' ]
                long_title  : itemEntry[ 'gsx$longtitle' ][ '$t' ]
                group       : itemEntry[ 'gsx$group' ][ '$t' ]

            modelsArray.push itemModel

        return modelsArray

    select : ( id_ )->

        for tagModel in @models

            if tagModel.get( 'id' ) == id_

                tagModel.set { selected: true }

            else

                tagModel.set { selected: false }