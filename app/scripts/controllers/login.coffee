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
   .controller 'LoginCtrl', ($rootScope, $scope, $sessionStorage, Session, OAuth, AuthService, AUTH_EVENTS) ->
      $scope.credentials = {
         username: '',
         password: ''
      }
      $scope.login = (credentials) ->
         #TODO: Set current user
         OAuth.getAccessToken(credentials).then(
            (msg) ->
               user = {
                  name : credentials.username,
                  role: 'user',
                  id: null
               }
               $rootScope.$broadcast(AUTH_EVENTS.loginSuccess)
               console.log("Login Success")
               console.log(msg)
               console.log(user)
               $scope.setCurrentUser(user)
               Session.create(null, null, 'user')
            (msg) ->
               $rootScope.$broadcast(AUTH_EVENTS.loginFailed)
               console.log("Login Failure")
               console.log(msg)
         )

      $scope.logout = () ->

      $scope.awesomeThings = [
         'HTML5 Boilerplate'
         'AngularJS'
         'Karma'
      ]
