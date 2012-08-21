class AppView extends Backbone.View

    # events
    @EVENT_LOADED        : 'EVENT_LOADED'
    @EVENT_REALIGNED     : 'EVENT_REALIGNED'

    # el
    el                   : 'body'
    $el                  : null
    $window              : null
    template             : null

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

        @$el         = $( @el )
        @$window     = $( window )
        @template    = _.template $( '#template_app' ).html()

        @$window.scroll @realign
        @$window.resize @realign

        # 1 - load dom
        @$window.load =>
            @trigger AppView.EVENT_LOADED
               

    start: ->

        @render()
        @show()


    render: =>

        # BG
        
        # remove bg if mobile
        if grifo.state.isMobile
            $('#draw').remove()
            $('#paperJs').remove()
            $('#bgJs').remove()


        # APP

        # add app template
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
        grifo.state.previousPage       = grifo.state.currentPage
        grifo.state.previousSubPage    = grifo.state.currentSubPage
        grifo.state.previousSubSubPage = grifo.state.currentSubSubPage

        grifo.state.currentPage        = id_
        grifo.state.currentSubPage     = subId_
        grifo.state.currentSubSubPage  = subSubId_

        # select item in header
        @headerView.selectItem id_

        top = 0.0

        switch id_

            when grifo.config.PAGE_PROJECTS
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
                    top = grifo.config.SNAP_Y_HEADER_BG + 29.0
                else
                    # hide
                    @projectPageView.hide()

                    # show
                    @projectsPageView.filter()
                    @projectsPageView.show()

            when grifo.config.PAGE_TAGS
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
                    top = grifo.config.SNAP_Y_HEADER_BG

            when grifo.config.PAGE_STREAM
                # hide
                @tagsPageView.hide()
                @projectsPageView.hide()
                @projectPageView.hide()
                @aboutPageView.hide()

                # show
                @streamPageView.show()

            when grifo.config.PAGE_ABOUT
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
        
        if windowTop < -grifo.config.SNAP_Y_HEADER_BG
            headerBgTop = - grifo.config.SNAP_Y_HEADER_BG

        if windowTop < -grifo.config.SNAP_Y_HEADER
            headerTop   = - grifo.config.SNAP_Y_HEADER 

        # set top
        @headerView.setTop       headerTop
        @headerBgView.setTop     headerBgTop

        # calculate opacity
        headerBgOpacity   = headerBgTop / - grifo.config.SNAP_Y_HEADER_BG
        headerLeftOpacity = ( headerTop - headerBgTop ) / ( grifo.config.SNAP_Y_HEADER_BG - grifo.config.SNAP_Y_HEADER )

        # set opacity
        @headerView.setLeftOpacity headerLeftOpacity
        @headerBgView.setOpacity headerBgOpacity

        # done
        @trigger AppView.EVENT_REALIGNED

            
            
