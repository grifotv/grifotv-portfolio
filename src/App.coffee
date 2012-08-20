# on ready
$ ->

	# only global property
	window.grifo =

		# app state
		state                     : null

		# app config
		config                    : null

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


	# start app
	grifo.state  = new AppState()
	grifo.config = new AppConfig()
	grifo.view   = new AppView()
	
	
	# on data loaded
	grifo.view.on AppView.EVENT_DATA_LOADED, ->

		# start router
		grifo.router = new AppRouter()

		# bind router event to view callback
		grifo.router.on AppRouter.EVENT_HASH_CHANGED , grifo.view.onHashChanged

		# bootstrap
		grifo.router.start()


# adding fake console to browsers that doesn't have it
unless window[ 'console' ]
    window.console =
        log: ( a ) ->
            return a
        dir: ( a ) ->
            return a
