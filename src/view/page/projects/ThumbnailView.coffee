class ThumbnailView extends AbstractView

    className : 'grid-item'
    template  : null
    model     : null

    events :
        'click .grid-item-image' : 'onClick'
        'click .grid-item-name'  : 'onClick'
        'click .grid-item-over'  : 'onClick'
        'mouseenter'             : 'onRollOver'
        'mouseleave'             : 'onRollOut'


    init : ->
    
        @template = _.template $( '#template_thumbnail' ).html()


    render : =>

        @$el.addClass @model.get( 'tile_size' )
        @$el.addClass @model.get( 'tags' ).join( ' ' )

        @$el.append @template
            image : @model.get( 'thumbnail' )
            title : @model.get( 'short_title' )

        $( '.grid-item-image', @$el ).addClass @model.get( 'tile_size' )
        $( '.grid-item-over', @$el ).addClass @model.get( 'tile_size' )

        $( '.grid-item-over', @$el ).css 'opacity', 0.0

        for tagId in @model.get( 'display_tags' )
            tagModel = grifo.tagCollection.get tagId
            @appendTagView tagModel

        return @


    appendTagView : ( model_ ) =>

        tagView = new TagView  { model: model_ }
        tagView.useLongTitle = false
        
        $( '.grid-item-tags', @$el ).append tagView.render().el
        $( '.grid-item-tags', @$el ).append ' '


    show: ( delay_ = 0.0, animate_ = true )->

        super.show( delay_, animate_ )
        return ( @$el.attr( 'class' ).indexOf( 'isotope-hidden' ) == -1 )
    

    onClick : ( e_ )=>

        e_.preventDefault()
        grifo.appRouter.navigateToProject @model.get('id')


    onRollOver : ( e_ )=>

        $( '.grid-item-over', @$el ).stop().animate opacity: 0.2, 200
        $( '.grid-item-name', @$el ).addClass 'over'


    onRollOut : ( e_ )=>

        $( '.grid-item-over', @$el ).stop().animate opacity: 0.0, 200
        $( '.grid-item-name', @$el ).removeClass 'over'
