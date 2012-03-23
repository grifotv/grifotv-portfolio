class ProjectModel extends Backbone.Model

    defaults :

        id                       : ''
        index                    : 0
        tile_size                : 'small'
        short_title              : ''
        long_title               : ''
        headline                 : ''
        thumbnails               : []
        url                      : ''
        video                    : ''
        credit_group_collection  : null # new CreditGroupCollection()
        copy                     : ''
        images                   : []
        tags_id                  : [] # array of tag id
        display_tags_id          : [] # array of tag id
        #tags_model               : [] # array of tag model
        #display_tags_model       : [] # array of tag model

    initialize : ->

        @set
            credit_group_collection : new CreditGroupCollection @get( 'credit_group_collection' )