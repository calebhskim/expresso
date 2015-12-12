'use strict'

describe 'Controller: ContactCtrl', ->

  # load the controller's module
  beforeEach module 'expressoApp'
  beforeEach module 'expressoApp.AuthService'

  ContactCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, AuthService) ->
    scope = $rootScope.$new()
    authService = AuthService
    ContactCtrl = $controller('ContactCtrl', {
      # mocked dependencies
      $scope = scope
      auth = authService
    })

  it 'should attach a list of awesomeThings to the scope', ->
    expect(ContactCtrl.awesomeThings.length).toBe 3
