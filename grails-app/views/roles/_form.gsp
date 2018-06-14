<%@ page import="proyectohackaton.Roles" %>



<div class="fieldcontain ${hasErrors(bean: rolesInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="roles.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${rolesInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rolesInstance, field: 'glosa', 'error')} ">
	<label for="glosa">
		<g:message code="roles.glosa.label" default="Glosa" />
		
	</label>
	<g:textField name="glosa" value="${rolesInstance?.glosa}"/>

</div>

