class ProfileView extends Backbone.View

    tagName : 'a'

    render : =>

        $( @el ).html @model.get 'label'
        $( @el ).attr 'href'   , @model.get 'url'
        $( @el ).attr 'target' , @model.get 'window'
        
        return @