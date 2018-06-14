
<%@ page import="proyectohackaton.EstadoFlujoSolicitud" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estadoFlujoSolicitud.label', default: 'EstadoFlujoSolicitud')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-estadoFlujoSolicitud" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-estadoFlujoSolicitud" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list estadoFlujoSolicitud">
			
				<g:if test="${estadoFlujoSolicitudInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="estadoFlujoSolicitud.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${estadoFlujoSolicitudInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estadoFlujoSolicitudInstance?.glosa}">
				<li class="fieldcontain">
					<span id="glosa-label" class="property-label"><g:message code="estadoFlujoSolicitud.glosa.label" default="Glosa" /></span>
					
						<span class="property-value" aria-labelledby="glosa-label"><g:fieldValue bean="${estadoFlujoSolicitudInstance}" field="glosa"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:estadoFlujoSolicitudInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${estadoFlujoSolicitudInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
