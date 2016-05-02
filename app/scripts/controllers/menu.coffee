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
      $scope.name = ""
      $scope.customizations = []

      Session.getProfile().then(
        (response) ->
          $sessionStorage.profile = response.data.id
          Session.getStore($sessionStorage.profile).then(
            (response) ->
              $sessionStorage.store = response.data
              Session.getItems($sessionStorage.profile).then(
                (response) ->
                  $sessionStorage.items = response.data
                  $scope.store = $sessionStorage.store
                  $scope.name = $scope.store.name
                  $scope.items  = $sessionStorage.items

                  if $scope.items.length != 0
                    Session.getCurrentItem($sessionStorage.items[0].id).then(
                      (response) ->
                        $sessionStorage.currentItem = response
                        $scope.currentItem = $sessionStorage.currentItem.data
                        Session.getCustomizations($sessionStorage.currentItem.data.id)
                        $scope.customizations = $sessionStorage.customizations
                      (response) ->
                        console.log('Get current item failure') 
                      )                      
                (response) ->
                  console.log('Get items Failure')
                )
            (response) ->
              console.log('Get Store failure')
            )
          (response) ->
            console.log('Get Profile Failure')
        )

      # if $sessionStorage.profile is undefined or $sessionStorage.store is undefined
      #   Session.getProfile()
      #   $scope.store = $sessionStorage.store
      #   $scope.name = $scope.store.name
      #   $scope.items  = $sessionStorage.items

      #   if $scope.items.length != 0
      #     Session.getCurrentItem($sessionStorage.items[0].id)
      #     Session.getCustomizations($sessionStorage.currentItem.data.id)
      #     $scope.currentItem = $sessionStorage.currentItem.data
      #     $scope.customizations = $sessionStorage.customizations
      # else
      #   $scope.store = $sessionStorage.store
      #   $scope.name = $scope.store.name
      #   $scope.items  = $sessionStorage.items

      #   if $scope.items.length != 0
      #     Session.getCurrentItem($sessionStorage.items[0].id)
      #     Session.getCustomizations($sessionStorage.currentItem.data.id)
      #     $scope.currentItem = $sessionStorage.currentItem.data
      #     $scope.customizations = $sessionStorage.customizations
      #   console.log($scope.name)
      #   console.log($sessionStorage.items)
      #   console.log($sessionStorage.store)
      #   console.log($sessionStorage.profile)
      #   console.log($scope)
          
      $scope.addItem = () ->
        itemName = $('#new-item-name').val()
        itemPrice = $('#new-item-price').val()
        itemCategory = $('#new-item-category').val()
        itemSubCat = $('#new-item-sub-cat').val()
        Session.addItem(itemName, itemPrice, itemCategory, itemSubCat).then(
          (response) ->
            console.log("Add item success")
            session.getItems($sessionStorage.profile).then(
              (response) ->
                $scope.items = $sessionStorage.items
              (response) ->
                console.log("Add item get item failure")
              )
            
          (response) ->
            console.log("Add Item failure")
          )
        console.log($sessionStorage.items)

      $scope.changeCurrentItem = (item) ->
        $scope.currentItem = item

      $scope.deleteItem = () ->
        Session.deleteItem($scope.currentItem.id).then(
          (response) ->
            session.getItems($sessionStorage.profile).then(
              (response) ->
                $sessionStorage.items = response.data  
                Session.getCurrentItem($sessionStorage.items[0].id).then(
                  (response) ->
                    $sessionStorage.currentItem = response
                    $scope.currentItem = $sessionStorage.currentItem.data
                    Session.getCustomizations($sessionStorage.currentItem.data.id)
                    $scope.customizations = $sessionStorage.customizations
                  (response) ->
                    console.log("Delete item get current failure")
                  )
              (response) ->
                console.log("Delete item get items failure")
              )
          (response) ->
            console.log("Delete item failure")
          )
