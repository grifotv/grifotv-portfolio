class AppRouter extends Backbone.Router

    EVENT_HASH_CHANGED                   : 'EVENT_HASH_CHANGED'

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


    hashChanged : ( id_ = null, subId_ = null, subSubId_ = null, actions_ = null )->

        if id_ in [ grifo.appConfig.PAGE_PROJECTS, grifo.appConfig.PAGE_TAGS, grifo.appConfig.PAGE_STREAM, grifo.appConfig.PAGE_ABOUT ]
        
            @trigger @EVENT_HASH_CHANGED, id_, subId_, subSubId_


    default : ( actions_ )->

        @hashChanged( grifo.appConfig.PAGE_DEFAULT )


    navigateToProject : ( projectId_ = null )->
        
        hash = '//' + grifo.appConfig.PAGE_PROJECTS + '/'
        
        if projectId_
            hash += projectId_ + '/'

        @navigate hash, {trigger: true}


    navigateToTag : ( tagId_ = null )->

        hash = '//' + grifo.appConfig.PAGE_TAGS + '/'

        if tagId_
            hash += tagId_ + '/'

        @navigate hash, {trigger: true}