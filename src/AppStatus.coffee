class AppStatus

    isIpad               : false
    
    currentPage          : null
    currentSubPage       : null
    currentSubSubPage    : null

    previousPage         : null
    previousSubPage      : null
    previousSubSubPage   : null


    constructor : ->

        # check devide type
        if ( navigator.userAgent.match( /iPad/i ) != null )
        
            @isIpad = true