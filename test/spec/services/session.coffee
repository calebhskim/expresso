'use strict'

describe 'Service: session', ->

  # load the service's module
  beforeEach module 'expressoApp'

  # instantiate service
  Session = {}
  beforeEach inject (_Session_) ->
    Session = _Session_

  it 'should do something', ->
    expect(!!Session).toBe true
