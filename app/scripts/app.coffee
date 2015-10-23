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
  .config ($stateProvider, $urlRouterProvider, OAuthProvider) ->
    OAuthProvider.configure({
      baseUrl: 'http://fathomless-sierra-4979.herokuapp.com',
      clientId: '4baac4f1beec9a8bd4c5',
      clientSecret: 'CLIENT_SECRET' #optional
    })
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
        })
      .state('contact', {
        url: '/contact',
        templateUrl: 'views/contact.html',
        controller: 'ContactCtrl'
        })
      .state('login', {
        url: '/login',
        templateUrl: 'views/login.html',
        controller: 'LoginCtrl'
        })
      .state('user', {

        })
    $urlRouterProvider.otherwise('/')
  .constant('AUTH_EVENTS', {
    loginSuccess: 'auth-login-success',
    loginFailed: 'auth-login-failed',
    logoutSuccess: 'auth-logout-success',
    logoutFailed: 'auth-logout-failed',
    sessionTimeout: 'auth-session-timeout',
    notAuthenticated: 'auth-not-authenticated',
    notAuthorized: 'auth-not-authorized'
  })
