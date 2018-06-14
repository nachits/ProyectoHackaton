<%@ page import="proyectohackaton.EstadoSolicitud" %>



<div class="fieldcontain ${hasErrors(bean: estadoSolicitudInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="estadoSolicitud.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${estadoSolicitudInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estadoSolicitudInstance, field: 'glosa', 'error')} ">
	<label for="glosa">
		<g:message code="estadoSolicitud.glosa.label" default="Glosa" />
		
	</label>
	<g:textField name="glosa" value="${estadoSolicitudInstance?.glosa}"/>

</div>

