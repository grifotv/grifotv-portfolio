class CreditGroupView extends Backbone.View

    className : 'new-row'

    initialize: ->

        @template = _.template $( '#template_credit_group' ).html()

    render : =>

        $( @el ).append @template
            label : @model.get 'label'

        for creditModel in @model.get( 'credit_collection' ).models
            @appendCreditView creditModel

        return @

    appendCreditView : ( model_ ) =>

        creditView = new CreditView  { model : model_ }
        $( $( '.date', @el )[0] ).append creditView.render().el