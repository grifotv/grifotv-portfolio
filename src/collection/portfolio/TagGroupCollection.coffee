class TagGroupCollection extends Backbone.Collection

    model : TagGroupModel

    select : ( id_ )->

        for tagGroupModel in @models
            tagGroupModel.get( 'tags_collection' ).select id_

    getTagModel : ( tagId_ )->

        for tagGroupModel in @models

            tagModel =  tagGroupModel.get( 'tags_collection' ).get( tagId_ )
        
            if tagModel
            
                return tagModel