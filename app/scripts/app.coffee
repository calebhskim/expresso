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
    'ngStorage',
    'ngTouch',
    'ui.router',
    'angular-oauth2',
    'ui.bootstrap'
  ]
  .constant('AUTH_EVENTS', {
    loginSuccess: 'auth-login-success',
    loginFailed: 'auth-login-failed',
    logoutSuccess: 'auth-logout-success',
    logoutFailed: 'auth-logout-failed',
    sessionTimeout: 'auth-session-timeout',
    notAuthenticated: 'auth-not-authenticated',
    notAuthorized: 'auth-not-authorized',
    modalClose: 'modal-closed'
  })
  .constant('USER_ROLES', {
    all: '*',
    admin: 'admin',
    user: 'user',
    guest: 'guest'
  })
  .config ($stateProvider, $httpProvider, $sessionStorageProvider, $urlRouterProvider, OAuthProvider, OAuthTokenProvider, USER_ROLES) ->
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']
    OAuthProvider.configure({
      baseUrl: 'http://fathomless-sierra-4979.herokuapp.com/api/v1.2',
      clientId: 'c4be427f880b3ba97f0b',
      clientSecret: '6e8a021d87308058c935c0c102b60589d720f85a',
      grantPath:'/oauth2/access_token/?',
      revokePath:'/oauth2/revoke_token' #TODO: figure out revoke path
    })
    #TODO: Set secure back to true for HTTPS. seegno issue #21
    OAuthTokenProvider.configure({
      name: 'token',
      options: {
        secure: false
      }
    })
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        data: {
          authorizedRoles: [USER_ROLES.all]
        }
        })
      .state('contact', {
        url: '/contact',
        templateUrl: 'views/contact.html',
        controller: 'ContactCtrl',
        data: {
          authorizedRoles: [USER_ROLES.all]
        }
        })
      .state('about', {
        url: '/about',
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl',
        data: {
          authorizedRoles: [USER_ROLES.all]
        }
        })
      .state('login', {
        url: '/login',
        templateUrl: 'views/login.html',
        controller: 'LoginCtrl',
        data: {
          authorizedRoles: [USER_ROLES.all]
        }
        })
      .state('signin', {
        url: '/signin',
        templateUrl: 'views/signin.html',
        controller: 'LoginCtrl',
        data: {
          authorizedRoles: [USER_ROLES.all]
        }
        })
      .state('menu', {
        url: '/menu',
        templateUrl: 'views/menu.html',
        controller: 'MenuCtrl',
        data: {
          authorizedRoles: [USER_ROLES.admin, USER_ROLES.user]
        }
        })
      .state('customizations', {
        url: '/customizations',
        templateUrl: 'views/customizations.html',
        controller: 'CustomizationsCtrl',
        data: {
          authorizedRoles: [USER_ROLES.admin, USER_ROLES.user]
        }
        })
      .state('inventory', {
        url: '/inventory',
        templateUrl: 'views/inventory.html',
        controller: 'InventoryCtrl',
        data: {
          authorizedRoles: [USER_ROLES.admin, USER_ROLES.user]
        }
        })
      .state('storeinfo', {
        url: '/storeinfo',
        templateUrl: 'views/storeinfo.html',
        controller: 'StoreInfoCtrl',
        data: {
          authorizedRoles: [USER_ROLES.admin, USER_ROLES.user]
        }
        })
      .state('storemedia', {
        url: '/storemedia',
        templateUrl: 'views/storemedia.html',
        controller: 'StoreMediaCtrl',
        data: {
          authorizedRoles: [USER_ROLES.admin, USER_ROLES.user]
        }
        })
      .state('storepayment', {
        url: '/storepayment',
        templateUrl: 'views/storepayment.html',
        controller: 'StorePaymentCtrl',
        data: {
          authorizedRoles: [USER_ROLES.admin, USER_ROLES.user]
        }
        })
      .state('user', {
        url: '/dashboard',
        templateUrl: 'views/user.html',
        controller: 'UserCtrl',
        data: {
          authorizedRoles: [USER_ROLES.admin, USER_ROLES.user]
        }
        # TODO: Set up Auth Resolver just in case user loads before page
        # resolve: {
        #   auth: resolveAuthentication = (AuthResolver) ->
        #     return AuthResolver.resolve()
        # }
        })
    $urlRouterProvider.otherwise('/')
    $sessionStorageProvider.set('session', {id: null, userId: null, userRole: null})
  .run ($rootScope, $state, $window, $sessionStorage, $uibModal, $timeout, OAuth, AuthService, AUTH_EVENTS) ->
    # if $sessionStorage.session.id and $sessionStorage.session.userRole and AuthService.isAuthorized($sessionStorage.session.userRole) and AuthService.isAuthenticated
    #   #TODO: check authenicated
    #   #send parameters to dashboard
    #   $state.go('user')
    $rootScope.$on('oauth:error', (event, rejection) ->
      # Ignore `invalid_grant` error - should be catched on `LoginController`.
      if 'invalid_grant' is rejection.data.error
        return

      # Refresh token when a `invalid_token` error occurs.
      if 'invalid_token' is rejection.data.error 
        return OAuth.getRefreshToken()

      # Redirect to `/login` with the `error_reason`.
      return $window.location.href = '/login?error_reason=' + rejection.data.error
    )

    $rootScope.$on('$stateChangeStart', (event, state) ->
      authorizedRoles = state.data.authorizedRoles
      if not AuthService.isAuthorized(authorizedRoles)
        event.preventDefault();
        if AuthService.isAuthenticated()
          # user is not allowed
          $rootScope.$broadcast(AUTH_EVENTS.notAuthorized);
        else
          # user is not logged in
          $rootScope.$broadcast(AUTH_EVENTS.notAuthenticated);
    )

    $rootScope.$on(AUTH_EVENTS.notAuthenticated, (event, state) ->
      $state.go('signin')
    ) 

    $rootScope.$on(AUTH_EVENTS.notAuthorized, (event, state) ->
      $state.go('signin')
    )

    $rootScope.$on(AUTH_EVENTS.sessionTimeout, (event, state) ->
      $state.go('signin')
    )

    $rootScope.$on(AUTH_EVENTS.loginSuccess, (event, state) ->
       #TODO: make sure it is ok to just call cancel
       #$scope.cancel()
       $state.go('menu')
    )
  .controller('AppController', ($rootScope, $scope, USER_ROLES, AuthService) ->
    $rootScope.currentUser = null
    $rootScope.userRoles = USER_ROLES
    $rootScope.isAuthorized = AuthService.isAuthorized
    $rootScope.setCurrentUser = (user) ->
      $scope.currentUser = user
  )