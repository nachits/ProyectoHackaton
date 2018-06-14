
>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitud.label', default: 'Pendiente Aprobacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-solicitud" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-solicitud" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table border="1">
			<thead>
                                <tr>
                                        <th><g:message code="solicitud.estado.label" default="N° Solicitud " /></th>
                                        <th><g:message code="solicitud.estado.label" default="Fecha ingreso  " /></th>
                                        <th><g:message code="solicitud.estado.label" default="categoria  " /></th>
                                        <th><g:message code="solicitud.estado.label" default="tiposolicitud  " /></th>
                                        <th><g:message code="solicitud.estado.label" default="colaborador  " /></th>
                                        <th><g:message code="solicitud.estado.label" default="gerencia " /></th>
                                        <th><g:message code="solicitud.estado.label" default="fecharecepcion  " /></th>
                                        
                                       
                                </tr>
                        </thead>
				<tbody>
				<g:each in="${listaParaAprobar}" status="i" var="lista">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                                <td> <div class="text-center">${lista?.numeroSolicitud} </div> </td>
                                                <td> <div class="text-center">${lista?.fechaIngreso} </div> </td>
                                                <td> <div class="text-center">${lista?.categoria} </div> </td>
                                                <td> <div class="text-center">${lista?.tipoSolicitud} </div> </td>
                                                <td> <div class="text-center">${lista?.colaborador} </div> </td>
                                                <td> <div class="text-center">${lista?.gerencia} </div> </td>
                                                <td> <div class="text-center">${lista?.fechaRecepcion} </div> </td>
                                                
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${solicitudInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
