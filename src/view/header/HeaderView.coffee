class HeaderView extends AbstractView

    @EVENT_ARROW_TOP_CLICKED : 'EVENT_ARROW_TOP_CLICKED'

    id                       : 'container-header'

    navView                  : null
    shareView                : null


    events:
        'click #arrow-top'  : 'onArrowTopClick'


    init: ->

        # start nav
        @navView   = new NavView()

        # start share
        @shareView = new ShareView()


    onArrowTopClick: ( e_ )=>

        e_.preventDefault()
        @trigger HeaderView.EVENT_ARROW_TOP_CLICKED


    selectItem: ( pageId_ ) ->

        @navView.selectItem pageId_


    setTop: ( value_ )->

        @$el.css( 'top', value_ )


    setLeftOpacity: ( value_ )->
    
        $( '#header-left' ).css( 'opacity', value_ )