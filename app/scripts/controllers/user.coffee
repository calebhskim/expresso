'use strict'

###*
 # @ngdoc function
 # @name expressoApp.controller:UserCtrl
 # @description
 # # UserCtrl
 # Controller of the expressoApp
###
angular.module 'expressoApp'
   .controller 'UserCtrl', ($rootScope, $scope, $state, $cookieStore, $timeout, $http, AUTH_EVENTS) ->
      @awesomeThings = [
        'HTML5 Boilerplate'
        'AngularJS'
        'Karma'
      ]
      testurl = 'https://fathomless-sierra-4979.herokuapp.com/api/v1.2/'
      token = $cookieStore.get('token')
      
      $http({
         method: 'GET',
         url: testurl + 'stores',
         headers: {
            Authorization: token.token_type + ' ' + token.access_token
         }
      }).then(
         (response) ->
            console.log('Success')
            console.log(response)
         (response) ->
            console.log('Failure')
            console.log(response)
      )