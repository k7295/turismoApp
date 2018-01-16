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

    vm.start = start;
    
    //vm.acceptUpdate = acceptUpdate;
    

    vm.marcaBus = ["Mercedes-Benz", "Hyundai", "Volvo","Volkswagen","DongFeng"];
    vm.servicios = ["WIFI", "Banos", "Bar","Aire Acondicionado","TV","musica"];
    vm.choferes = ["Mengana", "Fulana", "Sutana","Mengano","Sutano","Fulano"];

function start(){
    console.log("entro a strart");
}



    

  });

