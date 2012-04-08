class YoutubeView extends AbstractView

    className     : 'media-stream-item size1of3'
    template      : null


    init: ->

        if @model.get( 'is_portrait' )
            @template = _.template $( '#template_youtube_portrait' ).html()
        else
            @template = _.template $( '#template_youtube_landscape' ).html()

    render : =>

        $( @el ).append @template
            id     : @model.get 'id'
            image  : @model.get 'thumbnail_medium'
            date   : @model.get 'date'
            url    : @model.get 'url'
        
        return @