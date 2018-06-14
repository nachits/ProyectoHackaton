<%@ page import="proyectohackaton.TipoSolicitud" %>



<div class="fieldcontain ${hasErrors(bean: tipoSolicitudInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="tipoSolicitud.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${tipoSolicitudInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoSolicitudInstance, field: 'glosa', 'error')} ">
	<label for="glosa">
		<g:message code="tipoSolicitud.glosa.label" default="Glosa" />
		
	</label>
	<g:textField name="glosa" value="${tipoSolicitudInstance?.glosa}"/>

</div>

