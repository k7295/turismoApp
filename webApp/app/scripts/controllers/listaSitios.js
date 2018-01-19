'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('listaSitiosCtrl', function ($scope) {
        var vm = this;

        vm.start = start;
   
        //vm.acceptUpdate = acceptUpdate;

        vm.person = [{nombre:"lugarX",categoria:"montana",fechaSalida:"25/deb/2018"},
        {nombre:"lugarX",categoria:"playa",fechaSalida:"25/deb/2018"},
        {nombre:"lugarX",categoria:"playa",fechaSalida:"25/deb/2018"}];
   
        
        function start() {
            console.log("entro a strart");
        }

        
        
    });

