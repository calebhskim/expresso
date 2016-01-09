'use strict'

describe 'Controller: ContactCtrl', ->

  # load the controller's module
  beforeEach module 'expressoApp'
      
  ContactCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    #AuthService = $injector.get('AuthService')
    scope = $rootScope.$new()
    ContactCtrl = $controller('ContactCtrl', {
      # mocked dependencies
    })

  it 'should attach a list of awesomeThings to the scope', ->
    expect(ContactCtrl.awesomeThings.length).toBe 3
