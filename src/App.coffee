# on ready
$ ->

	# only global property
	window.grifo =

		# app status
		appState                  : null

		# app config
		appConfig                 : null

		# app view
		appView                   : null

		# app router
		appRouter                 : null

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


	# start app
	grifo.appState  = new AppState()
	grifo.appConfig = new AppConfig()
	grifo.appView   = new AppView()
	
	
	# on data loaded
	grifo.appView.on AppView.EVENT_DATA_LOADED, ->

		# start router
		grifo.appRouter = new AppRouter()

		# bind router event to view callback
		grifo.appRouter.on AppRouter.EVENT_HASH_CHANGED , grifo.appView.onHashChanged

		# bootstrap
		grifo.appRouter.start()


# adding fake console to browsers that doesn't have it
unless window[ 'console' ]
    window.console =
        log: ( a ) ->
            return a
        dir: ( a ) ->
            return a
