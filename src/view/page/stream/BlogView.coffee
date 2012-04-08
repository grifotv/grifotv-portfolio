class BlogView extends AbstractView

    className     : 'word-stream-item size1of3'
    template      : null


    init: ->

        @template = _.template $( '#template_blog' ).html()


    render : =>

        $( @el ).append @template
            title        : @model.get 'title'
            description  : @model.get 'description'
            date         : @model.get 'date'
            url          : @model.get 'url'
        
        return @