'use strict';

/**
 * @ngdoc overview
 * @name webAppUsuarioApp
 * @description
 * # webAppUsuarioApp
 *
 * Main module of the application.
 */
angular
  .module('webAppUsuarioApp', [
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
        templateUrl: 'views/inicio.html',
        controller: 'MainCtrl',
        controllerAs: 'vm'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl',
        controllerAs: 'about'
      })
      .when('/tour/:NombreExcursion', {
        templateUrl: 'views/tour.html',
        controller: 'tourCtrl',
        controllerAs: 'vm'
      })
      .when('/hotel', {
        templateUrl: 'views/hoteles.html',
        controller: 'hotelCtrl',
        controllerAs: 'vm'
      })
      .when('/villas', {
        templateUrl: 'views/villas.html',
        controller: 'villasCtrl',
        controllerAs: 'vm'
      })
      .when('/listaExc', {
        templateUrl: 'views/listaExcursiones.html',
        controller: 'listaExcCtrl',
        controllerAs: 'vm'
      })
      .when('/listaHotel', {
        templateUrl: 'views/listaHoteles.html',
        controller: 'listahotelCtrl',
        controllerAs: 'vm'
      })
      .when('/listaVilla', {
        templateUrl: 'views/listaVillas.html',
        controller: 'listaVillaCtrl',
        controllerAs: 'vm'
      })
      .when('/reservar', {
        templateUrl: 'views/reservar.html',
        controller: 'reservarCtrl',
        controllerAs: 'vm'
      })
      .when('/cancelar', {
        templateUrl: 'views/cancelar.html',
        controller: 'cancelarCtrl',
        controllerAs: 'vm'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
