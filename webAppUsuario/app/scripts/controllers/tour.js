'use strict';

/**
 * @ngdoc function
 * @name webAppUsuarioApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the webAppUsuarioApp
 */
angular.module('webAppUsuarioApp')
    .controller('tourCtrl', function ($scope, $http, $routeParams,$route) {
        this.awesomeThings = [
            'HTML5 Boilerplate',
            'AngularJS',
            'Karma'
        ];

        var vm = this;

        vm.start = start;
        vm.addComentario = addComentario;
        vm.localhost = "192.168.0.17";

        /* vm.pics = ["https://images.unsplash.com/photo-1443890923422-7819ed4101c0?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
             "https://images.unsplash.com/photo-1445964047600-cdbdb873673d?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
             "https://images.unsplash.com/photo-1439798060585-62ab242d7724?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
             "https://images.unsplash.com/photo-1441906363162-903afd0d3d52?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
             "https://images.unsplash.com/photo-1440339738560-7ea831bf5244?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600"];
         vm.servicios = ["WIFI", "Banos", "Bar", "Aire Acondicionado", "TV", "musica"];*/
        vm.dir = ["Salida1", "Salida2"];
        vm.categorias = ["Cabina", "Hotel", "montana", "playa"];


        console.log(vm.lenghtPics);

        vm.tour;
        vm.servicioFlotilla;
        vm.servicioExcursion;
        vm.pics;
        vm.comentario;
        vm.getComentarios;

        

        function start() {

            //............................
            console.log("entro a strart");
            console.log($routeParams);
            infoExcursion();
        }

        // funcion para obtener toda la informacion necesario para el formulario de excursion
        function infoExcursion(){
            $http.get('http://' + vm.localhost + ':3000/getExcursionInfo/' + $routeParams.NombreExcursion).then(function (response) {
                console.log(response.data[0]);
                vm.tour = response.data[0];

            }).then(function (response) {
                console.log(vm.tour.idVehiculo)
                /*---------------------------------------------- */
                /*-------- cargar servicioxflotilla ----------- */
                /*---------------------------------------------- */
                servicioFlotilla();
                /*---------------------------------------------- */
                /*------------ cargar comentarios -------------- */
                /*---------------------------------------------- */
                cargarComentarios();
                /*---------------------------------------------- */
                /*-------- cargar imagenes por destino ----------- */
                /*---------------------------------------------- */
                $http.get('http://' + vm.localhost + ':3000/getImagenesDestino/' + vm.tour.nombreDestino).then(function (response) {
                    console.log(response.data);
                    vm.pics = response.data;
                }).then(function (response) {
                    var lenghtPics = vm.pics.length;
                    // funcion para cargar el carusel de imagenes
                    
                    for (var i = 0; i < lenghtPics; i++) {
                        console.log(vm.pics[i].url);
                        $('<div class="item"><img src=images/' +  vm.pics[i].url + '><div class="carousel-caption"></div>   </div>').appendTo('.carousel-inner');
                        $('<li data-target="#carousel-example-generic" data-slide-to="' + i + '"></li>').appendTo('.carousel-indicators')
    
                    }
                    $('.item').first().addClass('active');
                    $('.carousel-indicators > li').first().addClass('active');
                    $('#carousel-example-generic').carousel();
                });
            });
            serviciosExcursion();
        }

        // funcion de servicios por excursion
        function serviciosExcursion(){
            $http.get('http://' + vm.localhost + ':3000/getServiciosExcursion/' + $routeParams.NombreExcursion).then(function (response) {
                console.log(response.data);
                vm.servicioExcursion = response.data;
            });
        }

        function servicioFlotilla(){
            $http.get('http://' + vm.localhost + ':3000/getServiciosFlotilla/' + vm.tour.idVehiculo).then(function (response) {
                console.log(response.data);
                vm.servicioFlotilla = response.data;
            });
        }
        function cargarComentarios(){
            $http.get('http://' + vm.localhost + ':3000/getComentarios/' + vm.tour.nombreDestino).then(function (response) {
                console.log(response.data);
                vm.getComentarios = response.data;
            });
        }

      

        // funcion para anadir comentario
        function addComentario(){
            console.log(vm.comentario);
            if(vm.comentario){
                $http.get('http://' + vm.localhost + ':3000/insertComentario/' + vm.tour.nombreDestino +'/'+ vm.comentario).then(function (response) {
                    console.log(response.data);
                
                });
            }
            cargarComentarios();
            
        }
    });
