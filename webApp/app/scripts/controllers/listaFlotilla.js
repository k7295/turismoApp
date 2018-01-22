'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('listaFlotillaCtrl', function ($scope,$http,$window,$route) {
        var vm = this;

        vm.start = start;
        vm.eliminarFlotilla = eliminarFlotilla;
        vm.getflotillas;
        vm.localhost = "localhost";

   
        //vm.acceptUpdate = acceptUpdate;


       /* vm.person = [{id: 212,firstName:"John", lastName:"Doe",marcaBus:"Hyundai"},
                     {id: 231,firstName:"Johni", lastName:"Doe",marcaBus:"Hyundai"},
                     {id: 1312,firstName:"Johnito", lastName:"Doe",marcaBus:"Hyundai"}];*/
   
        
        function start() {
            console.log("entro a strart");
            $http.get('http://' + vm.localhost + ':3000/getFlotillas/')
            .then(function (response) {
                //$scope.vm.addResponse = response;
                console.log(response.data);
                $scope.vm.getflotillas = response.data;


            });
            
        }

        function eliminarFlotilla(placa){
            console.log(placa);
            $http.get('http://' + vm.localhost + ':3000/deleteFlotilla/'+placa)
            .then(function (response) {
                //$scope.vm.addResponse = response;
                console.log(response.data);
            });
            $route.reload();
        }

       


    
        
    });
    
