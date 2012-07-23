class AppView extends Backbone.View

    # events
    @EVENT_DATA_LOADED   : 'EVENT_DATA_LOADED'
    @EVENT_REALIGNED     : 'EVENT_REALIGNED'

    # el
    el                   : 'body'
    $el                  : null
    $window              : null
    template             : null
    
    # ints
    loaded               : 0.0
    numLoaded            : 15.0 # total of 16

    # header views
    headerView           : null
    headerBgView         : null

    # page views
    tagsPageView         : null
    projectsPageView     : null
    projectPageView      : null
    streamPageView       : null
    aboutPageView        : null


    initialize: ->

        @$el      = $( @el )
        @$window  = $( window )
        @template = _.template $( '#template_app' ).html()

        @$window.scroll @realign
        @$window.resize @realign

        # 1 - load dom
        @$window.load   @onLoad

        @loadData()


    loadData: ->

        # PORTFOLIO COLLECTIONS

        # 2 - load projects
        grifo.projectCollection     = new ProjectCollection
        grifo.projectCollection.url = grifo.appConfig.URL_PROJECTS
        grifo.projectCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 3 - load tags
        grifo.tagCollection     = new TagCollection()
        grifo.tagCollection.url = grifo.appConfig.URL_TAGS
        grifo.tagCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 4 - load tag groups
        grifo.tagGroupCollection     = new TagGroupCollection()
        grifo.tagGroupCollection.url = grifo.appConfig.URL_TAG_GROUPS
        grifo.tagGroupCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 5 - load credits
        grifo.creditCollection     = new CreditCollection()
        grifo.creditCollection.url = grifo.appConfig.URL_CREDITS
        grifo.creditCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 6 - load credit groups
        grifo.creditGroupCollection     = new CreditGroupCollection()
        grifo.creditGroupCollection.url = grifo.appConfig.URL_CREDIT_GROUPS
        grifo.creditGroupCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 7 - load experiences
        grifo.experienceCollection     = new ExperienceCollection()
        grifo.experienceCollection.url = grifo.appConfig.URL_EXPERIENCES
        grifo.experienceCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 8 - load experience groups
        grifo.experienceGroupCollection     = new ExperienceGroupCollection()
        grifo.experienceGroupCollection.url = grifo.appConfig.URL_EXPERIENCE_GROUPS
        grifo.experienceGroupCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 9 - load profiles
        grifo.profileCollection     = new ProfileCollection()
        grifo.profileCollection.url = grifo.appConfig.URL_PROFILES
        grifo.profileCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 10 - load brands
        grifo.brandCollection     = new BrandCollection()
        grifo.brandCollection.url = grifo.appConfig.URL_BRANDS
        grifo.brandCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 11 - load labels
        grifo.labelCollection     = new LabelCollection()
        grifo.labelCollection.url = grifo.appConfig.URL_LABELS
        grifo.labelCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()


        # STREAM COLLECTIONS

        # 12 - load youtube
        grifo.youtubeCollection     = new YoutubeCollection()
        grifo.youtubeCollection.url = grifo.appConfig.URL_YOUTUBE
        grifo.youtubeCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 13 - load twitter
        grifo.twitterCollection     = new TwitterCollection()
        grifo.twitterCollection.url = grifo.appConfig.URL_TWITTER
        grifo.twitterCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 14 - load github
        grifo.githubCollection     = new GithubCollection()
        grifo.githubCollection.url = grifo.appConfig.URL_GITHUB
        grifo.githubCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 15 - load flickr
        grifo.flickrCollection     = new FlickrCollection()
        grifo.flickrCollection.url = grifo.appConfig.URL_FLICKR
        grifo.flickrCollection.fetch
            success : ( model_, response_ ) => @onLoad()
            error   : ( model_, response_ ) => @onLoad()

        # 16 - load blog
        grifo.blogCollection     = new BlogCollection()
        grifo.blogCollection.url = grifo.appConfig.URL_BLOG
        grifo.blogCollection.load()


    onLoad: =>

        @loaded++
        @onLoadComplete() if @loaded == @numLoaded
               

    onLoadComplete: ->

        @render()
        @show()

        @trigger AppView.EVENT_DATA_LOADED


    render: =>

        # add template
        @$el.append @template
            footer1_title : grifo.labelCollection.get( 'footer1-title' ).get( 'label' )
            footer1_copy  : grifo.labelCollection.get( 'footer1-copy' ).get( 'label' )
            footer2_title : grifo.labelCollection.get( 'footer2-title' ).get( 'label' )
            footer2_copy  : grifo.labelCollection.get( 'footer2-copy' ).get( 'label' )
            footer3_title : grifo.labelCollection.get( 'footer3-title' ).get( 'label' )
            footer3_copy  : grifo.labelCollection.get( 'footer3-copy' ).get( 'label' )

        # HEADER

        # init header
        @headerView        = new HeaderView()
        @headerView.on HeaderView.EVENT_ARROW_TOP_CLICKED, @scrollToTop

        # init header bg
        @headerBgView      = new HeaderBgView()


        # PAGES

        # init tags page
        @tagsPageView     = new TagsPageView()

        # init projects page
        @projectsPageView = new ProjectsPageView()

        # init project page
        @projectPageView  = new ProjectPageView()

        # init stream page
        @streamPageView   = new StreamPageView()

        # init about page
        @aboutPageView    = new AboutPageView()

        # realign
        @realign()

        return @
 

    show: =>

        @headerView.show()
        @headerBgView.show()


    onHashChanged: ( id_, subId_, subSubId_ )=>

        if id_ == @currentPage && subId_ == @currentSubPage && subSubId_ == @currentSubSubPage
            return

        # store in status
        grifo.appState.previousPage       = grifo.appState.currentPage
        grifo.appState.previousSubPage    = grifo.appState.currentSubPage
        grifo.appState.previousSubSubPage = grifo.appState.currentSubSubPage

        grifo.appState.currentPage        = id_
        grifo.appState.currentSubPage     = subId_
        grifo.appState.currentSubSubPage  = subSubId_

        # select item in header
        @headerView.selectItem id_

        top = 0.0

        switch id_

            when grifo.appConfig.PAGE_PROJECTS
                # hide
                @aboutPageView.hide()
                @streamPageView.hide()
                
                grifo.tagCollection.select ''
                @tagsPageView.hide()

                if subId_
                    # hide
                    @projectsPageView.hide()

                    # show
                    @projectPageView.show()
                    top = grifo.appConfig.SNAP_Y_HEADER_BG + 29.0
                else
                    # hide
                    @projectPageView.hide()

                    # show
                    @projectsPageView.filter()
                    @projectsPageView.show()

            when grifo.appConfig.PAGE_TAGS
                # hide
                @aboutPageView.hide()
                @projectPageView.hide()
                @streamPageView.hide()

                # show
                @projectsPageView.filter subId_
                @projectsPageView.show()

                grifo.tagCollection.select subId_
                @tagsPageView.show()

                if subId_
                    top = grifo.appConfig.SNAP_Y_HEADER_BG

            when grifo.appConfig.PAGE_STREAM
                # hide
                @tagsPageView.hide()
                @projectsPageView.hide()
                @projectPageView.hide()
                @aboutPageView.hide()

                # show
                @streamPageView.show()

            when grifo.appConfig.PAGE_ABOUT
                # hide
                @tagsPageView.hide()
                @projectsPageView.hide()
                @projectPageView.hide()
                @streamPageView.hide()

                # show
                @aboutPageView.show()

        @scrollToTop top


    scrollToTop: ( y_ = -10.0 )->

        difY = ( y_ - window.pageYOffset ) * 2.0
        if difY < 0
            difY*=-1

        if difY > 1000
            difY = 1000

        $( 'html,body' ).stop().animate { scrollTop: y_ } , { duration: difY, easing: 'easeOutExpo' }

    realign: =>
        if !@headerView || !@headerBgView
            return

        # calculate top
        windowTop = headerTop = headerBgTop = - @$window.scrollTop()
        
        if windowTop < -grifo.appConfig.SNAP_Y_HEADER_BG
            headerBgTop = - grifo.appConfig.SNAP_Y_HEADER_BG

        if windowTop < -grifo.appConfig.SNAP_Y_HEADER
            headerTop   = - grifo.appConfig.SNAP_Y_HEADER 

        # set top
        @headerView.setTop       headerTop
        @headerBgView.setTop     headerBgTop

        # calculate opacity
        headerBgOpacity   = headerBgTop / - grifo.appConfig.SNAP_Y_HEADER_BG
        headerLeftOpacity = ( headerTop - headerBgTop ) / ( grifo.appConfig.SNAP_Y_HEADER_BG - grifo.appConfig.SNAP_Y_HEADER )

        # set opacity
        @headerView.setLeftOpacity headerLeftOpacity
        @headerBgView.setOpacity headerBgOpacity

        # done
        @trigger AppView.EVENT_REALIGNED

            
            
