'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('nuevaFlotillaCtrl', function ($scope,$http) {
        var vm = this;

        // funciones 
        vm.start = start;
        vm.addFlotilla = addFlotilla;
        // variables 
        vm.flotilla;
        vm.cedChofer;
        vm.nombreChofer;
        vm.placa;
        vm.marca;
        vm.tipoVehiculo;
        vm.capacidad;
        vm.transporteDisp;
        vm.servicios;
        vm.addResponse;

        vm.getMarca;
        vm.getTipoVehiculo;
        //192.168.0.20:3000
        vm.localhost = "192.168.0.13";

        

        //vm.acceptUpdate = acceptUpdate;

        vm.marcaBus = ["Mercedes-Benz", "Hyundai", "Toyota", "Volkswagen", "Microbus"];
        vm.servicios = ["WIFI", "Banos", "Bar", "Aire Acondicionado", "TV", "musica"];
        vm.choferes = ["Mengana", "Fulana", "Sutana", "Mengano", "Sutano", "Fulano"];

        function start() {
            console.log("entro a strart");
            $http.get('http://'+vm.localhost+':3000/getTipoVehiculo/').then(function (response) {
                       
                        $scope.vm.getTipoVehiculo = response.data;
            });
            $http.get('http://'+vm.localhost+':3000/getMarcasVehiculo/').then(function (response) {
            
                console.log(response.data);
                $scope.vm.getMarca = response.data;
    });
            
        }
        function addFlotilla() {
            var checkboxSelect = [];
            vm.flotilla.marca = vm.marca.marca;
            vm.flotilla.tipoVehiculo = vm.tipoVehiculo.tipoVehiculo;
            console.log("entro");
            if (vm.flotilla) {

                console.log(vm.flotilla);
                $("input:checkbox:checked").each(   
                    function() {
                        checkboxSelect.push($(this).val());
                       // checkboxSelect.push($(this).val());
                       // idPais.push($(this).attr('id'));
                       // console.log($(this).val());
                        
                        
                    }
                    
                );
                console.log(checkboxSelect); 

               $http.get('http://'+vm.localhost+':3000/insertVehiculo/'+vm.flotilla.placa+'/'+vm.flotilla.marca+'/'+vm.flotilla.tipoVehiculo+'/'+vm.flotilla.capacidad+'/'+vm.flotilla.cedChofer)
                .then(function(data){
                    //$scope.vm.addResponse = response;
                    console.log(data);
                });
            }

            /*$http.get('http://localhost:3000/insert/'+vm.user.firstName+'/'+vm.user.lastName)
            .success(function (data) {
              vm.user.firstName = "";
              vm.user.lastName = "";
            });*/
        }




    });