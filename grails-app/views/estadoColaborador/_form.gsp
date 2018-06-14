<%@ page import="proyectohackaton.EstadoColaborador" %>



<div class="fieldcontain ${hasErrors(bean: estadoColaboradorInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="estadoColaborador.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${estadoColaboradorInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estadoColaboradorInstance, field: 'glosa', 'error')} ">
	<label for="glosa">
		<g:message code="estadoColaborador.glosa.label" default="Glosa" />
		
	</label>
	<g:textField name="glosa" value="${estadoColaboradorInstance?.glosa}"/>

</div>

