'use strict'

describe 'Controller: CustomizationsCtrl', ->

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

  CustomizationsCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CustomizationsCtrl = $controller 'CustomizationsCtrl', {
     $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(CustomizationsCtrl.awesomeThings.length).toBe 3
