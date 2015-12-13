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
    SessionMock = {
      id: null,
      userId: null,
      userRole: null,
      create: ->
      ,
      destroy: -> 
    }
    module ($provide) ->
      $provide.value 'AuthService', AuthServiceMock
      $provide.value 'Session', SessionMock
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
