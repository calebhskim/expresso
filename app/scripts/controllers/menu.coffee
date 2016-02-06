'use strict'

###*
 # @ngdoc function
 # @name expressoApp.controller:MenuCtrl
 # @description
 # # MenuCtrl
 # Controller of the expressoApp
###
angular.module 'expressoApp'
   .controller 'MenuCtrl', ($state, $rootScope) ->
      
      @awesomeThings = [
        'HTML5 Boilerplate'
        'AngularJS'
        'Karma'
      ]
