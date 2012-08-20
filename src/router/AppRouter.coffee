class AppRouter extends Backbone.Router

    @EVENT_HASH_CHANGED                  : 'EVENT_HASH_CHANGED'
    
    currentPage                          : ''

    routes :

        ':id'                            : 'hashChanged'
        '/:id'                           : 'hashChanged'

        ':id/'                           : 'hashChanged'
        '/:id/'                          : 'hashChanged'

        ':id/:subid'                     : 'hashChanged'
        '/:id/:subid'                    : 'hashChanged'

        ':id/:subid/'                    : 'hashChanged'
        '/:id/:subid/'                   : 'hashChanged'

        ':id/:subid/:subsubid'           : 'hashChanged'
        '/:id/:subid/:subsubid'          : 'hashChanged'

        ':id/:subid/:subsubid/'          : 'hashChanged'
        '/:id/:subid/:subsubid/'         : 'hashChanged'

        ':id/:subid/:subsubid/*actions'  : 'hashChanged'
        '/:id/:subid/:subsubid/*actions' : 'hashChanged'

        '*actions'                       : 'default'


    start : ->
        
        # start history
        Backbone.history.start() 
        #Backbone.history.start( { pushState: true, root: '/grifotv-portfolio/' } )


    hashChanged : ( id_ = null, subId_ = null, subSubId_ = null, actions_ = null )->

        if id_ in [ grifo.config.PAGE_PROJECTS, grifo.config.PAGE_TAGS, grifo.config.PAGE_STREAM, grifo.config.PAGE_ABOUT ]
        
            # check current page
            currentPage = '/'
            if id_
                currentPage += id_
                currentPage += '/'
                if subId_
                    currentPage += subId_
                    currentPage += '/'
                    if subSubId_
                        currentPage += subSubId_
                        currentPage += '/'

            if currentPage != @currentPage
                @currentPage = currentPage

                # google analytics tracking
                _gaq.push ['_trackPageview', @currentPage]

                # trigger event
                @trigger AppRouter.EVENT_HASH_CHANGED, id_, subId_, subSubId_


    default : ( actions_ )->

        @hashChanged( grifo.config.PAGE_DEFAULT )


    navigateToProject : ( projectId_ = null )->

        hash = '//' + grifo.config.PAGE_PROJECTS + '/'
        
        if projectId_
            hash += projectId_ + '/'

        @navigate hash, {trigger: true}


    navigateToTag : ( tagId_ = null )->

        hash = '//' + grifo.config.PAGE_TAGS + '/'

        if tagId_
            hash += tagId_ + '/'

        @navigate hash, {trigger: true}