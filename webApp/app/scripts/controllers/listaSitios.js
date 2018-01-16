'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('listaSitiosCtrl', function ($scope) {
        var vm = this;

        vm.start = start;
   
        //vm.acceptUpdate = acceptUpdate;


        vm.person = [{firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"},
                     {firstName:"Johni", lastName:"Doe", age:50, eyeColor:"blue"},
                     {firstName:"Johnito", lastName:"Doe", age:50, eyeColor:"blue"}];
   
        
        function start() {
            console.log("entro a strart");
        }

        
        
    });

