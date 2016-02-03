'use strict'

###*
 # @ngdoc function
 # @name expressoApp.controller:CustomizationsCtrl
 # @description
 # # CustomizationsCtrl
 # Controller of the expressoApp
###
angular.module 'expressoApp'
  .controller 'CustomizationsCtrl', ->
    @awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    return
