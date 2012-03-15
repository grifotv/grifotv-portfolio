class HeaderBgView extends AbstractView

    id        : 'container-header-bg'


    setTop: ( value_ )->

        @$el.css( 'top', value_ )


    setOpacity: ( value_ )->
    
        $( '#header-bar-bg' ).css( 'opacity', value_ )