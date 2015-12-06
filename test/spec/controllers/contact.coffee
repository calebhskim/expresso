'use strict'

describe 'Controller: ContactCtrl', ->

  # load the controller's module
  beforeEach module 'expressoApp'

  ContactCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, AuthService) ->
    scope = $rootScope.$new()
    ContactCtrl = $controller 'ContactCtrl', {
      # place here mocked dependencies
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    console.log("CONTROL OBJECT")
    console.log(ContactCtrl)
    expect(ContactCtrl.awesomeThings.length).toBe 3
