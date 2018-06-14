<%@ page import="proyectohackaton.GrupoColaborador" %>



<div class="fieldcontain ${hasErrors(bean: grupoColaboradorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="grupoColaborador.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${grupoColaboradorInstance?.nombre}"/>

</div>

