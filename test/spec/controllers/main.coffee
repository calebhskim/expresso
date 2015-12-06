'use strict'

describe 'Controller: MainCtrl', ->

  # load the controller's module
  beforeEach module 'expressoApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope,
      AuthService
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
