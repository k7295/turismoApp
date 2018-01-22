var express = require('express');
var http = require('http');
var mysql = require("mysql");
var app = express();
var url = require('url');
var bodyParser = require("body-parser");
var methodOverride = require('method-override');


var port = 3000;

var allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}
    
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'Deadpool',
    database : 'servicioexcursiones'
});

connection.connect(function(error) {
	if(!!error){
		console.log(error);
	} else {
		console.log("connected - " + new Date().toLocaleString());
	}
});

//Procedimientos de flotilla
//--------------------------

app.get('/insertVehiculo/:placa/:marca/:tipo/:capacidad/:mantenimiento/:cedula', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspInsertarVehiculo(?,?,?,?,?,?)', [req.params.placa,req.params.marca,req.params.tipo,
        req.params.capacidad,req.params.mantenimiento,req.params.cedula], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("vehiculo insertado: " + req.params.placa + " " +req.params.marca + " " + req.params.tipo + " " + 
        req.params.capacidad + " " + req.params.mantenimiento + " " + req.params.cedula + " > " + new Date().toLocaleString());
    });

});

//Servicios de flotilla
//--------------------------------------

app.get('/insertServicioFlotilla/:nombre/:placa', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspInsertarServicioXVehiculo(?,?)', [req.params.nombre,req.params.placa], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("servicio insertado: " + req.params.nombre + " " + req.params.placa + " > " + new Date().toLocaleString());
    });

});

app.get('/getFlotillas/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspVerVehiculos()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("todas las flotillas devueltas - " + new Date().toLocaleString());
    });

});

app.get('/getFlotillaUnica/:placa', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspVerVehiculo(?)',[req.params.placa], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("flotilla: " + req.params.placa + " devuelta - " + new Date().toLocaleString());
    });

});


app.get('/getServiciosFlotilla/:placa', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspVerServiciosXVehiculo(?)',[req.params.placa], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("servicios de flotilla: " + req.params.placa + " devueltos - " + new Date().toLocaleString());
    });

});

//todos los servicios de las flotillas
//------------------------------------
app.get('/getTodosServicios/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspVerServicios()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("todas los servicios devueltos - " + new Date().toLocaleString());
    });

});

app.get('/updateFlotilla/:placa/:marca/:tipo/:capacidad/:mantenimiento/:cedula', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspActualizarVehiculo(?,?,?,?,?,?)',[req.params.placa,req.params.marca,req.params.tipo,
        req.params.capacidad,req.params.mantenimiento,req.params.cedula], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("flotilla actualizada: " + req.params.placa + " - " + new Date().toLocaleString());
    });
1
});

app.get('/deleteFlotilla/:placa/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspBorrarVehiculo(?)',[req.params.placa], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("flotilla eliminada: " + req.params.placa + " - " + new Date().toLocaleString());
    });
1
});


//Procedimientos de categorias
//----------------------------

app.get('/insertCategoria/:nombre', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspInsertarCategoria(?)', [req.params.nombre], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("categoria insertada: " + req.params.nombre + " > " +  new Date().toLocaleString());
    });

});

app.get('/getCategoria/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspVerCategorias()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("categorias devueltas - " + new Date().toLocaleString());
    });

});

//Procedimientos de vehiculos
//---------------------------

app.get('/getTipoVehiculo/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspVerTiposVehiculos()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("tipos vehiculos devueltos - " + new Date().toLocaleString());
    });

});

app.get('/getMarcasVehiculo/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspVerMarcas()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("marcas vehiculos devueltos - " + new Date().toLocaleString());
    });

});

//Procedimientos de choferes
//--------------------------

app.get('/getChoferes/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspVerChoferes()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("choferes devueltos - " + new Date().toLocaleString());
    });

});


//Procedimientos de destinos
//--------------------------

app.get('/insertDestino/:nombre/:lugar/:categoria/:descripcion', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspInsertarDestino(?,?,?,?)', [req.params.nombre,req.params.lugar,
        req.params.categoria,req.params.descripcion], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("destino insertado: " + req.params.nombre + " " + req.params.lugar + " " + 
        req.params.categoria + " " + req.params.descripcion + " > " +  new Date().toLocaleString());
    });

});


app.get('/insertImagenDestino/:nombre/:url', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspInsertarImagenDestino(?,?)', [req.params.nombre,req.params.url], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("imagen de destino insertada: " + req.params.nombre + " " + req.params.url + " > " +  new Date().toLocaleString());
    });

});


app.get('/deleteImagen/:url', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspBorrarImagen(?)', [req.params.url], function(err, rows) {
        if (err) throw err;
        console.log("imagen eliminada: " + req.params.url + " > " +  new Date().toLocaleString());
    });

});


app.get('/getImagenesDestino/:nombre', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspVerImagenesDestino(?)', [req.params.nombre], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("imagenes de destino devueltas: " + req.params.nombre + " > " +  new Date().toLocaleString());
    });

});

