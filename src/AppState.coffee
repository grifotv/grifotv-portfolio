class AppState

    isTablet             : (/ipad|android 3|sch-i800|playbook|tablet|kindle|gt-p1000|sgh-t849|shw-m180s|a510|a511|a100|dell streak|silk/i.test(navigator.userAgent.toLowerCase()))
    isMobile             : (/iphone|ipod|android|blackberry|opera mini|opera mobi|skyfire|maemo|windows phone|palm|iemobile|symbian|symbianos|fennec/i.test(navigator.userAgent.toLowerCase()))
    isDesktop            : false
    
    currentPage          : null
    currentSubPage       : null
    currentSubSubPage    : null

    previousPage         : null
    previousSubPage      : null
    previousSubSubPage   : null


    constructor : ->

        @isDesktop = not @isTablet and not @isMobile

        $html = $ 'html'

        if @isMobile
            $html.addClass 'mobile'

        if @isDesktop
            $html.addClass 'desktop'

        if @isTablet
            $html.addClass 'tablet'

        if /MSIE/.test navigator.userAgent
            $html.addClass( 'ie' )

        test  = new RegExp "MSIE ([0-9]{1,}[\.0-9]{0,})"

        if test.exec navigator.userAgent
            
            ieVersion = parseFloat RegExp.$1
            $html.addClass 'ie-' + ieVersion

            if ieVersion <= 8
                $html.addClass 'old-ie'
            else
                $html.addClass 'new-ie'
        else
            
            $html.addClass( 'non-ie' )