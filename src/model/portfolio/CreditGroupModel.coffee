class CreditGroupModel extends Backbone.Model

    defaults :
    
        label              : ''
        credit_collection  : null # new CreditCollection()

    initialize : ->

        @set
            credit_collection : new CreditCollection @get( 'credit_collection' )