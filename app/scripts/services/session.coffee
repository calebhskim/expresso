'use strict'

###*
 # @ngdoc service
 # @name expressoApp.session
 # @description
 # # session
 # Service in the expressoApp.
###

angular.module 'expressoApp'
   .service 'Session', ($rootScope, $sessionStorage, USER_ROLES, $http, $cookieStore, $timeout, AUTH_EVENTS) ->
      weburl = 'https://test-expresso-db.herokuapp.com/website/api/v1.2/'
      token = $cookieStore.get('token')
      console.log(token)
      session = {}
      
      session.create = (sessionId, userId, userRole) ->
         obj = {id: 1, userId: 1, userRole: USER_ROLES.user}
         $sessionStorage.session = obj

      session.destroy = () ->
         obj = {id: null, userId: null, userRole: null}
         $sessionStorage.session = obj

      session.currentSession = () ->
         return $sessionStorage.session

      session.getProfile = () ->
         return $http({
            method: 'GET',
            url: weburl + 'stores/profile/',
            headers: {
               'Authorization': token.token_type + ' ' + token.access_token
            }
         })
         # .then(
         #    (response) ->
         #       console.log('Get Profile success')
         #       $sessionStorage.profile = response.data.id
         #       session.getStore($sessionStorage.profile)
         #       session.getItems($sessionStorage.profile)
         #    (response) ->
         #       console.log('Get Profile Failure')
         # )

      session.getStore = (id) ->
         return $http({
            method: 'GET',
            url: weburl + 'stores/' + id + '/',
            headers: {
               'Authorization': token.token_type + ' ' + token.access_token
            }
         })
         # .then(
         #    (response) ->
         #       console.log('Get Store success')
         #       $sessionStorage.store = response.data
         #    (response) ->
         #       console.log('Get Store failure')
         # )

      session.getItems = (id) ->
         return $http({
            method: 'GET',
            url: weburl + 'stores/' + id + '/items/',
            headers: {
               'Authorization': token.token_type + ' ' + token.access_token
            }
         })
         # .then(
         #    (response) ->
         #       console.log('Get Items success')
         #       $sessionStorage.items = response.data
         #    (response) ->
         #       console.log('Get Items Failure')
         # )
         
      session.addItem = (itemName, itemPrice, itemCategory, itemSubCat) ->
         console.log(weburl + "stores/" + $sessionStorage.profile + "/items/")
         console.log(token.token_type + ' ' + token.access_token)

         item = {
            "name": itemName,
            "description":"",
            "category": itemCategory,
            "subcategory": itemSubCat,
            "sizes": [
               {
                  "name":"Regular",
                  "price": itemPrice,
                  "inventory": "10"
               }
            ],
            "customizations": []
            # "id": 23,
            # "image_url": "",        
         }
         console.log(itemName + ' ' + itemPrice  + ' ' + itemCategory + ' ' + itemSubCat)
         # console.log()
         console.log(JSON.parse(JSON.stringify(item)))
         #TODO: remove
         $sessionStorage.items.push item

         return $http({
            method: "POST",
            url: weburl + "stores/" + $sessionStorage.profile + "/items/",
            data: item,
            headers: {
               "Authorization": token.token_type + " " + token.access_token
            }
         })

         # .then(
         #    (response) ->
         #       console.log('Add item success')
         #    (response) ->
         #       console.log('Add item failure')
         # )
         # session.getItems($sessionStorage.profile)

      session.deleteItem = (id) ->
         return $http({
            method: 'DELETE',
            url: weburl + 'stores/' + session.id + '/items/' + id + '/',
            headers: {
               'Authorization': token.token_type + ' ' + token.access_token
            }
         })
         # .then(
         #    (response) ->
         #       console.log('Delete item success')
         #    (response) ->
         #       console.log('Delete Items Failure')
         # )
         # session.getItems($sessionStorage.profile)

      session.getCurrentItem = (id) ->
         return $http({
            method: 'GET',
            url: weburl + 'stores/' + $sessionStorage.profile + '/items/' + id + '/',
            headers: {
               'Authorization': token.token_type + ' ' + token.access_token
            }
         })
         # .then(
         #    (response) ->
         #       console.log('Get item success')
         #       $sessionStorage.currentItem = response
         #    (response) ->
         #       console.log('Get item failure')
         # )

      session.getItemCustomization = (id) ->
         return $http({
            method: 'GET',
            url: weburl + 'stores/' + $sessionStorage.profile + '/customizations/' + id + '/',
            headers: {
               'Authorization': token.token_type + ' ' + token.access_token
            }
         })
         # .then(
         #    (response) ->
         #       console.log('Get customizations success')
         #       return response
         #    (response) ->
         #       console.log('Get customizations failure')
         #       return -1
         # )

      session.getCustomizations = (ids) ->
         customizations = []
         if not angular.isArray(ids)
            ids = [ids]

         for id in ids
            temp = session.getItemCustomization(id)
            if temp != -1
               customizations.push(temp)

         $sessionStorage.customizations = customizations
      return session

      session.editItem = () ->


