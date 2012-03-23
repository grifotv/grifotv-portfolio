class TagGroupView extends AbstractView

    className : 'size1of6'
    template  : null
    model     : null


    init: ->

        @template = _.template $( '#template_tag_group' ).html()


    render: =>

        @$el.append @template
            group : @model.get 'label'

        for tagModel in grifo.tagCollection.models
            if tagModel.get( 'group' ) == @model.get('id')
                @appendTagView tagModel

        return @


    appendTagView: ( model_ ) =>

        tagView = new TagView  { model: model_ }
        tagView.useLongTitle = true
        @$el.append tagView.render().el
        @$el.append ' '