<%@ page import="proyectohackaton.Plantilla" %>



<div class="fieldcontain ${hasErrors(bean: plantillaInstance, field: 'tipoSolicitud', 'error')} required">
	<label for="tipoSolicitud">
		<g:message code="plantilla.tipoSolicitud.label" default="Tipo Solicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoSolicitud" name="tipoSolicitud.id" from="${proyectohackaton.TipoSolicitud.list()}" optionKey="id" required="" value="${plantillaInstance?.tipoSolicitud?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: plantillaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="plantilla.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${plantillaInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: plantillaInstance, field: 'html', 'error')} ">
	<label for="html">
		<g:message code="plantilla.html.label" default="Html" />
		
	</label>
	<g:textField name="html" value="${plantillaInstance?.html}"/>

</div>

