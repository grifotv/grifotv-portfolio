class ShareView extends AbstractView

    id            : 'header-right'
    hasTransition : false

    init: ->
        $( '#share-twitter' ).click @onClick
        $( '#share-facebook' ).click @onClick

    onClick: ( e_ )=>
        e_.preventDefault()
        network = $( e_.currentTarget ).attr( 'id' )

        switch network
            when 'share-facebook' then url = grifo.appConfig.SHARE_URL_FACEBOOK.replace( '{URL}' , encodeURIComponent( grifo.labelCollection.get( 'share-url' ).get( 'label' ) ) )
            when 'share-twitter'  then url = grifo.appConfig.SHARE_URL_TWITTER.replace( '{TEXT}' , encodeURIComponent( grifo.labelCollection.get( 'share-tweet' ).get( 'label' ) ) )

        if url
            window.open url