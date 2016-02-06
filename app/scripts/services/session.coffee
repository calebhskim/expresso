'use strict'

###*
 # @ngdoc service
 # @name expressoApp.session
 # @description
 # # session
 # Service in the expressoApp.
###
angular.module 'expressoApp'
   .service 'Session', ($rootScope, $sessionStorage, USER_ROLES) ->
      session = {}
      
      session.create = (sessionId, userId, userRole) ->
         obj = {id: 1, userId: 1, userRole: USER_ROLES.user}
         $sessionStorage.session = obj

      session.destroy = () ->
         obj = {id: null, userId: null, userRole: null}
         $sessionStorage.session = obj

      session.currentSession = () ->
         return $sessionStorage.session

      return session

