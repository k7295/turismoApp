'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('listaSitiosCtrl', function ($scope,$http,$route) {
        var vm = this;

        vm.start = start;
        vm.eliminarSitio = eliminarSitio;

        vm.getDestinos;
        vm.localhost = "localhost";
   
        //vm.acceptUpdate = acceptUpdate;

        vm.person = [{nombre:"lugarX",categoria:"montana",fechaSalida:"25/deb/2018"},
        {nombre:"lugarX",categoria:"playa",fechaSalida:"25/deb/2018"},
        {nombre:"lugarX",categoria:"playa",fechaSalida:"25/deb/2018"}];
   
        
        function start() {
            console.log("entro a strart");
            $http.get('http://' + vm.localhost + ':3000/getDestinosInfo/')
            .then(function (response) {
                //$scope.vm.addResponse = response;
                console.log(response.data);
                vm.getDestinos = response.data;
            });
        }

        function eliminarSitio(destino){
            console.log(destino);
            $http.get('http://' + vm.localhost + ':3000/deleteDestino/'+destino)
            .then(function (response) {
                //$scope.vm.addResponse = response;
                console.log(response.data);
            });
            $route.reload();
        }

        
        
    });

