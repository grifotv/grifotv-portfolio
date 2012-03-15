class ExperienceCollection extends Backbone.Collection

    model : ExperienceModel

    parse : ( response_ ) ->

        modelsArray = []

        for itemEntry in response_[ 'feed' ][ 'entry' ]

            itemModel  = new ExperienceModel
                left     : itemEntry[ 'gsx$left' ][ '$t' ]
                right    : itemEntry[ 'gsx$right' ][ '$t' ]
                plus_url : itemEntry[ 'gsx$plusurl' ][ '$t' ]
                group    : itemEntry[ 'gsx$group' ][ '$t' ]

            modelsArray.push itemModel

        return modelsArray