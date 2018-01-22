'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('formSitiosCtrl', function ($scope,$routeParams,$http,$route) {
        var vm = this;

        vm.start = start;
        vm.updateSitiosForm = updateSitiosForm;
        vm.cancelUpdate = cancelUpdate;
        vm.localhost = "localhost";

        vm.sitio;
        vm.nombreDestino;
        vm.lugar;
        vm.descripcion;
        vm.getCategoria;
        
        vm.acceptUpdate = acceptUpdate;


        /*vm.marcaBus = ["Mercedes-Benz", "Hyundai", "Volvo", "Volkswagen", "DongFeng"];
        vm.servicios = ["WIFI", "Banos", "Bar", "Aire Acondicionado", "TV", "musica"];
        vm.choferes = ["Mengana", "Fulana", "Sutana", "Mengano", "Sutano", "Fulano"];
        vm.categorias = ["Cabina", "Hotel", "montana", "playa"];*/

        vm.getDestino;
        vm.edit = true;
        vm.btnAcceptCancel = false;

        function start() {
            console.log("entro a strart");
            console.log($routeParams);
            $http.get('http://' + vm.localhost + ':3000/getDestinoInfo/'+ $routeParams.nombreDestino).then(function (response) {
                console.log(response.data[0]);
                vm.sitio = response.data[0];
            });

            $http.get('http://' + vm.localhost + ':3000/getCategoria/').then(function (response) {
                console.log(response.data);
                vm.getCategoria = response.data;
            });
        }

        function updateSitiosForm() {
            vm.edit = false;
            vm.btnAcceptCancel = !vm.edit;
        }

        function cancelUpdate() {
            vm.edit = true;
            vm.btnAcceptCancel = !this.edit;
        }

        function acceptUpdate(){
            console.log(vm.selectCategoria);
            vm.sitio.categoriaSelect = vm.selectCategoria.categoria;
            $http.get('http://' + vm.localhost + ':3000/updateDestino/'+ vm.sitio.nombreDestino +'/'+ vm.sitio.lugar +'/'+ vm.sitio.categoriaSelect +'/'+ vm.sitio.descripcion).then(function (response) {
                console.log(response.data);
            });
            $route.reload();
        }


    });

