class StreamPageView extends AbstractPageView

    id            : 'stream-page'
    template      : null
    wordItemList  : null
    mediaItemList : null


    init : ->
    
        @wordItemList  = []
        @mediaItemList = []
        
        @template = _.template $( '#template_page_stream' ).html()


    render: =>

        @$el.append @template
            label : grifo.labelCollection.get( 'stream-title' ).get( 'label' )

        # TODO use grifo.labelCollection.get( 'stream-item-info' ).get( 'label' )

        # WORD

        i = 0.0
        l = grifo.twitterCollection.length + grifo.githubCollection.length + grifo.blogCollection.length
        count = 0.0
        round = 0.0

        while i < l
            addLine = true

            switch count
                when 0.0
                    if round < grifo.twitterCollection.length
                        @appendTwitterView grifo.twitterCollection.at round
                    else
                        addLine = false
                        i--

                when 1.0
                    if round < grifo.githubCollection.length
                        @appendGithubView grifo.githubCollection.at round
                    else
                        addLine = false
                        i--

                when 2.0
                    if round < grifo.blogCollection.length
                        @appendBlogView grifo.blogCollection.at round
                    else
                        addLine = false
                        i--

            count++
            if count == 3.0
                count = 0.0
                round++
            i++

            if addLine && i < l
                @appendWordLine()


        # MEDIA

        i = 0.0
        l = grifo.youtubeCollection.length + grifo.flickrCollection.length
        count = 0.0
        round = 0.0

        while i < l
            switch count
                when 0.0
                    if round < grifo.youtubeCollection.length
                        @appendYoutubeView grifo.youtubeCollection.at round
                    else
                        i--

                when 1.0
                    if round < grifo.flickrCollection.length
                        @appendFlickrView grifo.flickrCollection.at round
                    else
                        i--

            count++
            if count == 2.0
                count = 0.0
                round++
            i++

        $( '#media-grid', @$el ).isotope
            itemSelector     : '.media-stream-item'
            resizable        : 'false'
            masonry          : { columnWidth : 1 }
            animationEngine  : 'jquery'
            animationOptions : { queue : false, duration : 0, easing : 'easeOutExpo' }

        return @


    appendWordLine: () =>

        wordLineView = new WordStreamLineView()
        $('#word-grid', @$el).append wordLineView.render().el
        @wordItemList[ @wordItemList.length ] = wordLineView


    appendTwitterView: ( model_ ) =>

        twitterView = new TwitterView  {model: model_}
        $('#word-grid', @$el).append twitterView.render().el
        @wordItemList[ @wordItemList.length ] = twitterView


    appendGithubView: ( model_ ) =>

        githubView = new GithubView  {model: model_}
        $('#word-grid', @$el).append githubView.render().el
        @wordItemList[ @wordItemList.length ] = githubView


    appendBlogView: ( model_ ) =>

        blogView = new BlogView  {model: model_}
        $('#word-grid', @$el).append blogView.render().el
        @wordItemList[ @wordItemList.length ] = blogView


    appendYoutubeView: ( model_ ) =>

        youtubeView = new YoutubeView  {model: model_}
        $('#media-grid', @$el).append youtubeView.render().el
        @mediaItemList[ @mediaItemList.length ] = youtubeView


    appendFlickrView: ( model_ ) =>

        flickrView = new FlickrView  {model: model_}
        $('#media-grid', @$el).append flickrView.render().el
        @mediaItemList[ @mediaItemList.length ] = flickrView


    show: ( delay_ = 0.0, animate_ = true )->

        @wordItemList = []
        @mediaItemList = []
        @removeChildren()

        super.show( delay_, animate_ )
        @render()

        if @wordItemList
            for wordItemView in @wordItemList
                wordItemView.show delay_
                delay_ += 25.0

        delay_ = 0.0

        if @mediaItemList
            for mediaItemView in @mediaItemList
                mediaItemView.show delay_
                delay_ += 50.0


    hide: ()->

        @wordItemList = []
        @mediaItemList = []
        @removeChildren()
        super.hide()