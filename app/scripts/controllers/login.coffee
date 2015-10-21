'use strict'

###*
 # @ngdoc function
 # @name expressoApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the expressoApp
###
angular.module 'expressoApp'
  .controller 'LoginCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
