class BlogCollection extends Backbone.Collection

    model : BlogModel

    load : () ->
        $.get @url, @parseAndAdd

    parseAndAdd : ( response_ ) =>
        @add @parse( response_ )
        grifo.view.onLoad()

    parse : ( response_ ) ->
        
        modelsArray = []

        $( response_ ).find( 'item' ).each ->
 
            $item           = $( @ );

            itemTitle       = $item.find('title').text()
            itemUrl         = $item.find('link').text()
            itemDescription = $item.find('description').text()
            itemDate        = Utils.relativeTime( $item.find('pubDate').text() )

            itemModel       = new BlogModel
                title       : itemTitle
                url         : itemUrl
                description : itemDescription
                date        : itemDate

            modelsArray.push itemModel

            if modelsArray.length == grifo.config.MAX_RESULTS_BLOG
                return modelsArray

        return modelsArray
