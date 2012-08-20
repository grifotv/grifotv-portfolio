class TagView extends AbstractView

    useLongTitle  : true
    tagName       : 'a'
    hasTransition : false

    events :
        'click' : 'onClick'

    init : ->

        @model.bind 'change'  , @render, @
        @model.bind 'destroy' , @remove, @

    render : =>

        if @useLongTitle

            label = @model.get 'long_title'

        else

            label = @model.get 'short_title'

        if @model.get 'selected'

            $( @el ).removeClass 'tag'
            $( @el ).addClass 'tagSelected'
            # label += '&nbsp;<font color='#c0e2f2'>|</font>&nbsp;x'

        else

            $( @el ).addClass 'tag'
            $( @el ).removeClass 'tagSelected'

        $( @el ).html label
        $( @el ).attr 'href', '#'
        
        return @

    remove : =>

        $( @el ).remove()

    onClick : ( e_ )=>

        e_.preventDefault()
        
        if @model.get 'selected'
            grifo.router.navigateToTag()
        else
            grifo.router.navigateToTag @model.get( 'id' )