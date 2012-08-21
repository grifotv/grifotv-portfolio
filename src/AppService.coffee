class AppService

    # events
    @EVENT_LOADED : 'EVENT_LOADED'
    
    # ints
    loaded        : 0.0
    numLoaded     : 14.0 # total of 15


    constructor :->
         
         _.extend @, Backbone.Events


    start : ->

        # PORTFOLIO COLLECTIONS

        # 1 - load projects
        grifo.projectCollection     = new ProjectCollection
        grifo.projectCollection.url = grifo.config.URL_PROJECTS
        grifo.projectCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 2 - load tags
        grifo.tagCollection     = new TagCollection()
        grifo.tagCollection.url = grifo.config.URL_TAGS
        grifo.tagCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 3 - load tag groups
        grifo.tagGroupCollection     = new TagGroupCollection()
        grifo.tagGroupCollection.url = grifo.config.URL_TAG_GROUPS
        grifo.tagGroupCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 4 - load credits
        grifo.creditCollection     = new CreditCollection()
        grifo.creditCollection.url = grifo.config.URL_CREDITS
        grifo.creditCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 5 - load credit groups
        grifo.creditGroupCollection     = new CreditGroupCollection()
        grifo.creditGroupCollection.url = grifo.config.URL_CREDIT_GROUPS
        grifo.creditGroupCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 6 - load experiences
        grifo.experienceCollection     = new ExperienceCollection()
        grifo.experienceCollection.url = grifo.config.URL_EXPERIENCES
        grifo.experienceCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 7 - load experience groups
        grifo.experienceGroupCollection     = new ExperienceGroupCollection()
        grifo.experienceGroupCollection.url = grifo.config.URL_EXPERIENCE_GROUPS
        grifo.experienceGroupCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 8 - load profiles
        grifo.profileCollection     = new ProfileCollection()
        grifo.profileCollection.url = grifo.config.URL_PROFILES
        grifo.profileCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 9 - load brands
        grifo.brandCollection     = new BrandCollection()
        grifo.brandCollection.url = grifo.config.URL_BRANDS
        grifo.brandCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 10 - load labels
        grifo.labelCollection     = new LabelCollection()
        grifo.labelCollection.url = grifo.config.URL_LABELS
        grifo.labelCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()


        # STREAM COLLECTIONS

        # 11 - load youtube
        grifo.youtubeCollection     = new YoutubeCollection()
        grifo.youtubeCollection.url = grifo.config.URL_YOUTUBE
        grifo.youtubeCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 12 - load twitter
        grifo.twitterCollection     = new TwitterCollection()
        grifo.twitterCollection.url = grifo.config.URL_TWITTER
        grifo.twitterCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 13 - load github
        grifo.githubCollection     = new GithubCollection()
        grifo.githubCollection.url = grifo.config.URL_GITHUB
        grifo.githubCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 14 - load flickr
        grifo.flickrCollection     = new FlickrCollection()
        grifo.flickrCollection.url = grifo.config.URL_FLICKR
        grifo.flickrCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 15 - load blog
        grifo.blogCollection     = new BlogCollection()
        grifo.blogCollection.url = grifo.config.URL_BLOG
        grifo.blogCollection.load()


    onLoad: =>

        @loaded++

        if @loaded == @numLoaded
            @trigger AppService.EVENT_LOADED
