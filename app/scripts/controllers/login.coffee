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
   .controller 'LoginCtrl', ($rootScope, $state, $scope, Session, OAuth, AuthService, AUTH_EVENTS, USER_ROLES) ->
      $scope.awesomeThings = [
         'HTML5 Boilerplate'
         'AngularJS'
         'Karma'
      ]

      $scope.credentials = {
         username: '',
         password: ''
      }

      $scope.login = (credentials) ->
         #TODO: Set current user
         AuthService.login(credentials)

      $scope.logout = () ->
         AuthService.logout()