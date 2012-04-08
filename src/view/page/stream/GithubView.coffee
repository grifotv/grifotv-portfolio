class GithubView extends AbstractView

    className     : 'word-stream-item size1of3'
    template      : null


    init: ->

        @template = _.template $( '#template_github' ).html()


    render : =>

        $( @el ).append @template
            label  : @model.get 'text'
            date   : @model.get 'date'
            url    : @model.get 'url'
        
        return @