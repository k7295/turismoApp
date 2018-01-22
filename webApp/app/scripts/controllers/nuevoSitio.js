'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('nuevoSitioCtrl', function ($scope, $http,$window) {
        var vm = this;

        vm.start = start;
        vm.addSitio = addSitio;

        // variables
        vm.sitio;
        vm.nombre;
        vm.dir;
        vm.descripcion;

        vm.selectCategoria;
        vm.getCategoria;
      

        //vm.acceptUpdate = acceptUpdate;
        vm.localhost = "192.168.0.13";

       /* vm.marcaBus = ["Mercedes-Benz", "Hyundai", "Volvo", "Volkswagen", "DongFeng"];
        vm.servicios = ["WIFI", "Banos", "Bar", "Aire Acondicionado", "TV", "musica"];
        vm.choferes = ["Mengana", "Fulana", "Sutana", "Mengano", "Sutano", "Fulano"];
        vm.categorias = ["Cabina", "Hotel", "montana", "playa"];*/
        

        function start() {
            console.log("entro a strart");
            $http.get('http://' + vm.localhost + ':3000/getCategoria/').then(function (response) {
                console.log(response.data);
                $scope.vm.getCategoria = response.data;
            });
            
        }


        function addSitio() {
            console.log(vm.sitio);
            vm.sitio.categoria = vm.selectCategoria.categoria;
            console.log(vm.sitio.categoria);

            if(vm.sitio){
                $http.get('http://'+vm.localhost+':3000/insertDestino/'+vm.sitio.nombre+'/'+vm.sitio.dir+'/'+vm.sitio.categoria+'/'+vm.sitio.descripcion)
                .then(function(data){
                    //$scope.vm.addResponse = response;
                    console.log(data);
                });
            }

            var landingUrl = "http://" + $window.location.host + "/#!/listaSitios";
            $window.location.href = landingUrl;
            
        }





    });

