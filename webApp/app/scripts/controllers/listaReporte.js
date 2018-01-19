'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('listaReporteCtrl', function ($scope) {
        var vm = this;

        vm.start = start;
        //vm.acceptUpdate = acceptUpdate;


    
        vm.person = [{firstName:"John", lastName:"Doe", campos:5, fechaSalida:"25/feb/2018", lugar:"X",cancelarMonto:"S"},
        {firstName:"Johni", lastName:"Doe", campos:2, fechaSalida:"15/mar/2018", lugar:"Y",cancelarMonto:"S"},
        {firstName:"Johnito", lastName:"Doe", campos:4, fechaSalida:"25/feb/2018", lugar:"X",cancelarMonto:"N"}];


        function start() {
            console.log("entro a strart");
        }

    });
