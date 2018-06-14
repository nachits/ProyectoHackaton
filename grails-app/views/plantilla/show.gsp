
<%@ page import="proyectohackaton.Plantilla" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plantilla.label', default: 'Plantilla')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-plantilla" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-plantilla" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list plantilla">
			
				<g:if test="${plantillaInstance?.tipoSolicitud}">
				<li class="fieldcontain">
					<span id="tipoSolicitud-label" class="property-label"><g:message code="plantilla.tipoSolicitud.label" default="Tipo Solicitud" /></span>
					
						<span class="property-value" aria-labelledby="tipoSolicitud-label"><g:link controller="tipoSolicitud" action="show" id="${plantillaInstance?.tipoSolicitud?.id}">${plantillaInstance?.tipoSolicitud?.glosa?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${plantillaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="plantilla.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${plantillaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${plantillaInstance?.html}">
				<li class="fieldcontain">
					<span id="html-label" class="property-label"><g:message code="plantilla.html.label" default="Html" /></span>
					
						<span class="property-value" aria-labelledby="html-label"><g:fieldValue bean="${plantillaInstance}" field="html"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:plantillaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${plantillaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
