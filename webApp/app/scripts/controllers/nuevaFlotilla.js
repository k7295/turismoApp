'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
  .controller('nuevaFlotillaCtrl', function ($scope) {
    var vm = this;

// funciones 
    vm.start = start;
    vm.addFlotilla = addFlotilla;
// variables 
	vm.flotilla;
	vm.cedChofer;
	vm.placa;
	vm.marca;
	vm.tipoVehiculo;
	vm.capacidad;
	vm.transporteDisp;
	vm.servicios;

    //vm.acceptUpdate = acceptUpdate;
   
    vm.marcaBus = ["Mercedes-Benz", "Hyundai", "Volvo","Volkswagen","DongFeng"];
    vm.servicios = ["WIFI", "Banos", "Bar","Aire Acondicionado","TV","musica"];
    vm.choferes = ["Mengana", "Fulana", "Sutana","Mengano","Sutano","Fulano"];

function start(){
    console.log("entro a strart");
}
 function addFlotilla(){
 		if(vm.flotilla){
 			console.log(vm.flotilla);
 		}
        
        /*$http.get('http://localhost:3000/insert/'+vm.user.firstName+'/'+vm.user.lastName)
        .success(function (data) {
          vm.user.firstName = "";
          vm.user.lastName = "";
        });*/
    }


    

  });