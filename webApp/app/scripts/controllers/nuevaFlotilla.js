'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('nuevaFlotillaCtrl', function ($scope, $http) {
        var vm = this;

        // funciones 
        vm.start = start;
        vm.addFlotilla = addFlotilla;
        // variables 
        vm.flotilla;

        vm.chofer;
        vm.placa;
        vm.marca;
        vm.tipoVehiculo;
        vm.capacidad;
        vm.transporteDisp;
        vm.servicios;
        vm.addResponse;

        vm.getMarca;
        vm.getTipoVehiculo;
        vm.getChofer;
        //192.168.0.20:3000

        vm.localhost = "192.168.0.13";



        //vm.acceptUpdate = acceptUpdate;

        //  vm.marcaBus = ["Mercedes-Benz", "Hyundai", "Toyota", "Volkswagen", "Microbus"];
        vm.servicios = ["WIFI", "Banos", "Bar", "Aire Acondicionado", "TV", "musica"];
        // vm.choferes = ["Mengana", "Fulana", "Sutana", "Mengano", "Sutano", "Fulano"];

        function start() {
            console.log("entro a strart");
            $http.get('http://' + vm.localhost + ':3000/getTipoVehiculo/').then(function (response) {

                $scope.vm.getTipoVehiculo = response.data;
            });
            $http.get('http://' + vm.localhost + ':3000/getMarcasVehiculo/').then(function (response) {

                console.log(response.data);
                $scope.vm.getMarca = response.data;
            });
            $http.get('http://' + vm.localhost + ':3000/getChoferes/').then(function (response) {
                console.log(response.data);
                $scope.vm.getChofer = response.data;
            });

        }

        function addFlotilla() {
            var checkboxSelect = [];
            vm.flotilla.marca = vm.marca.marca;
            vm.flotilla.tipoVehiculo = vm.tipoVehiculo.tipoVehiculo;

            vm.flotilla.cedChofer = vm.chofer.cedula;
            console.log(vm.flotilla.cedChofer);
            console.log(vm.flotilla.transporteDisp);
            if (vm.flotilla.transporteDisp) {
                vm.flotilla.transporteDisp = 1;
            } else { vm.flotilla.transporteDisp = 0 };
            if (vm.flotilla) {

                console.log(vm.flotilla);
                $("input:checkbox[id^=selectServicios]:checked").each(
                    function () {
                        checkboxSelect.push($(this).val());



                        // checkboxSelect.push($(this).val());
                        // idPais.push($(this).attr('id'));
                        // console.log($(this).val());




                    });
               

                console.log(checkboxSelect);
                console.log(vm.flotilla.transporteDisp);

                $http.get('http://' + vm.localhost + ':3000/insertVehiculo/' + vm.flotilla.placa + '/' + vm.flotilla.marca + '/' + vm.flotilla.tipoVehiculo + '/' + vm.flotilla.capacidad + '/' + vm.flotilla.transporteDisp + '/' + vm.flotilla.cedChofer)
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
                }




                /*$http.get('http://localhost:3000/insert/'+vm.user.firstName+'/'+vm.user.lastName)
                .success(function (data) {
                  vm.user.firstName = "";
                  vm.user.lastName = "";
                });*/
            }

        }


    });