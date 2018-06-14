
<%@ page import="proyectohackaton.EstadoColaborador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estadoColaborador.label', default: 'EstadoColaborador')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-estadoColaborador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-estadoColaborador" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'estadoColaborador.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="glosa" title="${message(code: 'estadoColaborador.glosa.label', default: 'Glosa')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${estadoColaboradorInstanceList}" status="i" var="estadoColaboradorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${estadoColaboradorInstance.id}">${fieldValue(bean: estadoColaboradorInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: estadoColaboradorInstance, field: "glosa")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${estadoColaboradorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
