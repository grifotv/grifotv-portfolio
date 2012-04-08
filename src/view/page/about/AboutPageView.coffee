class AboutPageView extends AbstractPageView

    id               : 'about-page'
    overviewTemplate : null
    brandsTemplate   : null
    itemList : []
    
    init: ->

        @overviewTemplate = _.template $( '#template_overview' ).html()
        @brandsTemplate   = _.template $( '#template_brands' ).html()


    render: =>

        # overview
        @$el.append @overviewTemplate
            label    : grifo.labelCollection.get( 'about-overview' ).get( 'label' )
            image    : grifo.labelCollection.get( 'about-picture' ).get( 'label' )
            headline : grifo.labelCollection.get( 'about-headline' ).get( 'label' )
            copy     : grifo.labelCollection.get( 'about-copy' ).get( 'label' )

        # experiences
        @$el.append $( '#template_experiences' ).html()

        for experienceGroupModel in grifo.experienceGroupCollection.models
            @appendExperienceGroupView experienceGroupModel

        # brands
        @$el.append @brandsTemplate
            label : grifo.labelCollection.get( 'about-brands' ).get( 'label' )

        grifo.brandCollection.sort()

        for brandModel in grifo.brandCollection.models
            @appendBrandView brandModel

        return @


    appendExperienceGroupView: ( model_ ) =>

        if model_.get( 'column' ) == 0.0
            $( '#column-0' , @$el ).append $( '#template_experience_group_gap' ).html()
        else
            $( '#column-1' , @$el ).append $( '#template_experience_group_gap' ).html()

        experienceGroupView = new ExperienceGroupView { model: model_ }

        if model_.get( 'column' ) == 0.0
            $( '#column-0' , @$el ).append experienceGroupView.render().el
        else
            $( '#column-1' , @$el ).append experienceGroupView.render().el

        @itemList[ @itemList.length ] = experienceGroupView


    appendBrandView: ( model_ ) =>

        brandView = new BrandView  { model: model_ }
        $( '#brands', @$el ).append brandView.render().el

        @itemList[ @itemList.length ] = brandView


    show: ( delay_ = 0.0, animate_ = true )->

        @itemList = []
        @removeChildren()
        @render()
        super.show( delay_, animate_ )

        delay_ += 50.0

        if @itemList
            for itemView in @itemList
                itemView.show delay_
                delay_ += 25.0


    hide: ()->

        @itemList = []
        @removeChildren()
        super.hide()