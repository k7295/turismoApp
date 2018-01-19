'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('listaFlotillaCtrl', function ($scope) {
        var vm = this;

        vm.start = start;
   
        //vm.acceptUpdate = acceptUpdate;


        vm.person = [{id: 212,firstName:"John", lastName:"Doe",marcaBus:"Hyundai"},
                     {id: 231,firstName:"Johni", lastName:"Doe",marcaBus:"Hyundai"},
                     {id: 1312,firstName:"Johnito", lastName:"Doe",marcaBus:"Hyundai"}];
   
        
        function start() {
            console.log("entro a strart");
        }

        
        
    });

