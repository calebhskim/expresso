'use strict'

###*
 # @ngdoc function
 # @name expressoApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the expressoApp
###
angular.module 'expressoApp'
  .controller 'MainCtrl', ($scope, $state) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
