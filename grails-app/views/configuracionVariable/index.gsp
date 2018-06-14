
<%@ page import="proyectohackaton.ConfiguracionVariable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configuracionVariable.label', default: 'ConfiguracionVariable')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-configuracionVariable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-configuracionVariable" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="orden" title="${message(code: 'configuracionVariable.orden.label', default: 'Orden')}" />
					
						<g:sortableColumn property="propiedad" title="${message(code: 'configuracionVariable.propiedad.label', default: 'Propiedad')}" />
					
						<th><g:message code="configuracionVariable.tipoDato.label" default="Tipo Dato" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${configuracionVariableInstanceList}" status="i" var="configuracionVariableInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${configuracionVariableInstance.id}">${fieldValue(bean: configuracionVariableInstance, field: "orden")}</g:link></td>
					
						<td>${fieldValue(bean: configuracionVariableInstance, field: "propiedad")}</td>
					
						<td>${fieldValue(bean: configuracionVariableInstance, field: "tipoDato")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${configuracionVariableInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
