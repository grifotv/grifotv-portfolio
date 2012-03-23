class ProjectCollection extends Backbone.Collection

    model : ProjectModel
    
    parseProfiles : ()->

        i = 0
        for projectModel in @models

            # set index
            projectModel.set
                index : i
            i++

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