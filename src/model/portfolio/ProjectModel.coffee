class ProjectModel extends Backbone.Model

    defaults :

        id                       : ''
        index                    : 0
        tile_size                : 'small' # small, medium, big
        short_title              : ''
        long_title               : ''
        headline                 : ''
        thumbnail                : ''
        url                      : ''
        video                    : ''
        copy                     : ''
        images                   : []
        tags                     : [] # array of tag id
        display_tags             : [] # array of tag id