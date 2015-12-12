'use strict'

describe 'Controller: ContactCtrl', ->

  # load the controller's module
  beforeEach module 'expressoApp'

  ContactCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, $injector) ->
    scope = $rootScope.$new()
    AuthService = $injector.get('AuthService')
    ContactCtrl = $controller('ContactCtrl', {
      # mocked dependencies
      $scope: scope,
      auth: AuthService
    })

  it 'should attach a list of awesomeThings to the scope', ->
    expect(ContactCtrl.awesomeThings.length).toBe 3
