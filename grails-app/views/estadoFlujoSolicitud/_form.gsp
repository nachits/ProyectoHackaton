<%@ page import="proyectohackaton.EstadoFlujoSolicitud" %>



<div class="fieldcontain ${hasErrors(bean: estadoFlujoSolicitudInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="estadoFlujoSolicitud.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${estadoFlujoSolicitudInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estadoFlujoSolicitudInstance, field: 'glosa', 'error')} ">
	<label for="glosa">
		<g:message code="estadoFlujoSolicitud.glosa.label" default="Glosa" />
		
	</label>
	<g:textField name="glosa" value="${estadoFlujoSolicitudInstance?.glosa}"/>

</div>

