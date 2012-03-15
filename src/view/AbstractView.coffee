class AbstractView extends Backbone.View

    id            : null
    el            : null
    $el           : null
    status        : true
    hasTransition : true


    initialize: ->
        
        if @id
            @$el = $( '#' + @id )
        else
            @$el = $( @el )

        if @hasTransition
            @hide()

        @init()


    remove: ->

        @$el.remove()


    removeChildren : ->

        @$el.children().remove()


    hide: ->

        if !@hasTransition
            return

        @status = false

        @$el.stop()
        @$el.css 'display', 'none'


    show: ( delay_ = 0.0, animate_ = true )->

        if !@hasTransition
            return
        
        @status = true
        @$el.css 'display', 'block'

        if !animate_
            @$el.css 'opacity', 1.0
        else
            @$el.css 'opacity', 0.0
            @$el.stop().delay( delay_ ).animate( { opacity: 1.0 }, { duration: 300.0 } )


    init: ->
        # abstract method to be overridden