app.get('/getDestinos/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspVerDestinos()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("destinos devueltos - " + new Date().toLocaleString());
    });
});

app.get('/getDestinosInfo/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspVerInfoDestinos()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("informacion de destinos devuelta - " + new Date().toLocaleString());
    });
});

app.get('/getDestinoInfo/:nombre', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspVerInfoDestino(?)',[req.params.nombre], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("informacion de destino devuelta: " + req.params.nombre + " > " + new Date().toLocaleString());
    });
});

app.get('/deleteDestino/:nombre', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspBorrarDestino(?)',[req.params.nombre], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("destino eliminado: " + req.params.nombre + " > " + new Date().toLocaleString());
    });
});


app.get('/updateDestino/:nombre/:lugar/:categoria/:descripcion', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspActualizarDestino(?,?,?,?)', [req.params.nombre,req.params.lugar,
        req.params.categoria,req.params.descripcion], function(err, rows) {
        if (err) throw err;
        console.log("destino actualizado: " + req.params.nombre + " " + req.params.lugar + " " + 
        req.params.categoria + " " + req.params.descripcion + " > " +  new Date().toLocaleString());
    });

});

//Excursiones
//-----------


app.get('/getGuiasTuristicos/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspVerGuias()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("guias devueltos - " + new Date().toLocaleString());
    });
});

app.get('/getPlacasVehiculos/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspVerVehiculos()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("placas de vehiculos devueltas - " + new Date().toLocaleString());
    });
});

app.get('/getPlacasCapacidad/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspVerPlacas()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("placas y capacidades de vehiculos devueltas - " + new Date().toLocaleString());
    });
});

app.get('/insertExcursion/:destino/:fechaSalida/:lugarSalida/:cupos/:precioAdulto/:precioAdultoMayor/:precioNino/:cedGuia/:salida2/:salida3/:nombre/:cuota1/:cuota2/:cuentaBanco/:placa', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    var sa2, sa3;
    console.log(req.params.salida2);
    console.log(req.params.salida3);
    if(req.params.salida2 == 'undefined')
    {
        sa2 = '';
    }
    else
    {
        sa2 = req.params.salida2;
    }
    if(req.params.salida3 == 'undefined')
    {
        sa3 = '';
    }
    else
    {
        sa3 = req.params.salida3;
    }
    connection.query('CALL uspInsertarExcursion(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)', [req.params.destino,req.params.fechaSalida,
        req.params.lugarSalida,req.params.cupos,req.params.precioAdulto,
        req.params.precioAdultoMayor,req.params.precioNino,req.params.cedGuia,sa2,
        sa3,req.params.nombre,req.params.cuota1,req.params.cuota2,req.params.cuentaBanco,req.params.placa], function(err, rows) {
        if (err) throw err;
        console.log("excursion insertada: " + req.params.nombre + " " + req.params.destino + " " + 
        req.params.fechaSalida + " " + req.params.lugarSalida + " " + req.params.cupos + " " + 
        req.params.precioAdulto + " " + req.params.precioAdultoMayor + " " + req.params.precioNino + " " + 
        req.params.cedGuia + " " + sa2 + " " + sa3 + " " + req.params.cuota1 + " " + 
        req.params.cuentaBanco + " " + req.params.cuota2 + " > " + req.params.placa + " > " +
        new Date().toLocaleString());
    });
});

app.get('/getExcursionInfo/:nombre', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspVerExcursion(?)',[req.params.nombre], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("excursion devuelta: "  + req.params.nombre + " > " + new Date().toLocaleString());
    });
});

app.get('/insertServicioExcursion/:nombreServicio/:nombreExcursion', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    try{
        connection.query('CALL uspInsertarServicioXExcursion(?,?)', [req.params.nombreServicio,req.params.nombreExcursion], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("servicio insertado: " + req.params.nombreServicio + " " + req.params.nombreExcursion + " > " +
        new Date().toLocaleString());
    });
    }
    catch(err)
    {
       console.log(err);
    }
    

});

app.get('/getExcursiones/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspVerExcursiones()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("excursiones devueltas - " + new Date().toLocaleString());
    });
});

app.get('/getServiciosExcursion/:nombre', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    connection.query('CALL uspVerServiciosXExcursion(?)',[req.params.nombre], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("servicios de excursion: " + req.params.nombre + " devueltos - " + new Date().toLocaleString());
    });
});

