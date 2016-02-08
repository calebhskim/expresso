'use strict'

describe 'Service: Items', ->

  # load the service's module
  beforeEach module 'expressoApp'

  # instantiate service
  Items = {}
  beforeEach inject (_Items_) ->
    Items = _Items_

  it 'should do something', ->
    expect(!!Items).toBe true
