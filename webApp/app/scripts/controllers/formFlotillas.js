'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('formFlotillasCtrl', function ($scope, $routeParams, $http,$window,$route) {
        var vm = this;

        vm.start = start;
        vm.updatebusForm = updatebusForm;
        vm.cancelUpdate = cancelUpdate;

        vm.acceptUpdate = acceptUpdate;

        vm.flotilla;
        vm.placa;
        vm.getMarca;
        vm.tipoVehiculo;
        vm.campos;
        vm.enMatenimiento;
        vm.chofer;
        vm.getServicios;
        vm.getTipoVehiculo;
        vm.servicioFlotilla;
        vm.getChofer;
        /*
        vm.marcaBus = ["Mercedes-Benz", "Hyundai", "Volvo","Volkswagen","DongFeng"];
        vm.servicios = ["WIFI", "Banos", "Bar","Aire Acondicionado","TV","musica"];
        vm.choferes = ["Mengana", "Fulana", "Sutana","Mengano","Sutano","Fulano"];*/
        vm.edit = true;
        vm.btnAcceptCancel = false;

        vm.localhost = "localhost";

        function start() {
            console.log("entro a strart");
            console.log($routeParams);
            
            $http.get('http://' + vm.localhost + ':3000/getFlotillaUnica/' + $routeParams.placa).then(function (response) {
                console.log(response.data[0]);
                vm.flotilla = response.data[0];
            });

            $http.get('http://' + vm.localhost + ':3000/getTipoVehiculo/').then(function (response) {
                
                                vm.getTipoVehiculo = response.data;
                            });
            $http.get('http://' + vm.localhost + ':3000/getTodosServicios/').then(function (response) {
                console.log(response.data);
                vm.getServicios = response.data;
            });

            $http.get('http://' + vm.localhost + ':3000/getServiciosFlotilla/' + $routeParams.placa).then(function (response) {
                console.log(response.data);
                vm.servicioFlotilla = response.data;
            });
            $http.get('http://' + vm.localhost + ':3000/getMarcasVehiculo/').then(function (response) {

                console.log(response.data);
                vm.getMarca = response.data;
            });
            $http.get('http://' + vm.localhost + ':3000/getChoferes/').then(function (response) {
                console.log(response.data);
                $scope.vm.getChofer = response.data;
            });

        }

        function updatebusForm() {
            vm.edit = false;
            vm.btnAcceptCancel = !vm.edit;
        }

        function cancelUpdate() {
            vm.edit = true;
            vm.btnAcceptCancel = !this.edit;
        }

        function acceptUpdate() {
            var checkboxSelect=[];
            var uncheckboxSelect=[];
            vm.flotilla.marca = vm.selectMarca.marca;
            vm.flotilla.tipoVehiculo = vm.selectTipo.tipoVehiculo;

            vm.flotilla.cedChofer = vm.chofer.cedula;
            console.log(vm.flotilla.cedChofer);
            console.log(vm.flotilla.enMantemiento);

            if (vm.flotilla.enMatenimiento) {
                vm.flotilla.enMatenimiento = 1;
            } else { vm.flotilla.enMatenimiento = 0 };

            console.log(vm.flotilla.enMatenimiento);
            

            vm.flotilla.marca = vm.selectMarca.marca;
            
                console.log(vm.flotilla);
                $("input:checkbox[id^=selectServicios]:checked").each(
                    function () {
                        checkboxSelect.push($(this).val());

                    });

                console.log(checkboxSelect);

              $http.get('http://' + vm.localhost + ':3000/updateFlotilla/' + vm.flotilla.placa + '/' + vm.flotilla.marca + '/' + vm.flotilla.tipoVehiculo + '/' + vm.flotilla.campos + '/' + vm.flotilla.enMatenimiento + '/' + vm.flotilla.cedChofer)
                .then(function (data) {
                    //$scope.vm.addResponse = response;
                    console.log(data);

                });


                if (checkboxSelect.length > 0) {                    
                    for (vm.i = 0; vm.i < checkboxSelect.length; vm.i++) {
                        console.log(checkboxSelect[vm.i]);

                        $http.get('http://' + vm.localhost + ':3000/insertServicioFlotilla/' + checkboxSelect[vm.i] + '/' + vm.flotilla.placa)
                            .then(function (data) {
                                //$scope.vm.addResponse = response;
                                console.log(data);
                            });
                    }
               

                    $route.reload();
            }



        }



    });

