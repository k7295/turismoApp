'use strict';

/**
 * @ngdoc function
 * @name webAppUsuarioApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the webAppUsuarioApp
 */
angular.module('webAppUsuarioApp')
  .controller('reservarCtrl', function ($scope,$http,$mdDialog,$window) {
    this.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];

    var vm = this;

    vm.start = start;
    vm.addReporte = addReporte;

    //vm.lugares = ["LugarX", "LugarY", "LugarW"];
    vm.reporte;
    vm.nombre;
    vm.apellido;
    vm.email;
    vm.tel;
    vm.campos;

    vm.getExcursiones;
    vm.idReservacion;
    vm.cuentaBancaria;

    vm.localhost = "localhost";

    function start() {
      console.log("entro a strart");

      $http.get('http://' + vm.localhost + ':3000/getExcursiones/').then(function (response) {
        console.log(response.data);
        $scope.vm.getExcursiones = response.data;
      });
    }


    function addReporte(){
     // console.log(vm.selectSitio);
      vm.reporte.destino = vm.selectSitio.NombreExcursion;

      console.log(vm.reporte);

   
      if(vm.reporte){
        $http.get('http://' + vm.localhost + ':3000/insertReservacion/'+vm.reporte.nombre +'/'+ vm.reporte.apellido
        +'/'+ vm.reporte.tel +'/'+ vm.reporte.campos +'/'+ vm.reporte.destino)
        .then(function (response) {
          console.log(response.data[0].idReservacion);
            vm.idReservacion = response.data[0].idReservacion;
        })

        $http.get('http://' + vm.localhost + ':3000/getExcursionInfo/'+ vm.reporte.destino).then(function (response) {
          console.log(response.data);
           vm.cuentaBancaria = response.data[0].cuentaBancaria;
        });
    }
      
     
    }
  });
