class NavView extends AbstractView

    id            : 'nav'
    hasTransition : false

    selectItem : ( pageId_ = '' )->

    	# unmark of all items
        $( '.menu' , @$el ).removeClass 'menuSelected'

        # mark item
        $( '#menu-' + pageId_ , @$el ).addClass 'menuSelected'