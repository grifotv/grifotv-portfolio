class CreditModel extends Backbone.Model

    defaults :
    
        label           : ''
        profiles_id     : [] # array of profile id
        profiles_model  : [] # array of profile model
        #profiles_collection:    new ProfileCollection()