class TagCollection extends Backbone.Collection

    model : TagModel

    select : ( id_ )->

        for tagModel in @models

            if tagModel.get( 'id' ) == id_

                tagModel.set { selected: true }

            else

                tagModel.set { selected: false }