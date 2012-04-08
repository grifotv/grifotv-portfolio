class ProjectsPageView extends AbstractPageView

    id       : 'projects-page'
    itemList : []


    init: ->

        @render()


    render: =>

        for projectModel in grifo.projectCollection.models
            @appendThumbnail projectModel

        @$el.isotope
            itemSelector     : '.grid-item'
            resizable        : false
            masonry          : { columnWidth: 1 }
            animationEngine  : 'jquery' # 'best-available'
            animationOptions : { queue: false, duration: 0.0, easing: 'easeOutExpo' }

        return @


    relayout: ->

        @$el.isotope 'reLayout'


    appendThumbnail: ( model_ ) =>

        thumbnailView = new ThumbnailView  { model: model_ }
        @$el.append thumbnailView.render().el
        @itemList[ @itemList.length ] = thumbnailView


    filter: ( tagId_ = '' )->

        if tagId_== ''
            tagId_ = '*'
        else
            tagId_ = '.' + tagId_

        if !@status
            @$el.isotope
                animationOptions: { duration : 0.0 }
        else 
            @$el.isotope
                animationOptions: { duration : 750.0 }

        @$el.isotope
            filter: tagId_


    show: ( delay_ = 0.0, animate_ = false )->

        return if @status == true

        super.show( delay_, animate_ )
        delay_ += 100

        @relayout()
        
        if @itemList
            for thumbnailView in @itemList
                thumbnailStatus = thumbnailView.show( delay_ )
                if thumbnailStatus
                    delay_ += 50.0
    
    hide: ()->

        return if @status == false
        
        @status = false

        ###
        if @itemList
            for thumbnailView in @itemList
                thumbnailView.hide()
        ###
        
        # TODO: fix error "Uncaught TypeError: Property 'true' of object #<Object> is not a function"
        super.hide()

        #@$el.css 'height', 0.0 # hack

        

