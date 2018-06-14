
<%@ page import="proyectohackaton.EstadoFlujoSolicitud" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estadoFlujoSolicitud.label', default: 'EstadoFlujoSolicitud')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-estadoFlujoSolicitud" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-estadoFlujoSolicitud" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'estadoFlujoSolicitud.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="glosa" title="${message(code: 'estadoFlujoSolicitud.glosa.label', default: 'Glosa')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${estadoFlujoSolicitudInstanceList}" status="i" var="estadoFlujoSolicitudInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${estadoFlujoSolicitudInstance.id}">${fieldValue(bean: estadoFlujoSolicitudInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: estadoFlujoSolicitudInstance, field: "glosa")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${estadoFlujoSolicitudInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
