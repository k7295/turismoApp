'use strict';

/**
 * @ngdoc overview
 * @name webAppApp
 * @description
 * # webAppApp
 *
 * Main module of the application.
 */
angular
  .module('webAppApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ngMaterial'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl',
        controllerAs: 'about'
      })
      .when('/formFlotillas', {
        templateUrl: 'views/formFlotillas.html',
        controller: 'formFlotillasCtrl',
        controllerAs: 'vm'
      })
      .when('/formSitios', {
        templateUrl: 'views/formSitios.html',
        controller: 'formSitiosCtrl',
        controllerAs: 'vm'
      })
      .when('/formTour', {
        templateUrl: 'views/formTour.html',
        controller: 'formTourCtrl',
        controllerAs: 'vm'
      })
      .when('/formReporte', {
        templateUrl: 'views/formReporte.html',
        controller: 'formReporteCtrl',
        controllerAs: 'vm'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
