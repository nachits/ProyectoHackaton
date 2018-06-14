<%@ page import="proyectohackaton.TipoDato" %>



<div class="fieldcontain ${hasErrors(bean: tipoDatoInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="tipoDato.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${tipoDatoInstance?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoDatoInstance, field: 'glosa', 'error')} ">
	<label for="glosa">
		<g:message code="tipoDato.glosa.label" default="Glosa" />
		
	</label>
	<g:textField name="glosa" value="${tipoDatoInstance?.glosa}"/>

</div>

