'use strict';

/**
 * @ngdoc function
 * @name webAppUsuarioApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the webAppUsuarioApp
 */
angular.module('webAppUsuarioApp')
  .controller('reservarCtrl', function ($scope) {
    this.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];

    var vm = this;

    vm.start = start;
    vm.lugares = ["LugarX", "LugarY", "LugarW"];

    function start() {
      console.log("entro a strart");
    }
  });
