class StreamPageView extends AbstractPageView

    id            : 'stream-page'
    template      : null
    wordItemList  : []
    mediaItemList : []


    init : ->
    
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
    
        $('#word-grid', @$el).append _.template $( '#template_stream_word_line' ).html()


    appendTwitterView: ( model_ ) =>

        twitterView = new TwitterView  {model: model_}
        $('#word-grid', @$el).append twitterView.render().el


    appendGithubView: ( model_ ) =>

        githubView = new GithubView  {model: model_}
        $('#word-grid', @$el).append githubView.render().el


    appendBlogView: ( model_ ) =>

        blogView = new BlogView  {model: model_}
        $('#word-grid', @$el).append blogView.render().el


    appendYoutubeView: ( model_ ) =>

        youtubeView = new YoutubeView  {model: model_}
        $('#media-grid', @$el).append youtubeView.render().el


    appendFlickrView: ( model_ ) =>

        flickrView = new FlickrView  {model: model_}
        $('#media-grid', @$el).append flickrView.render().el


    show: ( delay_ = 0.0, animate_ = true )->

        @removeChildren()
        super.show( delay_, animate_ )
        @render()


    hide: ()->

        wordItemList = []
        mediaItemList = []
        @removeChildren()
        super.hide()