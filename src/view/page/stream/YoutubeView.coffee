class YoutubeView extends Backbone.View

    className : 'media-stream-item size1of3'
    template  : null

    render : =>
    
        if @model.get( 'is_portrait' )

            $( @el ).addClass 'video-item-portrait'

            @template = _.template $( '#template_youtube_portrait' ).html()

            $( @el ).append @template
                id     : @model.get 'id'
                image  : @model.get 'thumbnail_medium'
                date   : @model.get 'date'
                url    : @model.get 'url'
        else

            $( @el ).addClass 'video-item-landscape'

            @template = _.template $( '#template_youtube_landscape' ).html()

            $( @el ).append @template
                id     : @model.get 'id'
                image  : @model.get 'thumbnail_medium'
                date   : @model.get 'date'
                url    : @model.get 'url'
        
        return @