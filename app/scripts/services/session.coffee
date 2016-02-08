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
         $http({
            method: 'GET',
            url: weburl + 'stores/profile/',
            headers: {
               'Authorization': token.token_type + ' ' + token.access_token
            }
         }).then(
            (response) ->
               console.log('Get Profile success')
               $sessionStorage.profile = response.data.id
               session.id = $sessionStorage.profile
               session.getItems(session.id)
            (response) ->
               console.log('Get Profile Failure')
         )

      session.getStore = (id) ->
         $http({
            method: 'GET',
            url: weburl + 'stores/' + id + '/',
            headers: {
               'Authorization': token.token_type + ' ' + token.access_token
            }
         }).then(
            (response) ->
               console.log('Get Store success')
               $sessionStorage.store = response.data
            (response) ->
               console.log('Get Store failure')
         )

      session.getItems = (id) ->
         $http({
            method: 'GET',
            url: weburl + 'stores/' + id + '/items/',
            headers: {
               'Authorization': token.token_type + ' ' + token.access_token
            }
         }).then(
            (response) ->
               console.log('Get Items success')
               $sessionStorage.items = response.data
            (response) ->
               console.log('Get Items Failure')
         )
      session.addItem = (name, price, category) ->
         item = {
            "name": name,
            "description":"",
            "category": category,
            "subcategory": "Chicken" + category,
            "sizes": [
               {
                  "name":"Regular",
                  "price": price,
                  "inventory": 10
               }
            ],
            "customizations": []
         }

         console.log(weburl + 'stores/' + session.id + '/items/')
         console.log(token.token_type + ' ' + token.access_token)
         $http({
            method: 'POST',
            url: weburl + 'stores/' + session.id + '/items/',
            data: item,
            headers: {
               'Authorization': token.token_type + ' ' + token.access_token
            }
         }).then(
            (response) ->
               console.log('Add item success')
            (response) ->
               console.log('Add item failure')
         )
         session.getItems(session.id)

      session.deleteItem = (id) ->
         $http({
            method: 'DELETE',
            url: weburl + 'stores/' + session.id + '/items/' + id + '/',
            data: item,
            headers: {
               'Authorization': token.token_type + ' ' + token.access_token
            }
         }).then(
            (response) ->
               console.log('Delete item success')
            (response) ->
               console.log('Delete Items Failure')
         )
         session.getItems(session.id)

      return session

