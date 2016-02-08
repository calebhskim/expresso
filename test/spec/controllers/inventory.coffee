'use strict'

describe 'Controller: InventoryCtrl', ->

  # load the controller's module
  beforeEach module 'expressoApp'

  InventoryCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, AuthService) ->
    scope = $rootScope.$new()
    console.log(scope)
    InventoryCtrl = $controller 'InventoryCtrl', {
      $scope: scope
    }

  # it 'should attach a list of awesomeThings to the scope', ->
  #   expect(InventoryCtrl.awesomeThings.length).toBe 3
