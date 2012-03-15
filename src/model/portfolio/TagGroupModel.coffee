class TagGroupModel extends Backbone.Model

    defaults :

        id              : ''
        label           : ''
        tags_collection : null # new TagCollection()

    initialize : ->

        @set
            tags_collection : new TagCollection @get( 'tags_collection' )