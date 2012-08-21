# on ready
$ ->

    # only global property
    window.grifo =

        # app state
        state                     : null

        # app config
        config                    : null

        # app service
        service                   : null

        # app view
        view                      : null

        # app router
        router                    : null

        # portfolio collections
        labelCollection           : null
        brandCollection           : null    
        profileCollection         : null
        experienceCollection      : null
        experienceGroupCollection : null
        tagGroupCollection        : null
        tagCollection             : null
        creditGroupCollection     : null
        creditCollection          : null
        projectCollection         : null

        # stream collections
        youtubeCollection         : null
        twitterCollection         : null
        githubCollection          : null
        flickrCollection          : null
        blogCollection            : null
    
        # ints
        loaded                    : 0.0
        numLoaded                 : 2.0

        # callback
        onLoaded                  : null


    # start app
    grifo.state   = new AppState()
    grifo.config  = new AppConfig()
    grifo.service = new AppService()
    grifo.view    = new AppView()


    # define onLoaded callback
    grifo.onLoaded = ->

        grifo.loaded++
        return if grifo.loaded < grifo.numLoaded

        # start view
        grifo.view.start()

        # start router
        grifo.router = new AppRouter()

        # bind router event to view callback
        grifo.router.on AppRouter.EVENT_HASH_CHANGED , grifo.view.onHashChanged

        # bootstrap
        grifo.router.start()
    

    # bind on loaded events to single callback
    grifo.service.on AppService.EVENT_LOADED, grifo.onLoaded
    grifo.view.on    AppView.EVENT_LOADED,    grifo.onLoaded

    # preload data 
    grifo.service.start()


# adding fake console to browsers that doesn't have it
unless window[ 'console' ]
    window.console =
        log: ( a ) ->
            return a
        dir: ( a ) ->
            return a
