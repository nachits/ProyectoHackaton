<%@ page import="proyectohackaton.GrupoColaborador" %>



<div class="fieldcontain ${hasErrors(bean: grupoColaboradorInstance, field: 'colaborador', 'error')} required">
	<label for="colaborador">
		<g:message code="grupoColaborador.colaborador.label" default="Colaborador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="colaborador" name="colaborador.id" from="${proyectohackaton.Colaborador.list()}" optionKey="id" required="" value="${grupoColaboradorInstance?.colaborador?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: grupoColaboradorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="grupoColaborador.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${grupoColaboradorInstance?.nombre}"/>

</div>

