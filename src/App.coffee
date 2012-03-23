# on ready
$ ->

	# only global property
	window.grifo =

		# app config
		appConfig                 : null

		# app status
		appStatus                 : null

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
		projectCollection         : null

		# stream collections
		youtubeCollection         : null
		twitterCollection         : null
		githubCollection          : null
		flickrCollection          : null
		blogCollection            : null


	# start app
	grifo.appConfig = new AppConfig()
	grifo.appStatus = new AppStatus()
	grifo.appView   = new AppView()
	
	
	# on data loaded
	grifo.appView.on grifo.appView.EVENT_DATA_LOADED, ->

		# start router
		grifo.appRouter = new AppRouter()

		# bind router event to view callback
		grifo.appRouter.on grifo.appRouter.EVENT_HASH_CHANGED , grifo.appView.onHashChanged

		# start history
		Backbone.history.start() 
		#Backbone.history.start( { pushState: true, root: '/grifotv-portfolio/' } )

