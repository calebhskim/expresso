'use strict'

###*
 # @ngdoc function
 # @name expressoApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the expressoApp
###

#Add user logout functionality
angular.module 'expressoApp'
   .controller 'LoginCtrl', ($rootScope, $scope, OAuth) ->
      console.log($scope) 
      $scope.credentials = {
         username: '',
         password: ''
      }
      $scope.login = (credentials) ->
         console.log(credentials)
         OAuth.getAccessToken(credentials).then(
            (msg) ->
               $rootScope.$broadcast(AUTH_EVENTS.loginSuccess)
               # TODO: set current user
               console.log(msg)
            (msg) ->
               $rootScope.$broadcast(AUTH_EVENTS.loginFailed)
               console.log(msg)
         )
      $scope.logout = () ->
         OAuth.revokeToken().then(
            (msg) ->
               $rootScope.$broadcast(AUTH_EVENTS.logoutSuccess)
               console.log(msg)
            (msg) ->
               $rootScope.$broadcast(AUTH_EVENTS.logoutFailed)
               console.log(msg)
         )
      $scope.awesomeThings = [
         'HTML5 Boilerplate'
         'AngularJS'
         'Karma'
      ]
