class GithubCollection extends Backbone.Collection

    model : GithubModel

    parse : ( response_ ) ->

        modelsArray = []
        
        for itemEntry in response_

            itemPublic = itemEntry['public']

            itemType = itemEntry['type']
            itemDate = Utils.relativeTime( itemEntry['created_at'] )
            itemUrl  = itemEntry['url']
            itemText = null

            switch itemType
            
                when 'PushEvent'

                    if itemEntry['repository']
                        if !itemEntry['repository']['private']
                            itemText = 'pushed to <a target="_blank" href="' + itemUrl + '">' + itemEntry['repository']['name'] + '</a>'

                when 'WatchEvent'

                    itemText = itemEntry['payload']['action'] + ' watching <a target="_blank" href="' + itemUrl + '">' + itemEntry['repository']['name'] + '</a>'

                when 'CreateEvent'

                    if itemEntry['repository']
                        if !itemEntry['repository']['private']
                            itemText = 'created <a target="_blank" href="' + itemUrl + '">' + itemEntry['repository']['name'] + '</a>'

                when 'ForkEvent'

                    if itemEntry['repository']
                        if !itemEntry['repository']['private']
                            itemText = 'forked <a target="_blank" href="' + itemUrl + '">' + itemEntry['repository']['name'] + '</a>'

                when 'FollowEvent'

                    itemText = 'started following <a target="_blank" href="' + itemUrl + '">' + itemEntry['payload']['target']['login'] + '</a>'
            ###
                when 'CommitCommentEvent'
                    itemText = ''
                when 'PullRequestEvent'
                    itemText = ''
                when 'GistEvent'
                    itemText = ''
                when 'DownloadEvent'
                    itemText = ''
                when 'IssueCommentEvent'
                    itemText = ''
                when 'GollumEvent'
                    itemText = ''
                when 'DeleteEvent'
                    itemText = ''
                when 'TeamAddEvent'
                    itemText = ''
                when 'PublicEvent'
                    itemText = ''
                when 'MemberEvent'
                    itemText = ''
                when 'IssuesEvent'
                    itemText = ''
                when 'ForkApplyEvent'
                    itemText = ''
                when 'ForkApplyEvent'
                    itemText = ''
            ###

            #GITHUB_MAX_RESULTS
                
            if itemText
                itemModel  = new GithubModel
                    type : itemType
                    text : itemText
                    date : itemDate
                    url  : itemUrl

                modelsArray.push itemModel

                if modelsArray.length == grifo.appConfig.MAX_RESULTS_GITHUB
                    return modelsArray

        return modelsArray