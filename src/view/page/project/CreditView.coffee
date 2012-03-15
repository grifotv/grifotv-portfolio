class CreditView extends Backbone.View

    tagName : 'p'

    initialize : ->

        @template = _.template $( '#template_credit' ).html()

    render : =>

        if @model.get( 'label' ).length > 0

            $( @el ).append @template
               label : @model.get 'label'

        i = 0.0
        l = @model.get( 'profiles_model' ).length

        for profileModel in @model.get( 'profiles_model' )

            @appendProfileView profileModel
            i++
            $( @el ).append ', ' if i < l

        return @

    appendProfileView : ( model_ ) =>

        profileView = new ProfileView  { model : model_ }
        $( @el ).append profileView.render().el