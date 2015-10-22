'use strict'

###*
 # @ngdoc overview
 # @name expressoApp
 # @description
 # # expressoApp
 #
 # Main module of the application.
###
angular
  .module 'expressoApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ui.router',
    'angular-oauth2'
  ]
  .config ($routeProvider, $stateProvider, OAuthProvider) ->
    OAuthProvider
      .configure({
        baseUrl: 'http://fathomless-sierra-4979.herokuapp.com',
        clientId: '4baac4f1beec9a8bd4c5',
        clientSecret: '796d508080a7ae62927d4f6cb969426d8f876aad'
        })
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .when '/login',
        templateUrl: 'views/login.html'
        controller: 'LoginCtrl'
      .otherwise
        redirectTo: '/'

