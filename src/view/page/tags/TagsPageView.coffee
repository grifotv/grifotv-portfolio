class TagsPageView extends AbstractPageView

    id       : 'tags-page'
    itemList : []


    init: ->

        @render()


    render: =>

        for tagGroupModel in grifo.tagGroupCollection.models
            @appendTagGroup tagGroupModel

        @$el.append '<div class="new-row"><br/><hr/></div>' # TODO create template for it

        return @


    appendTagGroup: ( model_ ) =>

        tagGroupView = new TagGroupView  { model: model_ }
        @$el.append tagGroupView.render().el
        @itemList[ @itemList.length ] = tagGroupView


    show: ( delay_ = 0.0, animate_ = true )->

        return if @status == true

        super.show( delay_, animate_ )

        if @itemList
            for tagGroupView in @itemList
                tagGroupView.show delay_
                delay_ += 50.0