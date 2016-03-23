'use strict'

###*
 # @ngdoc function
 # @name expressoApp.controller:InventoryCtrl
 # @description
 # # InventoryCtrl
 # Controller of the expressoApp
###
angular.module 'expressoApp'
  .controller 'InventoryCtrl', ($rootScope, $scope, $state, $cookieStore, $timeout, $http, Session, AUTH_EVENTS) ->
      $scope.awesomeThings = [
        'HTML5 Boilerplate'
        'AngularJS'
        'Karma'
      ]

      $scope.items = []