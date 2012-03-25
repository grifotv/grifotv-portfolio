class CreditGroupView extends Backbone.View

    className : 'new-row'

    initialize: ->

        @template = _.template $( '#template_credit_group' ).html()

    render : =>

        $( @el ).append @template
            label : @model.get 'label'

        for creditModel in grifo.creditCollection.models
            if creditModel.get( 'group' ) == @model.get( 'id' )
                @appendCreditView creditModel

        return @

    appendCreditView : ( model_ ) =>

        creditView = new CreditView  { model : model_ }
        $( $( '.date', @el )[0] ).append creditView.render().el