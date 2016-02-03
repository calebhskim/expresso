'use strict'

describe 'Service: authservice', ->

  # load the service's module
  beforeEach module 'expressoApp'

  # instantiate service
  authservice = {}
  beforeEach inject (_authservice_) ->
    authservice = _authservice_

  it 'should do something', ->
    expect(!!authservice).toBe true
