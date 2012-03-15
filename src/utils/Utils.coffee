Utils =

    relativeTime : ( timeValue_ ) ->

        msPerMinute = 60 * 1000
        msPerHour   = msPerMinute * 60
        msPerDay    = msPerHour * 24
        msPerMonth  = msPerDay * 30
        msPerYear   = msPerDay * 365

        parsedDate  = Date.parse( timeValue_ )
        relativeTo  = new Date()

        elapsed     = relativeTo.getTime() - parsedDate

        if ( elapsed < msPerMinute )
            return 'less than a minute ago'
        else if ( elapsed < msPerHour )
            minutes = Math.round( elapsed / msPerMinute )
            if minutes > 1.0
                return minutes + ' minutes ago'
            else
                return 'about a minute ago'
        else if ( elapsed < msPerDay )
            hours = Math.round( elapsed / msPerHour )
            if hours > 1.0
                return hours + ' hours ago'
            else
                return 'about an hour ago'
        else if ( elapsed < msPerMonth )
            days = Math.round( elapsed / msPerDay )
            if days > 1.0
                return days + ' days ago'
            else
                return '1 day ago'
        else if ( elapsed < msPerYear )
            months = Math.round( elapsed / msPerMonth )
            if months > 1.0
                return months + ' months ago'
            else
                return '1 month ago'
        else
            years = Math.round( elapsed / msPerYear )
            if years > 1.0
                return years + ' years ago'
            else
                return '1 year ago'
    

    linkifyUrls : ( value_ ) ->

        regexp = /((ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?)/gi
        return value_.replace( regexp , '<a target=\"_blank\" href=\"$1\">$1</a>' )


    linkifyUsers : ( value_ ) ->

        regexp = /[\@]+([A-Za-z0-9-_]+)/gi
        return value_.replace( regexp , '<a target=\"_blank\" href=\"http://twitter.com/$1\">@$1</a>' )


    linkifyHashes : ( value_ ) ->

        regexp = /[\#]+([A-Za-z0-9-_]+)/gi
        return value_.replace( regexp , ' <a target=\"_blank\" href=\"https://twitter.com/search?q=%23$1\">#$1</a> ' )


    getWidth : ( value_ ) ->

        # TODO: improve reg ex

        regexp = /(width=")+([0-9-_]+")/gi
        value_ = value_.match( regexp ).toString()
        value_ = value_.replace( 'width=', '' )
        value_ = value_.replace( '"', '' ).replace( '"', '' )
        return parseInt( value_ )


    getHeight : ( value_ ) ->

        # TODO: improve reg ex

        regexp = /(height=")+([0-9-_]+")/gi
        value_ = value_.match( regexp ).toString()
        value_ = value_.replace( 'height=', '' )
        value_ = value_.replace( '"', '' ).replace( '"', '' )
        return parseInt( value_ )

