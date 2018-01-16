'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
  .controller('formFlotillasCtrl', function ($scope) {
    var vm = this;

    vm.start = start;
    vm.updatebusForm = updatebusForm;
    vm.cancelUpdate = cancelUpdate;
    //vm.acceptUpdate = acceptUpdate;
    

    vm.marcaBus = ["Mercedes-Benz", "Hyundai", "Volvo","Volkswagen","DongFeng"];
    vm.servicios = ["WIFI", "Banos", "Bar","Aire Acondicionado","TV","musica"];
    vm.choferes = ["Mengana", "Fulana", "Sutana","Mengano","Sutano","Fulano"];
    vm.edit=true;
    vm.btnAcceptCancel=false;

function start(){
    console.log("entro a strart");
}

function updatebusForm (){
    vm.edit= false;
    vm.btnAcceptCancel = !vm.edit;
}

function cancelUpdate(){
    vm.edit = true;
    vm.btnAcceptCancel = !this.edit;
}

    

  });

