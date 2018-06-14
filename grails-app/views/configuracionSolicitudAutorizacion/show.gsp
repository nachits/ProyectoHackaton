
<%@ page import="proyectohackaton.ConfiguracionSolicitudAutorizacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configuracionSolicitudAutorizacion.label', default: 'ConfiguracionSolicitudAutorizacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-configuracionSolicitudAutorizacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-configuracionSolicitudAutorizacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list configuracionSolicitudAutorizacion">
			
				<g:if test="${configuracionSolicitudAutorizacionInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="configuracionSolicitudAutorizacion.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${configuracionSolicitudAutorizacionInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionSolicitudAutorizacionInstance?.colaboradorAprobador}">
				<li class="fieldcontain">
					<span id="colaboradorAprobador-label" class="property-label"><g:message code="configuracionSolicitudAutorizacion.colaboradorAprobador.label" default="Colaborador Aprobador" /></span>
					
						<span class="property-value" aria-labelledby="colaboradorAprobador-label"><g:link controller="colaborador" action="show" id="${configuracionSolicitudAutorizacionInstance?.colaboradorAprobador?.id}">${configuracionSolicitudAutorizacionInstance?.colaboradorAprobador?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionSolicitudAutorizacionInstance?.colaboradorAprobadorSuplente}">
				<li class="fieldcontain">
					<span id="colaboradorAprobadorSuplente-label" class="property-label"><g:message code="configuracionSolicitudAutorizacion.colaboradorAprobadorSuplente.label" default="Colaborador Aprobador Suplente" /></span>
					
						<span class="property-value" aria-labelledby="colaboradorAprobadorSuplente-label"><g:link controller="colaborador" action="show" id="${configuracionSolicitudAutorizacionInstance?.colaboradorAprobadorSuplente?.id}">${configuracionSolicitudAutorizacionInstance?.colaboradorAprobadorSuplente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionSolicitudAutorizacionInstance?.esAprobadorFinal}">
				<li class="fieldcontain">
					<span id="esAprobadorFinal-label" class="property-label"><g:message code="configuracionSolicitudAutorizacion.esAprobadorFinal.label" default="Es Aprobador Final" /></span>
					
						<span class="property-value" aria-labelledby="esAprobadorFinal-label"><g:formatBoolean boolean="${configuracionSolicitudAutorizacionInstance?.esAprobadorFinal}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionSolicitudAutorizacionInstance?.grupoColaborador}">
				<li class="fieldcontain">
					<span id="grupoColaborador-label" class="property-label"><g:message code="configuracionSolicitudAutorizacion.grupoColaborador.label" default="Grupo Colaborador" /></span>
					
						<span class="property-value" aria-labelledby="grupoColaborador-label"><g:link controller="grupoColaborador" action="show" id="${configuracionSolicitudAutorizacionInstance?.grupoColaborador?.id}">${configuracionSolicitudAutorizacionInstance?.grupoColaborador?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionSolicitudAutorizacionInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="configuracionSolicitudAutorizacion.orden.label" default="Orden" /></span>
					
						<span class="property-value" aria-labelledby="orden-label"><g:fieldValue bean="${configuracionSolicitudAutorizacionInstance}" field="orden"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionSolicitudAutorizacionInstance?.tipoSolicitud}">
				<li class="fieldcontain">
					<span id="tipoSolicitud-label" class="property-label"><g:message code="configuracionSolicitudAutorizacion.tipoSolicitud.label" default="Tipo Solicitud" /></span>
					
						<span class="property-value" aria-labelledby="tipoSolicitud-label"><g:link controller="tipoSolicitud" action="show" id="${configuracionSolicitudAutorizacionInstance?.tipoSolicitud?.id}">${configuracionSolicitudAutorizacionInstance?.tipoSolicitud?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:configuracionSolicitudAutorizacionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${configuracionSolicitudAutorizacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
