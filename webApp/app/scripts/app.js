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
      .when('/listaReporte', {
        templateUrl: 'views/listaReporte.html',
        controller: 'listaReporteCtrl',
        controllerAs: 'vm'
      })
      .when('/galeria', {
        templateUrl: 'views/galeria.html',
        controller: 'galeriaCtrl',
        controllerAs: 'vm'
      })
      .when('/listaSitios', {
        templateUrl: 'views/listaSitios.html',
        controller: 'listaSitiosCtrl',
        controllerAs: 'vm'
      })
      .when('/listaTour', {
        templateUrl: 'views/listaTour.html',
        controller: 'listaTourCtrl',
        controllerAs: 'vm'
      })
      .when('/listaFlotilla', {
        templateUrl: 'views/listaFlotilla.html',
        controller: 'listaFlotillaCtrl',
        controllerAs: 'vm'
      })
      .when('/nuevaFlotilla', {
        templateUrl: 'views/nuevaFlotilla.html',
        controller: 'nuevaFlotillaCtrl',
        controllerAs: 'vm'
      })
      .when('/nuevoSitio', {
        templateUrl: 'views/nuevoSitio.html',
        controller: 'nuevoSitioCtrl',
        controllerAs: 'vm'
      })
      .when('/nuevoTour', {
        templateUrl: 'views/nuevoTour.html',
        controller: 'nuevoTourCtrl',
        controllerAs: 'vm'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
