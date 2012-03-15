class FlickrCollection extends Backbone.Collection

    model : FlickrModel

    parse : ( response_ ) ->

        modelsArray = []

        
        for itemEntry in response_[ 'items' ]

            isPortrait = false
            itemDescription = itemEntry['description']
            if itemDescription
                itemWidth  = Utils.getWidth( itemDescription )
                itemHeight = Utils.getHeight( itemDescription )
                if itemHeight > itemWidth
                    isPortrait = true

            itemTitle = itemEntry['title']
            itemUrl   = itemEntry['link']
            itemImage = itemEntry['media']['m'].replace( '_m.jpg', '.jpg' )

            itemDate  = Utils.relativeTime( itemEntry['published'] )

            itemModel  = new FlickrModel
                title       : itemTitle
                url         : itemUrl
                image       : itemImage
                date        : itemDate
                is_portrait : isPortrait

            modelsArray.push itemModel

            if modelsArray.length == grifo.appConfig.MAX_RESULTS_FLICKR
                return modelsArray

        return modelsArray

    parseAndAdd : ( response_ ) ->
    
        @add @parse( response_ )

window.jsonFlickrFeed = ( data_ )->

    grifo.flickrCollection.reset()
    grifo.flickrCollection.parseAndAdd data_