<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><g:layoutTitle default="Sistema de Interposición Automática de Demandas"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>	

        <!-- CSS ================================================== -->
        <link rel="stylesheet" href="${resource(dir:'/css/',file:'bootstrap.css')}" />        
        <link rel="stylesheet" href="${resource(dir:'/css/',file:'segrd.css')}" />
        <link rel="stylesheet" href="${resource(dir:'/css/',file:'jquery-ui.theme.css')}" />
        <link rel="stylesheet" href="${resource(dir:'/css/',file:'jquery-ui.structure.css')}" />
        <link rel="stylesheet" href="${resource(dir:'/css/',file:'jquery-ui.css')}" />
        
       <!-- jQuery ================================================== -->
        <link rel="javascript" src="${resource(dir: 'js', file: 'jquery/jquery-1.11.4.js')}"/> 
        <link rel="javascript" src="${resource(dir: 'js', file: 'jquery/jquery-ui.js')}"/> 
        <link rel="javascript" src="${resource(dir: 'js', file: 'jquery/jquery.ui.datepicker-es.js')}"/> 

        <!-- Bootstrap ================================================== --> 
        <link rel="javascript" src="${resource(dir: 'js', file: 'bootstrap/bootstrap.js')}"/> 
        
        <link rel="stylesheet" href="${resource(dir:'/css/',file:'navbar.css')}" />
        <link rel="stylesheet" href="${resource(dir:'/css/',file:'bootstrap-dropdown-multilevel.css')}" />
        <link src="${resource(dir: 'js', file: 'bootstrap/bootstrap-dropdown-multilevel.js')}"/>
        
        <g:layoutHead/>

    <r:layoutResources />
</head>
<body> 
    <!-- CABEZA ================================================== -->
    <br>
    <br>
    <div class="container">
        <div class="navbar navbar-default" role="navigation">
            <!-- LOGO Y VERSION ================================================== -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>                   
                <a class="brand">
                    <img src="${resource(dir:'images',file:'logo_previred.jpg')}" alt="Previred" border="0"/>
                </a> 
                <font color="#fff"><g:meta name="app.version"/></font>

            </div>
            <!-- MENU ================================================== -->
            <div class="navbar-collapse collapse">        
                <ul class="nav navbar-nav navbar-right">
                    <!-- INICIO ================================================== -->
                    <li id="botonInicio" >
                        <g:link controller="index">Inicio</g:link>
                    </li>
                    <li><g:link controller="solicitud" action="create">Feriado Legal</g:link></li>
                    <li id="botonInicio" >
                        <g:link controller="solicitud" action="index">Consulta solicitudes</g:link>
                    </li>
                    <li id="botonInicio" >
                        <g:link controller="solicitud" action="index">Pendientes Aprobación</g:link>
                    </li>
                    <li><g:link controller="plantilla" action="index">Mantenedor Plantillas PDF</g:link></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- CONTENIDO DE PAGINA ================================================== -->
    <div class="container">
        <g:layoutBody/>
        <r:layoutResources />   
    </div>

<!-- PIE DE PAGINA ================================================== -->
    <footer class="footer">
        <div class="container">
            <p class="text-muted"><b>©</b> <b><font color="#5a1474">PREVI</font></b><b><font color="#ff9900">RED</font></b> <b>Todos los derechos reservados.</b></p>         
        </div>
    </footer>
</body>
</html>
