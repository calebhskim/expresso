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
    'ngTouch'
  ]
  .config ($routeProvider) ->
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
      .when '/signin',
        templateUrl: 'views/signin.html'
        controller: 'SigninCtrl'
      .when '/menu',
        templateUrl: 'views/menu.html'
        controller: 'MenuCtrl'
      .when '/customizations',
        templateUrl: 'views/customizations.html'
        controller: 'CustomizationsCtrl'
      .when '/inventory',
        templateUrl: 'views/inventory.html'
        controller: 'InventoryCtrl'
      .when '/storeinfo',
        templateUrl: 'views/storeinfo.html'
        controller: 'StoreInfoCtrl'
      .when '/storemedia',
        templateUrl: 'views/storemedia.html'
        controller: 'StoreMediaCtrl'
      .when '/storepayment',
        templateUrl: 'views/storepayment.html'
        controller: 'StorePaymentCtrl'
      .otherwise
        redirectTo: '/'

