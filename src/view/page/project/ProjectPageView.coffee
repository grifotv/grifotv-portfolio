class ProjectPageView extends AbstractPageView

    id          : 'project-page'
    model       : null
    template    : null
    imgTemplate : null


    init : ->
    
        @template    = _.template $( '#template_page_project' ).html()
        @imgTemplate = _.template $( '#template_project_image' ).html()


    render: =>

        @model    = grifo.projectCollection.get( grifo.appStatus.currentSubPage )

        prevModel = grifo.projectCollection.at( @model.get( 'index' ) - 1.0 )
        nextModel = grifo.projectCollection.at( @model.get( 'index' ) + 1.0 )

        if !prevModel
            prevModel = grifo.projectCollection.at( grifo.projectCollection.length - 1.0 )

        if !nextModel
            nextModel = grifo.projectCollection.at( 0.0 )

        @$el.append @template
            video     : @model.get 'video'
            title     : @model.get 'long_title'
            headline  : @model.get 'headline'
            url       : @model.get 'url'
            copy      : @model.get 'copy'
            prevUrl   : '#' + grifo.appConfig.PAGE_PROJECTS + '/' + prevModel.get( 'id' )
            prevTitle : prevModel.get 'long_title'
            nextUrl   : '#' + grifo.appConfig.PAGE_PROJECTS + '/' + nextModel.get( 'id' )
            nextTitle : nextModel.get 'long_title'

        for tagModel in @model.get( 'tags_model' )
            @appendTagView tagModel

        for creditGroupModel in @model.get( 'credit_group_collection' ).models
            @appendCreditGroupView creditGroupModel

        for imageModel in @model.get( 'images' )
            @appendProjectImage imageModel

        return @


    appendTagView: ( model_ ) =>

        tagView = new TagView { model: model_ }
        $( '#tags-container', @$el ).append tagView.render().el
        $( '#tags-container', @$el ).append ' '


    appendCreditGroupView: ( model_ ) =>

        creditGroupView = new CreditGroupView  { model: model_ }
        $( '#info-right', @$el ).append creditGroupView.render().el


    appendProjectImage: ( src_ ) =>

        $( '#images-container', @$el ).append @imgTemplate
            image: src_


    show: ( delay_ = 100.0, animate_ = true )->

        @removeChildren()
        @render()
        super.show( delay_, animate_ )


    hide: ()->
        
        @removeChildren()
        super.hide()