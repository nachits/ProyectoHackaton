
<%@ page import="proyectohackaton.Solicitud" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitud.label', default: 'Solicitud')}" />
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
                                        <th><g:message code="solicitud.estado.label" default="N° Solicitud" /></th>
                                        <g:sortableColumn property="fechaCreacion" title="${message(code: 'solicitud.fechaCreacion.label', default: 'Fecha ingreso')}" />
                                        <th><g:message code="solicitud.estado.label" default="Categoria" /></th>
                                        <th><g:message code="solicitud.estado.label" default="Tipo Solicitud" /></th>
                                        <th><g:message code="solicitud.estado.label" default="Estado" /></th>
                                        <th><g:message code="solicitud.estado.label" default="Colaborador" /></th>
                                        <th><g:message code="solicitud.estado.label" default="Gerencia" /></th>
                                        <th><g:message code="solicitud.estado.label" default="Total Autorizaciones" /></th>
                                        <th><g:message code="solicitud.estado.label" default="Total Autorizadas" /></th>
                                        <th><g:message code="solicitud.estado.label" default="Responsable Actual" /></th>
                                        <g:sortableColumn property="fechaCreacion" title="${message(code: 'solicitud.fechaCreacion.label', default: 'Fecha desde autorizacion')}" />
                                        <g:sortableColumn property="fechaCreacion" title="${message(code: 'solicitud.fechaCreacion.label', default: 'Fecha hasta autorizacion')}" />
                                        <th><g:message code="solicitud.estado.label" default="Dias transcurridos" /></th>
                                        <th><g:message code="solicitud.estado.label" default="Dias solicitados" /></th>
                                        <g:sortableColumn property="fechaCreacion" title="${message(code: 'solicitud.fechaCreacion.label', default: 'Fecha desde permiso')}" />
                                        <g:sortableColumn property="fechaCreacion" title="${message(code: 'solicitud.fechaCreacion.label', default: 'Fecha hasta permiso')}" />
                                        <th><g:message code="solicitud.estado.label" default="Saldo vacaciones" /></th>

                                </tr>
                        </thead>
				<tbody>
				<g:each in="${solicitudInstanceList}" status="i" var="solicitudInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                                <td> <div class="text-center">${solicitudInstance?.id} </div> </td>
                                                <td><g:formatDate date="${solicitudInstance.fechaCreacion}" /></td>
                                                <td> <div class="text-center">${solicitudInstance?.categoria} </div> </td>
						<td> <div class="text-center">${solicitudInstance?.tipoSolicitud} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.estado} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.colaborador} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.gerencia} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.totalAutorizaciones} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.totalAutorizados} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.responsable} </div> </td>					
						<td> <div class="text-center">${solicitudInstance?.fechaDesde} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.fechaHasta} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.diasTranscurridos} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.cantidadDias} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.fechaDesdeSolicitud} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.fechaHastaSolicitud} </div> </td>
                                                <td> <div class="text-center">${solicitudInstance?.saldoVacaciones} </div> </td>
					
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
