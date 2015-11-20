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
   .controller 'LoginCtrl', ($scope, AuthService, AUTH_EVENTS) ->
      $scope.credentials = {
         username: '',
         password: ''
      }
      $scope.login = (credentials) ->
         AuthService.login(credentials)
      $scope.logout = () ->
         AuthService.logout()
      $scope.awesomeThings = [
         'HTML5 Boilerplate'
         'AngularJS'
         'Karma'
      ]
