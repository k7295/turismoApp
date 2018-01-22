'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('galeriaCtrl', function ($scope,$http,$route) {
        var vm = this;

        vm.start = start;
        vm.deletePic = deletePic;
        vm.addPhoto = addPhoto;
        vm.cargarImagen = cargarImagen;

        vm.getDestino;
        vm.pics;
        vm.localhost = "localhost";

     /*  vm.pics = ["https://images.unsplash.com/photo-1443890923422-7819ed4101c0?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1445964047600-cdbdb873673d?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1439798060585-62ab242d7724?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1441906363162-903afd0d3d52?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
            "https://images.unsplash.com/photo-1440339738560-7ea831bf5244?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600"];*/
        vm.edit = true;
        vm.btnAcceptCancel = false;

        function start() {
            console.log("entro a strart");
            $http.get('http://' + vm.localhost + ':3000/getDestinos/').then(function (response) {
                console.log(response.data);
                $scope.vm.getDestino = response.data;
            });
           
        }

        function deletePic(index) {
            $http.get('http://' + vm.localhost + ':3000/deleteImagen/'+ index).then(function (response) {
                console.log(response.data);
            });
            vm.cargarImagen();
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
                        document.getElementById("columnaPic").innerHTML = ['<div class="imagebox" id="id"><img class="image category-banner" src="', e.target.result, '" title="', escape(theFile.name), '" /><a ng-click="'+vm.addPhoto()+'" type="button" class="btn btn-default btn_upd"><i class="fa fa-upload"></i></a></div>'].join('');
                    };
                })(f);

                reader.readAsDataURL(f);
            }
        }

        document.getElementById('files').addEventListener('change', archivo, false);

        // funcion para anadir imagen
        function addPhoto(){
            console.log("entra a la funcion");
            vm.destino = vm.selectDestino.nombreDestino;
            vm.file= $('input[type=file]').val().replace(/.*(\/|\\)/, '');
            console.log(vm.file);
            $http.get('http://' + vm.localhost + ':3000/insertImagenDestino/'+vm.destino+'/'+vm.file).then(function (response) {
                console.log(response.data);
            });
            vm.cargarImagen();
        }

        function cargarImagen(){
            vm.destino = vm.selectDestino.nombreDestino;
            $http.get('http://' + vm.localhost + ':3000/getImagenesDestino/'+vm.destino).then(function (response) {
                console.log(response.data);
                vm.pics = response.data;
            });
        }


    });

