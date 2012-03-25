class ProjectCollection extends Backbone.Collection

    model : ProjectModel

    parse : ( response_ ) ->

        modelsArray = []

        for itemEntry in response_[ 'feed' ][ 'entry' ]

            itemModel  = new CreditGroupModel
                id           : itemEntry[ 'gsx$id' ][ '$t' ]
                index        : modelsArray.length
                tile_size    : itemEntry[ 'gsx$tilesize' ][ '$t' ]
                short_title  : itemEntry[ 'gsx$shorttitle' ][ '$t' ]
                long_title   : itemEntry[ 'gsx$longtitle' ][ '$t' ]
                headline     : itemEntry[ 'gsx$headline' ][ '$t' ]
                thumbnail    : itemEntry[ 'gsx$thumbnail' ][ '$t' ]
                url          : itemEntry[ 'gsx$url' ][ '$t' ]
                video        : itemEntry[ 'gsx$video' ][ '$t' ]
                copy         : itemEntry[ 'gsx$copy' ][ '$t' ]
                images       : itemEntry[ 'gsx$images' ][ '$t' ].split( ',' )
                tags         : itemEntry[ 'gsx$tags' ][ '$t' ].split( ',' )
                display_tags : itemEntry[ 'gsx$displaytags' ][ '$t' ].split( ',' )
            
            modelsArray.push itemModel

        return modelsArray