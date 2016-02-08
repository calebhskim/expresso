'use strict'

###*
 # @ngdoc function
 # @name expressoApp.controller:MenuCtrl
 # @description
 # # MenuCtrl
 # Controller of the expressoApp
###
angular.module 'expressoApp'
   .controller 'MenuCtrl', ($rootScope, $scope, $state, $http, $cookieStore, $sessionStorage, $timeout, Session, AUTH_EVENTS) ->
      $scope.awesomeThings = [
        'HTML5 Boilerplate'
        'AngularJS'
        'Karma'
      ]

      $scope.items = []
      $scope.currentItem = {}
      $scope.store = {}

      if $sessionStorage.profile is undefined 
         Session.getProfile() 
         Session.getStore($sessionStorage.profile)
         $scope.store = $sessionStorage.store

      $scope.items  = $sessionStorage.items

      if $scope.items.length != 0
        $scope.currentItem = $scope.items[0]

      console.log($sessionStorage.items)
      console.log($sessionStorage.store)
      console.log($sessionStorage.profile)
      $scope.addItem = () ->
         itemName = $('#new-item-name')
         itemPrice = $('#new-item-price')
         itemCategory = $('#new-item-category')
         Session.addItem(itemName, itemPrice, itemCategory)
         console.log($sessionStorage.items)
