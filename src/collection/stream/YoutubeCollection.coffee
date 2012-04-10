class YoutubeCollection extends Backbone.Collection

    model : YoutubeModel

    parse : ( response_ ) ->

        modelsArray = []

        for itemEntry in response_[ 'feed' ][ 'entry' ]

            itemDate   = Utils.relativeTime( itemEntry[ 'published' ][ '$t' ] )
            itemUrl    = itemEntry[ 'id' ][ '$t' ]
            itemUrl    = itemUrl.replace( 'http://gdata.youtube.com/feeds/api/videos/', 'http://www.youtube.com/watch?v=' )
            itemId     = itemUrl.replace( 'http://www.youtube.com/watch?v=', '' )
            itemTags   = itemEntry[ 'media$group' ][ 'media$keywords' ][ '$t' ]
            isPortrait = false
            
            if itemTags.toLowerCase().indexOf( 'vertical' ) != -1 || itemTags.toLowerCase().indexOf( 'v' ) != -1 || itemTags.toLowerCase().indexOf( 'portrait' ) != -1
                isPortrait = true

            itemModel  = new YoutubeModel
                id               : itemId
                url              : itemUrl
                date             : itemDate
                title            : itemEntry[ 'title' ][ '$t' ]
                content          : itemEntry[ 'content' ][ '$t' ]
                thumbnail_low    : 'http://i.ytimg.com/vi/' + itemId + '/default.jpg'
                thumbnail_medium : 'http://i.ytimg.com/vi/' + itemId + '/hqdefault.jpg'
                is_portrait      : isPortrait

            modelsArray.push itemModel

        return modelsArray