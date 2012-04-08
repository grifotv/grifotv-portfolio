class CreditView extends AbstractView

    tagName       : 'p'
    hasTransition : false

    init : ->

        @template = _.template $( '#template_credit' ).html()

    render : =>

        if @model.get( 'label' ).length > 0

            $( @el ).append @template
               label : @model.get 'label'

        i = 0.0
        l = @model.get( 'profiles' ).length

        for profileId in @model.get( 'profiles' )
            profileModel = grifo.profileCollection.get( profileId )
            @appendProfileView profileModel
            i++
            $( @el ).append ', ' if i < l

        return @

    appendProfileView : ( model_ ) =>

        profileView = new ProfileView  { model : model_ }
        $( @el ).append profileView.render().el