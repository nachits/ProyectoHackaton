
<%@ page import="proyectohackaton.Colaborador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'colaborador.label', default: 'Colaborador')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-colaborador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-colaborador" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="apellidoMaterno" title="${message(code: 'colaborador.apellidoMaterno.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="apellidoPaterno" title="${message(code: 'colaborador.apellidoPaterno.label', default: 'Apellido Paterno')}" />
					
						<th><g:message code="colaborador.estadoColaborador.label" default="Estado Colaborador" /></th>
					
						<th><g:message code="colaborador.grupoColaborador.label" default="Grupo Colaborador" /></th>
					
						<g:sortableColumn property="nombre" title="${message(code: 'colaborador.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="nombreUsuario" title="${message(code: 'colaborador.nombreUsuario.label', default: 'Nombre Usuario')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${colaboradorInstanceList}" status="i" var="colaboradorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${colaboradorInstance.id}">${fieldValue(bean: colaboradorInstance, field: "apellidoMaterno")}</g:link></td>
					
						<td>${fieldValue(bean: colaboradorInstance, field: "apellidoPaterno")}</td>
					
						<td>${fieldValue(bean: colaboradorInstance, field: "estadoColaborador")}</td>
					
						<td>${fieldValue(bean: colaboradorInstance, field: "grupoColaborador")}</td>
					
						<td>${fieldValue(bean: colaboradorInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: colaboradorInstance, field: "nombreUsuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${colaboradorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
