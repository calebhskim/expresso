'use strict'

describe 'Controller: ContactCtrl', ->

  # load the controller's module
  beforeEach module 'expressoApp'

  beforeEach ->
    AuthServiceMock = {
      isAuthenticated: ->
      ,
      isAuthorized: ->
    }

    module ($provide) ->
      $provide.value 'AuthService', AuthServiceMock
      null
      
  ContactCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, AuthService) ->
    #AuthService = $injector.get('AuthService')
    scope = $rootScope.$new()
    ContactCtrl = $controller('ContactCtrl', {
      # mocked dependencies
      $scope: scope
    })

  it 'should attach a list of awesomeThings to the scope', ->
    expect(ContactCtrl.awesomeThings.length).toBe 3
