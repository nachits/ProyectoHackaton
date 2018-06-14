
>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitud.label', default: 'Pendiente Aprobacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="list-solicitud" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
                        <g:form url="[controller:'solicitud', action:'aprobacion']" class="form-horizontal form-medium" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
			<thead>
                                <tr>
                                        <th> <div class="text-center"> <g:checkBox name="seleccionaTodos"/> </div> </th>
                                        <th><g:message code="solicitud.estado.label" default="N° Solicitud " /></th>
                                        <th><g:message code="solicitud.estado.label" default="Fecha ingreso  " /></th>
                                        <th><g:message code="solicitud.estado.label" default="categoria  " /></th>
                                        <th><g:message code="solicitud.estado.label" default="tiposolicitud  " /></th>
                                        <th><g:message code="solicitud.estado.label" default="colaborador  " /></th>
                                        <th><g:message code="solicitud.estado.label" default="gerencia " /></th>
                                        <th><g:message code="solicitud.estado.label" default="fecharecepcion  " /></th>
                                        <th><g:message code="solicitud.estado.label" default="Solicitud PDF" /></th>
                                       
                                </tr>
                        </thead>
				<tbody>
				<g:each in="${listaParaAprobar}" status="i" var="lista">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                                <td> <div class="text-center"> <g:checkBox name="seleccion" id="seleccion"  checked="${false}" /> </div> </td>
                                                <td> <div class="text-center">${lista?.numeroSolicitud} </div> </td>
                                                <td> <div class="text-center">${lista?.fechaIngreso} </div> </td>
                                                <td> <div class="text-center">${lista?.categoria} </div> </td>
                                                <td> <div class="text-center">${lista?.tipoSolicitud} </div> </td>
                                                <td> <div class="text-center">${lista?.colaborador} </div> </td>
                                                <td> <div class="text-center">${lista?.gerencia} </div> </td>
                                                <td> <div class="text-center">${lista?.fechaRecepcion} </div> </td>
                                                <td><g:link type="button" class="btn btn-primary" action="generacionArchivo" id="${lista?.numeroSolicitud}">
                                                        Ver Documento
                                                    </g:link>
                                                </td>
					</tr>
				</g:each>
				</tbody>
			</table>
                        
                        <g:submitButton name="entra" value="Aprobar"  />
                        <g:submitButton name="entra" value="Rechazar"  />
                           </g:form>
                        
			<div class="pagination">
				<g:paginate total="${solicitudInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
