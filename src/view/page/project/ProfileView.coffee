class ProfileView extends AbstractView

    tagName       : 'a'
    hasTransition : false

    render : =>

        $( @el ).html @model.get 'label'
        $( @el ).attr 'href'   , @model.get 'url'
        $( @el ).attr 'target' , @model.get 'window'
        
        return @