'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('nuevoTourCtrl', function ($scope, $http, $window) {
        var vm = this;

        // funciones 
        vm.start = start;
        vm.addTour = addTour;

        //variables de inputs
        vm.tour;
        vm.nombre; // nombre del tour  
        vm.fecha;
        vm.fechaCuota1;
        vm.fechaCuota2;
        vm.precioNino;
        vm.precioAdultos;
        vm.precioMayores;
        vm.precioCuenta;
        vm.lugarSalida;
        vm.lugarSalida2;
        vm.lugarSalida3;
        vm.cuenta;


        vm.getVehiculo;
        vm.getDestino;
        vm.getGuia;

        vm.localhost = "192.168.0.13";

        /*
        vm.marcaBus = ["Mercedes-Benz", "Hyundai", "Volvo", "Volkswagen", "DongFeng"];
        vm.servicios = ["WIFI", "Banos", "Bar", "Aire Acondicionado", "TV", "musica"];
        vm.choferes = ["Mengana", "Fulana", "Sutana", "Mengano", "Sutano", "Fulano"];
        vm.edit = true;
        vm.btnAcceptCancel = false;
        */

        function start() {

            console.log("entro a strart");
            $http.get('http://' + vm.localhost + ':3000/getGuiasTuristicos/').then(function (response) {
                console.log(response.data);
                $scope.vm.getGuia = response.data;
            });

            $http.get('http://' + vm.localhost + ':3000/getPlacasCapacidad/').then(function (response) {
                console.log(response.data);
                $scope.vm.getVehiculo = response.data;
            });

            $http.get('http://' + vm.localhost + ':3000/getDestinos/').then(function (response) {
                console.log(response.data);
                $scope.vm.getDestino = response.data;
            });

            
        }

        function addTour() {
            console.log(vm.tour);
            var checkboxSelect = [];
            vm.tour.guia = vm.selectGuia.cedula;
            vm.tour.destino = vm.selectDestino.nombreDestino;
            vm.tour.flotilla = vm.selectFlotilla.idVehiculo;
            vm.tour.campos = vm.selectFlotilla.campos;

            if (vm.tour) {

                $("input:checkbox:checked").each(
                    function () {
                        checkboxSelect.push($(this).val());
                    });
                    console.log(checkboxSelect);
                $http.get('http://' + vm.localhost + ':3000/insertExcursion/' + vm.tour.destino + '/' +
                    vm.tour.fecha + '/' + vm.tour.lugarSalida + '/' + vm.tour.campos + '/' +
                    vm.tour.precioAdultos + '/' + vm.tour.precioMayores + '/' + vm.tour.precioNino + '/' +
                    vm.tour.guia + '/' + vm.tour.lugarSalida2 + '/' + vm.tour.lugarSalida3 + '/' + vm.tour.nombre + '/' +
                    vm.tour.fechaCuota1 + '/' + vm.tour.fechaCuota2 +'/'+ vm.tour.cuenta +'/'+vm.tour.flotilla)
                    .then(function (data) {
                        //$scope.vm.addResponse = response;
                        console.log(data);


                    });

                if (checkboxSelect.length > 0) {
                    if(checkboxSelect.length == 4){
                        $http.get('http://' + vm.localhost + ':3000/insertServicioExcursion/Todo incluido' + '/' + vm.tour.nombre)
                        .then(function (data) {
                            //$scope.vm.addResponse = response;
                            console.log(data);
                        });
                    }
                    else{
                        for (vm.i = 0; vm.i < checkboxSelect.length; vm.i++) {
                            console.log(checkboxSelect[vm.i]);
    
                            $http.get('http://' + vm.localhost + ':3000/insertServicioExcursion/' + checkboxSelect[vm.i] + '/' + vm.tour.nombre)
                                .then(function (data) {
                                    //$scope.vm.addResponse = response;
                                    console.log(data);
                                });
                        }
                    }
                    
                }

                var landingUrl = "http://" + $window.location.host + "/#!/listaTour";
                $window.location.href = landingUrl;
            }








        }




    });
