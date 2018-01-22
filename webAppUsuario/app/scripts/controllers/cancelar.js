'use strict';

/**
 * @ngdoc function
 * @name webAppUsuarioApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the webAppUsuarioApp
 */
angular.module('webAppUsuarioApp')
    .controller('cancelarCtrl', function ($scope,$http,$route) {
        var vm = this;

        vm.start = start;
        vm.cancelarReservacion = cancelarReservacion;
        vm.pagarReservacion = pagarReservacion;
        
        vm.idReservacionCancelar;
        vm.idReservacion;
        vm.success = false;
        vm.localhost = "localhost";

        vm.pics = ["https://images.unsplash.com/photo-1443890923422-7819ed4101c0?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1445964047600-cdbdb873673d?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1439798060585-62ab242d7724?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1441906363162-903afd0d3d52?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1440339738560-7ea831bf5244?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600"];
 

        function start() {
            console.log("entro a strart");
            //............................
            console.log("entro a strart");
        }

        function archivo(evt) {
            var files = evt.target.files; // FileList object

            // Obtenemos la imagen del campo "file".
            for (var i = 0, f; f = files[i]; i++) {
                //Solo admitimos imágenes.
                if (!f.type.match('image.*')) {
                    continue;
                }

                var reader = new FileReader();

                reader.onload = (function (theFile) {
                    return function (e) {
                        // Insertamos la imagen
                        var id = 1;
                        document.getElementById("columnaPic").innerHTML = ['<div class="imagebox" id="id"><img class="image category-banner" src="', e.target.result, '" title="', escape(theFile.name), '" /></div>'].join('');
                    };
                })(f);

                reader.readAsDataURL(f);
            }
        }

        document.getElementById('files').addEventListener('change', archivo, false);

        function cancelarReservacion(){
            $http.get('http://' + vm.localhost + ':3000/cancelReservacion/'+ vm.idReservacionCancelar).then(function (response) {
                console.log(response.data);
              
              });

              $route.reload();
        }

        function pagarReservacion(){
            vm.file= $('input[type=file]').val().replace(/.*(\/|\\)/, '');
            console.log(vm.file);
            $http.get('http://' + vm.localhost + ':3000/pagarReservacion/'+vm.idReservacion+'/'+vm.file).then(function (response) {
                console.log(response.data);
              
              });
        }

    });

