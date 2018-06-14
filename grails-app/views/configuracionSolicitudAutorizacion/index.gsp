
<%@ page import="proyectohackaton.ConfiguracionSolicitudAutorizacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configuracionSolicitudAutorizacion.label', default: 'ConfiguracionSolicitudAutorizacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-configuracionSolicitudAutorizacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-configuracionSolicitudAutorizacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="activo" title="${message(code: 'configuracionSolicitudAutorizacion.activo.label', default: 'Activo')}" />
					
						<th><g:message code="configuracionSolicitudAutorizacion.colaboradorAprobador.label" default="Colaborador Aprobador" /></th>
					
						<th><g:message code="configuracionSolicitudAutorizacion.colaboradorAprobadorSuplente.label" default="Colaborador Aprobador Suplente" /></th>
					
						<g:sortableColumn property="esAprobadorFinal" title="${message(code: 'configuracionSolicitudAutorizacion.esAprobadorFinal.label', default: 'Es Aprobador Final')}" />
					
						<th><g:message code="configuracionSolicitudAutorizacion.grupoColaborador.label" default="Grupo Colaborador" /></th>
					
						<g:sortableColumn property="orden" title="${message(code: 'configuracionSolicitudAutorizacion.orden.label', default: 'Orden')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${configuracionSolicitudAutorizacionInstanceList}" status="i" var="configuracionSolicitudAutorizacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${configuracionSolicitudAutorizacionInstance.id}">${fieldValue(bean: configuracionSolicitudAutorizacionInstance, field: "activo")}</g:link></td>
					
						<td>${fieldValue(bean: configuracionSolicitudAutorizacionInstance, field: "colaboradorAprobador")}</td>
					
						<td>${fieldValue(bean: configuracionSolicitudAutorizacionInstance, field: "colaboradorAprobadorSuplente")}</td>
					
						<td><g:formatBoolean boolean="${configuracionSolicitudAutorizacionInstance.esAprobadorFinal}" /></td>
					
						<td>${fieldValue(bean: configuracionSolicitudAutorizacionInstance, field: "grupoColaborador")}</td>
					
						<td>${fieldValue(bean: configuracionSolicitudAutorizacionInstance, field: "orden")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${configuracionSolicitudAutorizacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
