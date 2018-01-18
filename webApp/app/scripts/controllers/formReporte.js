'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('formReporteCtrl', function ($scope) {
        var vm = this;

        vm.start = start;
        //vm.acceptUpdate = acceptUpdate;


      
        vm.lugares = ["Catarata", "Rios", "Isla", "Playa", "Hotel", "Bosque"];
        vm.edit = true;
        vm.btnAcceptCancel = false;


        function start() {
            console.log("entro a strart");
        }





    });
