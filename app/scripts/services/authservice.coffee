'use strict'

###*
 # @ngdoc service
 # @name expressoApp.authservice
 # @description
 # # authservice
 # Service in the expressoApp.
###
angular.module 'expressoApp'
   .service 'AuthService', ($rootScope, $timeout, Session, OAuth, AUTH_EVENTS, USER_ROLES) ->
      authService = {}
      
      authService.login = (credentials) ->
         #TODO: Set current user
         OAuth.getAccessToken(credentials).then(
            (msg) ->
               user = {
                  name : credentials.username,
                  role: 'user',
                  id: null
               }
               $rootScope.setCurrentUser(user)
               Session.create(1, 1, 'user')
               $rootScope.$broadcast(AUTH_EVENTS.loginSuccess)
               
            (msg) ->
               $rootScope.$broadcast(AUTH_EVENTS.loginFailed)
         )
      
      authService.logout = () ->
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

      authService.isAuthenticated = () -> 
         userSession = Session.currentSession()
         return !!userSession.userId
    
      authService.isAuthorized = (authorizedRoles) ->
         userSession = Session.currentSession()
         if not angular.isArray(authorizedRoles)
            authorizedRoles = [authorizedRoles]
         return (USER_ROLES.all in authorizedRoles || (authService.isAuthenticated() && userSession.userRole in authorizedRoles))
    
      return authService
