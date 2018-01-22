'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('formTourCtrl', function ($scope, $http, $routeParams,$window) {
        var vm = this;

        vm.start = start;
        vm.updateTourForm = updateTourForm;
        vm.cancelUpdate = cancelUpdate;
        vm.acceptUpdate = acceptUpdate;


        /* vm.marcaBus = ["Mercedes-Benz", "Hyundai", "Volvo", "Volkswagen", "DongFeng"];
         vm.servicios = ["WIFI", "Banos", "Bar", "Aire Acondicionado", "TV", "musica"];
         vm.choferes = ["Mengana", "Fulana", "Sutana", "Mengano", "Sutano", "Fulano"];*/
        vm.getVehiculo;
        vm.getDestino;
        vm.getServicios;
        vm.tour;
        vm.NombreExcursion;
        vm.nombreDestino;
        vm.cuposDisponibles;
        vm.correo;
        vm.guia;
        vm.fechaHoraSalida;
        vm.fechaPrimerPago;
        vm.fechaLimite;
        vm.precioNino;
        vm.precioAdulto;
        vm.precioAdultoM;
        vm.cuentaBancaria;
        vm.lugarSalida;
        vm.lugarSalida2;
        vm.lugarSalida3;
        vm.idVehiculo;

        vm.edit = true;
        vm.btnAcceptCancel = false;
        vm.localhost = "192.168.0.17";


        function start() {
            console.log("entro a strart");
            console.log($routeParams);
            $http.get('http://' + vm.localhost + ':3000/getExcursionInfo/' + $routeParams.nombreTour).then(function (response) {
                console.log(response.data[0]);
                vm.tour = response.data[0];
            });
            $http.get('http://' + vm.localhost + ':3000/getPlacasCapacidad/').then(function (response) {
                console.log(response.data);
                vm.getVehiculo = response.data;
            });

            $http.get('http://' + vm.localhost + ':3000/getDestinos/').then(function (response) {
                console.log(response.data);
                vm.getDestino = response.data;
            });
            $http.get('http://' + vm.localhost + ':3000/getGuiasTuristicos/').then(function (response) {
                console.log(response.data);
                vm.getGuia = response.data;
            });
            $http.get('http://' + vm.localhost + ':3000/getServiciosExcursion/'+$routeParams.nombreTour).then(function (response) {
                console.log(response.data);
                vm.getServicios = response.data;
            });
        }

        function updateTourForm() {
            vm.edit = false;
            vm.btnAcceptCancel = !vm.edit;
        }

        function cancelUpdate() {
            vm.edit = true;
            vm.btnAcceptCancel = !this.edit;
        }

        function acceptUpdate() {
            var checkboxSelect = [];
            vm.tour.guia = vm.selectGuia.cedula;
            vm.tour.nombreDestino = vm.selectDestino.nombreDestino;
            vm.tour.flotilla = vm.selectFlotilla.idVehiculo;
            vm.tour.campos = vm.selectFlotilla.campos;
            console.log(vm.tour);
            if (vm.tour) {

                $("input:checkbox:checked").each(
                  function () {
                    checkboxSelect.push($(this).val());
                });
                console.log(checkboxSelect);
                 $http.get('http://' + vm.localhost + ':3000/updateExcursion/' + vm.tour.nombreDestino + '/' +
                    vm.tour.fechaHoraSalida + '/' + vm.tour.lugarSalida + '/' + vm.tour.campos + '/' +
                    vm.tour.precioAdulto + '/' + vm.tour.precioAdultoM + '/' + vm.tour.precioNino + '/' +
                    vm.tour.guia + '/' + vm.tour.lugarSalida2 + '/' + vm.tour.lugarSalida3 + '/' + vm.tour.NombreExcursion + '/' +
                    vm.tour.fechaPrimerPago + '/' + vm.tour.fechaLimite + '/' + vm.tour.cuentaBancaria + '/' + vm.tour.flotilla)
                    .then(function (data) {
                        //$scope.vm.addResponse = response;
                        console.log(data);


                    });

                if (checkboxSelect.length > 0) {
                    if (checkboxSelect.length == 4) {
                        $http.get('http://' + vm.localhost + ':3000/insertServicioExcursion/Todo incluido' + '/' + vm.tour.NombreExcursion)
                            .then(function (data) {
                                //$scope.vm.addResponse = response;
                                console.log(data);
                            });
                    }
                    else {
                        for (vm.i = 0; vm.i < checkboxSelect.length; vm.i++) {
                            console.log(checkboxSelect[vm.i]);

                            $http.get('http://' + vm.localhost + ':3000/insertServicioExcursion/' + checkboxSelect[vm.i] + '/' +  vm.tour.NombreExcursion)
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

