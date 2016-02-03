'use strict'

describe 'Controller: ModalCtrl', ->

  # load the controller's module
  beforeEach module 'expressoApp'

  ModalCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ModalCtrl = $controller 'ModalCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(ModalCtrl.awesomeThings.length).toBe 3
