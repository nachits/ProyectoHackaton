
<%@ page import="proyectohackaton.Colaborador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'colaborador.label', default: 'Colaborador')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-colaborador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-colaborador" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list colaborador">
			
				<g:if test="${colaboradorInstance?.apellidoMaterno}">
				<li class="fieldcontain">
					<span id="apellidoMaterno-label" class="property-label"><g:message code="colaborador.apellidoMaterno.label" default="Apellido Materno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue bean="${colaboradorInstance}" field="apellidoMaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colaboradorInstance?.apellidoPaterno}">
				<li class="fieldcontain">
					<span id="apellidoPaterno-label" class="property-label"><g:message code="colaborador.apellidoPaterno.label" default="Apellido Paterno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue bean="${colaboradorInstance}" field="apellidoPaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colaboradorInstance?.estadoColaborador}">
				<li class="fieldcontain">
					<span id="estadoColaborador-label" class="property-label"><g:message code="colaborador.estadoColaborador.label" default="Estado Colaborador" /></span>
					
						<span class="property-value" aria-labelledby="estadoColaborador-label"><g:link controller="estadoColaborador" action="show" id="${colaboradorInstance?.estadoColaborador?.id}">${colaboradorInstance?.estadoColaborador?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${colaboradorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="colaborador.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${colaboradorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colaboradorInstance?.nombreUsuario}">
				<li class="fieldcontain">
					<span id="nombreUsuario-label" class="property-label"><g:message code="colaborador.nombreUsuario.label" default="Nombre Usuario" /></span>
					
						<span class="property-value" aria-labelledby="nombreUsuario-label"><g:fieldValue bean="${colaboradorInstance}" field="nombreUsuario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colaboradorInstance?.roles}">
				<li class="fieldcontain">
					<span id="roles-label" class="property-label"><g:message code="colaborador.roles.label" default="Roles" /></span>
					
						<g:each in="${colaboradorInstance.roles}" var="r">
						<span class="property-value" aria-labelledby="roles-label"><g:link controller="roles" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${colaboradorInstance?.rut}">
				<li class="fieldcontain">
					<span id="rut-label" class="property-label"><g:message code="colaborador.rut.label" default="Rut" /></span>
					
						<span class="property-value" aria-labelledby="rut-label"><g:fieldValue bean="${colaboradorInstance}" field="rut"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colaboradorInstance?.saldoMedioDias}">
				<li class="fieldcontain">
					<span id="saldoMedioDias-label" class="property-label"><g:message code="colaborador.saldoMedioDias.label" default="Saldo Medio Dias" /></span>
					
						<span class="property-value" aria-labelledby="saldoMedioDias-label"><g:fieldValue bean="${colaboradorInstance}" field="saldoMedioDias"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colaboradorInstance?.saldoVacaciones}">
				<li class="fieldcontain">
					<span id="saldoVacaciones-label" class="property-label"><g:message code="colaborador.saldoVacaciones.label" default="Saldo Vacaciones" /></span>
					
						<span class="property-value" aria-labelledby="saldoVacaciones-label"><g:fieldValue bean="${colaboradorInstance}" field="saldoVacaciones"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:colaboradorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${colaboradorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
