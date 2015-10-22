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
    'ngSanitize',
    'ngTouch',
    'ui.router',
    'angular-oauth2'
  ]
  .config ($stateProvider) ->
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'views/main.html'
        })
      .state('contact', {
        url: '/contact',
        templateUrl: 'views/contact.html'
        })
      .state('login', {
        url: '/login',
        templateUrl: 'views/login.html'
        })
      .state('user', {

        })
