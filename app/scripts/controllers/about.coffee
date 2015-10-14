'use strict'

###*
 # @ngdoc function
 # @name expressoApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the expressoApp
###
angular.module 'expressoApp'
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
