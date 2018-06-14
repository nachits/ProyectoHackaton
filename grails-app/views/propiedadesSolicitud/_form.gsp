<%@ page import="proyectohackaton.PropiedadesSolicitud" %>



<div class="fieldcontain ${hasErrors(bean: propiedadesSolicitudInstance, field: 'configuracion', 'error')} required">
	<label for="configuracion">
		<g:message code="propiedadesSolicitud.configuracion.label" default="Configuracion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="configuracion" name="configuracion.id" from="${proyectohackaton.ConfiguracionVariable.list()}" optionKey="id" required="" value="${propiedadesSolicitudInstance?.configuracion?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesSolicitudInstance, field: 'solicitud', 'error')} required">
	<label for="solicitud">
		<g:message code="propiedadesSolicitud.solicitud.label" default="Solicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="solicitud" name="solicitud.id" from="${proyectohackaton.Solicitud.list()}" optionKey="id" required="" value="${propiedadesSolicitudInstance?.solicitud?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesSolicitudInstance, field: 'valor', 'error')} ">
	<label for="valor">
		<g:message code="propiedadesSolicitud.valor.label" default="Valor" />
		
	</label>
	<g:textField name="valor" value="${propiedadesSolicitudInstance?.valor}"/>

</div>

