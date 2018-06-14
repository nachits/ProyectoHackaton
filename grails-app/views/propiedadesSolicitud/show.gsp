
<%@ page import="proyectohackaton.PropiedadesSolicitud" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'propiedadesSolicitud.label', default: 'PropiedadesSolicitud')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-propiedadesSolicitud" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-propiedadesSolicitud" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list propiedadesSolicitud">
			
				<g:if test="${propiedadesSolicitudInstance?.configuracion}">
				<li class="fieldcontain">
					<span id="configuracion-label" class="property-label"><g:message code="propiedadesSolicitud.configuracion.label" default="Configuracion" /></span>
					
						<span class="property-value" aria-labelledby="configuracion-label"><g:link controller="configuracionVariable" action="show" id="${propiedadesSolicitudInstance?.configuracion?.id}">${propiedadesSolicitudInstance?.configuracion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesSolicitudInstance?.solicitud}">
				<li class="fieldcontain">
					<span id="solicitud-label" class="property-label"><g:message code="propiedadesSolicitud.solicitud.label" default="Solicitud" /></span>
					
						<span class="property-value" aria-labelledby="solicitud-label"><g:link controller="solicitud" action="show" id="${propiedadesSolicitudInstance?.solicitud?.id}">${propiedadesSolicitudInstance?.solicitud?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesSolicitudInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="propiedadesSolicitud.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${propiedadesSolicitudInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:propiedadesSolicitudInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${propiedadesSolicitudInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
