class TwitterView extends Backbone.View

    className : 'word-stream-item size1of3'
    template  : null


    initialize: ->

        @template = _.template $( '#template_twitter' ).html()


    render : =>

        $( @el ).append @template
            label  : @model.get 'text'
            date   : @model.get 'date'
            url    : @model.get 'url'
        
        return @