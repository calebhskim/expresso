'use strict'

###*
 # @ngdoc service
 # @name expressoApp.Items
 # @description
 # # Items
 # Factory in the expressoApp.
###
angular.module 'expressoApp'
   .factory 'Items', ($resource, $cookieStore) ->
      # Service logic
      weburl = 'https://test-expresso-db.herokuapp.com/website/api/v1.2/stores/:id/items/'
      token = $cookieStore.get('token')

      return $resource(weburl, null, {
         headers: {
            'Authorization': token.token_type + ' ' + token.access_token
         }
      }, {
         'update': {method: 'POST'}
      })

    
