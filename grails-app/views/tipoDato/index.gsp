
<%@ page import="proyectohackaton.TipoDato" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoDato.label', default: 'TipoDato')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipoDato" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipoDato" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'tipoDato.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="glosa" title="${message(code: 'tipoDato.glosa.label', default: 'Glosa')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoDatoInstanceList}" status="i" var="tipoDatoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoDatoInstance.id}">${fieldValue(bean: tipoDatoInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: tipoDatoInstance, field: "glosa")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoDatoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
