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
   .controller 'LoginCtrl', ($rootScope, $scope, Session, OAuth, AuthService, AUTH_EVENTS) ->
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
               console.log("Login Success")
               console.log(msg)
               $scope.setCurrentUser(user)
               Session.create(null, null, 'user')
               $rootScope.$broadcast(AUTH_EVENTS.loginSuccess)
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
