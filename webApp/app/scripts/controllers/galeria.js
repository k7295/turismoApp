'use strict';

/**
 * @ngdoc function
 * @name webAppApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the webAppApp
 */
angular.module('webAppApp')
    .controller('galeriaCtrl', function ($scope) {
        var vm = this;

        vm.start = start;
        vm.deletePic = deletePic;
    

        vm.pics = ["https://images.unsplash.com/photo-1443890923422-7819ed4101c0?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
        "https://images.unsplash.com/photo-1445964047600-cdbdb873673d?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
        "https://images.unsplash.com/photo-1439798060585-62ab242d7724?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600",
        "https://images.unsplash.com/photo-1441906363162-903afd0d3d52?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600", 
        "https://images.unsplash.com/photo-1440339738560-7ea831bf5244?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600"];
        vm.edit = true;
        vm.btnAcceptCancel = false;
        
        function start() {
            console.log("entro a strart");
        }

        function deletePic(){
            var n = document.getElementById("https://images.unsplash.com/photo-1440339738560-7ea831bf5244?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600");
            n.remove();
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
          
              reader.onload = (function(theFile) {
              return function(e) {
                // Insertamos la imagen
                var id = 1;
               document.getElementById("columnaPic").innerHTML = ['<div class="imagebox" id="id"><img class="image category-banner" src="', e.target.result,'" title="', escape(theFile.name), '"/><span class="imagebox-desc">holi</span><a ng-click="vm.addPhoto()" type="button" class="btn btn-default btn_upd"><i class="fa fa-upload"></i></a><a ng-click="vm.deletePic()" type="button" class="btn btn-default btn_acept"><i class="fa fa-trash-o" aria-hidden="true"></i></a></a></div>'].join('');   
              };
              })(f);
          
              reader.readAsDataURL(f);
            }
            }
          
            document.getElementById('files').addEventListener('change', archivo, false);
        
        
    });

