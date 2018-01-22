'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('listaTourCtrl', function ($scope,$http,$route) {
        var vm = this;

        vm.start = start;
        vm.eliminarTour = eliminarTour;
        //vm.acceptUpdate = acceptUpdate;


     /*   vm.person = [{nombre:"lugarX",direccion:"por ahi",cantCampos:40,fechaSalida:"25/deb/2018"},
                    {nombre:"lugarX",direccion:"por ahi",cantCampos:40,fechaSalida:"25/deb/2018"},
                    {nombre:"lugarX",direccion:"por ahi",cantCampos:40,fechaSalida:"25/deb/2018"}];
     */
        vm.localhost = "192.168.0.13";
        vm.getTour;
        function start() {
            console.log("entro a strart");
            $http.get('http://' + vm.localhost + ':3000/getExcursiones/')
            .then(function (response) {
                //$scope.vm.addResponse = response;
                console.log(response.data);
                vm.getTour = response.data;
            });
        }
        function eliminarTour(tour){
            console.log(tour);
            $http.get('http://' + vm.localhost + ':3000/deleteExcursion/'+tour)
            .then(function (response) {
                //$scope.vm.addResponse = response;
                console.log(response.data);
            });
            $route.reload();
        }
        
        
    });

