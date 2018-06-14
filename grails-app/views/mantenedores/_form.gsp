<%@ page import="proyectohackaton.Plantilla" %>



<div class="fieldcontain ${hasErrors(bean: plantillaInstance, field: 'tipoSolicitud', 'error')} required">
	<label for="tipoSolicitud">
		<g:message code="plantilla.tipoSolicitud.label" default="Tipo Solicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoSolicitud" name="tipoSolicitud.id" from="${proyectohackaton.TipoSolicitud.list()}" optionValue="glosa" optionKey="id" required="" value="${plantillaInstance?.tipoSolicitud?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: plantillaInstance, field: 'html', 'error')} ">
	<label for="html">
		<g:message code="plantilla.html.label" default="Html" />
		
	</label>
	<g:textArea name="html" value="${plantillaInstance?.html}" rows="1000" cols="100" style="width:400px; height: 200px;"/>

</div>

