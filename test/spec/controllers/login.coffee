'use strict'

describe 'Controller: LoginCtrl', ->

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

  LoginCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, AuthService) ->
    scope = $rootScope.$new()
    LoginCtrl = $controller 'LoginCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
