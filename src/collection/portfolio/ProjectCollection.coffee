class ProjectCollection extends Backbone.Collection

    model : ProjectModel

    parseTags : ()->

        i = 0
        for projectModel in @models

            # set index
            projectModel.set
                index : i
            i++

            # display tags
            display_tags_id    = projectModel.get( 'display_tags_id' )
            display_tags_model = []

            for tagId in display_tags_id
                display_tags_model[ display_tags_model.length ] = grifo.tagGroupCollection.getTagModel( tagId )
            
            # all tags
            tags_id    = projectModel.get( 'tags_id' )
            tags_model = []

            for tagId in tags_id
                tags_model[ tags_model.length ] = grifo.tagGroupCollection.getTagModel( tagId )

            # set models
            projectModel.set
                'display_tags_model': display_tags_model
                'tags_model'        : tags_model

    parseProfiles : ()->

        for projectModel in @models
            creditGroupCollection = projectModel.get( 'credit_group_collection' )

            for creditGroupModel in creditGroupCollection.models
                creditCollection = creditGroupModel.get( 'credit_collection' )

                for creditModel in creditCollection.models
                    
                    # profiles
                    profiles_id    = creditModel.get( 'profiles_id' )
                    profiles_model = []

                    for profileId in profiles_id
                        profiles_model[ profiles_model.length ] = grifo.profileCollection.get( profileId )

                    # set models
                    creditModel.set
                        'profiles_model': profiles_model