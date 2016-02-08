'use strict'

describe 'Service: authresolver', ->

  # load the service's module
  beforeEach module 'expressoApp'

  # instantiate service
  authresolver = {}
  beforeEach inject (_authresolver_) ->
    authresolver = _authresolver_

  it 'should do something', ->
    expect(!!authresolver).toBe true
