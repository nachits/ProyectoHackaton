
<%@ page import="proyectohackaton.ConfiguracionVariable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configuracionVariable.label', default: 'ConfiguracionVariable')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-configuracionVariable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-configuracionVariable" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list configuracionVariable">
			
				<g:if test="${configuracionVariableInstance?.glosa}">
				<li class="fieldcontain">
					<span id="glosa-label" class="property-label"><g:message code="configuracionVariable.glosa.label" default="Glosa" /></span>
					
						<span class="property-value" aria-labelledby="glosa-label"><g:fieldValue bean="${configuracionVariableInstance}" field="glosa"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionVariableInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="configuracionVariable.orden.label" default="Orden" /></span>
					
						<span class="property-value" aria-labelledby="orden-label"><g:fieldValue bean="${configuracionVariableInstance}" field="orden"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionVariableInstance?.propiedad}">
				<li class="fieldcontain">
					<span id="propiedad-label" class="property-label"><g:message code="configuracionVariable.propiedad.label" default="Propiedad" /></span>
					
						<span class="property-value" aria-labelledby="propiedad-label"><g:fieldValue bean="${configuracionVariableInstance}" field="propiedad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionVariableInstance?.tipoDato}">
				<li class="fieldcontain">
					<span id="tipoDato-label" class="property-label"><g:message code="configuracionVariable.tipoDato.label" default="Tipo Dato" /></span>
					
						<span class="property-value" aria-labelledby="tipoDato-label"><g:link controller="tipoDato" action="show" id="${configuracionVariableInstance?.tipoDato?.id}">${configuracionVariableInstance?.tipoDato?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionVariableInstance?.tipoSolicitud}">
				<li class="fieldcontain">
					<span id="tipoSolicitud-label" class="property-label"><g:message code="configuracionVariable.tipoSolicitud.label" default="Tipo Solicitud" /></span>
					
						<span class="property-value" aria-labelledby="tipoSolicitud-label"><g:link controller="tipoSolicitud" action="show" id="${configuracionVariableInstance?.tipoSolicitud?.id}">${configuracionVariableInstance?.tipoSolicitud?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:configuracionVariableInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${configuracionVariableInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