app.get('/updateExcursion/:destino/:fechaSalida/:lugarSalida/:cupos/:precioAdulto/:precioAdultoMayor/:precioNino/:cedGuia/:salida2/:salida3/:nombre/:cuota1/:cuota2/:cuentaBanco/:placa', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");
    console.log("excursion actualizada: nombre:" + req.params.nombre + " destino:" + req.params.destino + " fSalida" + 
        req.params.fechaSalida + " lugarSalida:" + req.params.lugarSalida + " cupos:" + req.params.cupos + " precioA:" + 
        req.params.precioAdulto + " precioAM:" + req.params.precioAdultoMayor + " precioNino" + req.params.precioNino + " " + 
        req.params.cedGuia + " sa2:" + sa2 + " sa3:" + sa3 + " cuota1:" + req.params.cuota1 + " cuenta:" + 
        req.params.cuentaBanco + " cuota2:" + req.params.cuota2 + " > " + req.params.placa + " > " +
        new Date().toLocaleString());
    var sa2, sa3;
    if(req.params.salida2 == 'undefined')
    {
        sa2 = '';
    }
    else
    {
        sa2 = req.params.salida2;
    }
    if(req.params.salida3 == 'undefined')
    {
        sa3 = ''    ;
    }
    else
    {
        sa3 = req.params.salida3;
    }
    connection.query('CALL uspActualizarExcursion(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)', [req.params.destino,req.params.fechaSalida,
        req.params.lugarSalida,req.params.cupos,req.params.precioAdulto,
        req.params.precioAdultoMayor,req.params.precioNino,req.params.cedGuia,sa2,
        sa3,req.params.nombre,req.params.cuota1,req.params.cuota2,req.params.cuentaBanco,req.params.placa], function(err, rows) {
        if (err) throw err;
        console.log("excursion actualizada: " + req.params.nombre + " " + req.params.destino + " " + 
        req.params.fechaSalida + " " + req.params.lugarSalida + " " + req.params.cupos + " " + 
        req.params.precioAdulto + " " + req.params.precioAdultoMayor + " " + req.params.precioNino + " " + 
        req.params.cedGuia + " " + sa2 + " " + sa3 + " " + req.params.cuota1 + " " + 
        req.params.cuentaBanco + " " + req.params.cuota2 + " > " + req.params.placa + " > " +
        new Date().toLocaleString());
    });
});


app.get('/deleteExcursion/:nombre', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspBorrarExcursion(?)',[req.params.nombre], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("excursion eliminada: "  + req.params.nombre + " > " + new Date().toLocaleString());
    });
});


//Servicios reservaciones-----------
//----------------------------------
app.get('/getReporte/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    if(req.params.nombre == 'null')
    {
        nom = '';
    }
    else
    {
        nom = req.params.nombre;
    }
    connection.query('CALL uspListarParticipantes()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("devolviendo reporte: " + " > " + new Date().toLocaleString());
    });
});



//------------------------Parte del cliente-----
//----------------------------------------------

//seccion de excursiones-----
//---------------------------
app.get('/getExcursionesCliente/', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspVerExcursionesCliente()', function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("excursiones para el cliente devueltas - " + new Date().toLocaleString());
    });
});


//Comentarios----------
//---------------------
app.get('/insertComentario/:destino/:comentario', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspInsertarComentario(?,?)',[req.params.destino,req.params.comentario], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("comentario enviado - " + req.params.destino + " " +req.params.comentario  + " > " +
        new Date().toLocaleString());
    });
});

app.get('/getComentarios/:destino', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspVerComentarioDestino(?)',[req.params.destino], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("comentarios recibidos: - " + req.params.destino + " > " +
        new Date().toLocaleString());
    });
});

//reservar excursiones
//--------------------
app.get('/insertReservacion/:nombre/:apellidos/:numeroTel/:campos/:destino', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspInsertarReservacion(?,?,?,?,?)',[req.params.nombre,req.params.apellidos,
        req.params.numeroTel,req.params.campos,req.params.destino], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("reservacion hecha: - " + req.params.nombre + " " + req.params.destino + " > " +
        new Date().toLocaleString());
    });
});


app.get('/cancelReservacion/:codigo', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL verEstadoReservacion(?)',[req.params.codigo], function(err, rows) {
        if (err) throw err;
        var response = JSON.stringify(rows[0]);
        if(response[14] === '0')
        {
            connection.query('CALL uspCancelarReservacion(?)',[req.params.codigo], function(err, rows) {
            if (err) throw err;
            resp.json(rows[0]);
            console.log("reservacion cancelada: - " + req.params.codigo + " > " +
            new Date().toLocaleString());
        });
        }
        else
        {
            resp.send("reservacion ya cancelada");
        }
    });
    
});


app.get('/pagarReservacion/:codigo/:url', function (req, resp) {
    resp.header("Access-Control-Allow-Origin", "*");
    resp.header("Access-Control-Allow-Headers", "X-Requested-With");    
    connection.query('CALL uspPrimerPagoHecho(?,?)',[req.params.codigo,req.params.url], function(err, rows) {
        if (err) throw err;
        resp.json(rows[0]);
        console.log("pago hecho: - " + req.params.codigo + " > " +
        new Date().toLocaleString());
    });
    
});

app.listen(port);
console.log("Listening on port:" + port);