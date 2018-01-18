'use strict';

/**
 * @ngdoc function
 * @name webAppUsuarioApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the webAppUsuarioApp
 */
angular.module('webAppUsuarioApp')
    .controller('tourCtrl', function ($scope) {
        this.awesomeThings = [
            'HTML5 Boilerplate',
            'AngularJS',
            'Karma'
        ];

        var vm = this;

        vm.start = start;


        vm.pics = ["https://images.unsplash.com/photo-1443890923422-7819ed4101c0?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1445964047600-cdbdb873673d?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1439798060585-62ab242d7724?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1441906363162-903afd0d3d52?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1440339738560-7ea831bf5244?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600"];
        vm.servicios = ["WIFI", "Banos", "Bar", "Aire Acondicionado", "TV", "musica"];
        vm.dir = ["Salida1", "Salida2"];
        vm.categorias = ["Cabina", "Hotel", "montana", "playa"];

        vm.lenghtPics = vm.pics.length;
        console.log(vm.lenghtPics);



        function start() {
            // funcion para cargar el carusel de imagenes
            for (var i = 0; i < vm.lenghtPics; i++) {
                $('<div class="item"><img src="' + vm.pics[i] + '"><div class="carousel-caption"></div>   </div>').appendTo('.carousel-inner');
                $('<li data-target="#carousel-example-generic" data-slide-to="' + i + '"></li>').appendTo('.carousel-indicators')

            }
            $('.item').first().addClass('active');
            $('.carousel-indicators > li').first().addClass('active');
            $('#carousel-example-generic').carousel();
            //............................
            console.log("entro a strart");
        }
    });
