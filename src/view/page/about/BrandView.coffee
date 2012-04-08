class BrandView extends AbstractView

    className     : 'brand'

    render : =>
    
        if @model.get( 'url' ).length > 0.0

            @template = _.template $( '#template_brand_link' ).html()

            $( @el ).append @template
                image  : @model.get 'image'
                label  : @model.get 'label'
                url    : @model.get 'url'
                window : @model.get 'window'
        else

            @template = _.template $( '#template_brand' ).html()

            $( @el ).append @template
                image : @model.get 'image'
                label : @model.get 'label'
        
        return @