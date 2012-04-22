class TwitterCollection extends Backbone.Collection

    model : TwitterModel

    parse : ( response_ ) ->
        
        modelsArray = []
        
        for itemEntry in response_

            itemId    = itemEntry['id_str']

            itemText  = itemEntry['text']
            
            if itemEntry['truncated'] && itemEntry['retweeted_status'] && itemEntry['retweeted_status']['text']
                itemTextComplete = itemEntry['retweeted_status']['text']
                iOf = itemText.indexOf( itemTextComplete.substr( 0, 20 ) )
                if iOf != -1
                    itemText = itemText.substr( 0, iOf ) + itemTextComplete
            
            itemText  = Utils.linkifyUrls itemText
            itemText  = Utils.linkifyUsers itemText
            itemText  = Utils.linkifyHashes itemText

            itemDate  = Utils.relativeTime( itemEntry['created_at'] )

            itemUrl   = 'https://twitter.com/'
            itemUrl  += itemEntry['user']['screen_name']
            itemUrl  += '/statuses/'
            itemUrl  += itemEntry['id_str']

            itemModel = new TwitterModel
                id   : itemId
                text : itemText
                date : itemDate
                url  : itemUrl

            modelsArray.push itemModel

            if modelsArray.length == grifo.appConfig.MAX_RESULTS_TWITTER
                return modelsArray
       
        return modelsArray
