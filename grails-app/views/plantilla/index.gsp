
<%@ page import="proyectohackaton.Plantilla" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plantilla.label', default: 'Plantilla')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-plantilla" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-plantilla" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="plantilla.tipoSolicitud.label" default="Tipo Solicitud" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'plantilla.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="html" title="${message(code: 'plantilla.html.label', default: 'Html')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${plantillaInstanceList}" status="i" var="plantillaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${plantillaInstance.id}">${fieldValue(bean: plantillaInstance, field: "tipoSolicitud")}</g:link></td>
					
						<td><g:formatDate date="${plantillaInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: plantillaInstance, field: "html")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${plantillaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
