'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('listaTourCtrl', function ($scope) {
        var vm = this;

        vm.start = start;
        //vm.acceptUpdate = acceptUpdate;


        vm.person = [{nombre:"lugarX",direccion:"por ahi",cantCampos:40,fechaSalida:"25/deb/2018"},
                    {nombre:"lugarX",direccion:"por ahi",cantCampos:40,fechaSalida:"25/deb/2018"},
                    {nombre:"lugarX",direccion:"por ahi",cantCampos:40,fechaSalida:"25/deb/2018"}];
     
        
        function start() {
            console.log("entro a strart");
        }
        
        
    });

