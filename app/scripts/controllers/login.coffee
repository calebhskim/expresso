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
         OAuth.getAccessToken(credentials).then(
            (msg) ->
               user = {
                  name : credentials.username,
                  role: 'user',
                  id: null
               }
               $rootScope.setCurrentUser(user)
               Session.create(null, null, 'user')
               $rootScope.$broadcast(AUTH_EVENTS.loginSuccess)
               
            (msg) ->
               $rootScope.$broadcast(AUTH_EVENTS.loginFailed)
         )

      $scope.logout = () ->
         OAuth.revokeToken().then(
            (msg) ->
            (msg) ->
               $rootScope.$broadcast(AUTH_EVENTS.logoutFailure)
         )
         user = {
            name : null,
            role: null,
            id: null
         }
         $rootScope.setCurrentUser(user)
         Session.destroy()
         $rootScope.$broadcast(AUTH_EVENTS.logoutSuccess)
         $state.go('home')