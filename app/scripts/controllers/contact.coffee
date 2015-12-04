'use strict'

###*
 # @ngdoc function
 # @name expressoApp.controller:ContactCtrl
 # @description
 # # ContactCtrl
 # Controller of the expressoApp
###
angular.module 'expressoApp'
  .controller 'ContactCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    return
