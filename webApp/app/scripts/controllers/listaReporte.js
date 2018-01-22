'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('listaReporteCtrl', function ($scope,$http) {
        var vm = this;

        vm.start = start;
        vm.getDestino;
        //vm.acceptUpdate = acceptUpdate;
        vm.localhost = "localhost";
        vm.reporte;
       
       
       /* vm.person = [{firstName:"John", lastName:"Doe", campos:5, fechaSalida:"25/feb/2018", lugar:"X",cancelarMonto:"S"},
        {firstName:"Johni", lastName:"Doe", campos:2, fechaSalida:"15/mar/2018", lugar:"Y",cancelarMonto:"S"},
        {firstName:"Johnito", lastName:"Doe", campos:4, fechaSalida:"25/feb/2018", lugar:"X",cancelarMonto:"N"}];*/


        function start() {
            console.log("entro a strart");
            $http.get('http://' + vm.localhost + ':3000/getReporte/')
            .then(function (response) {
                //$scope.vm.addResponse = response;
                console.log(response.data);
                
                vm.reporte = response.data;

            });
            $http.get('http://' + vm.localhost + ':3000/getDestinos/').then(function (response) {
                console.log(response.data);
                $scope.vm.getDestino = response.data;
            });
            
        }



    });
