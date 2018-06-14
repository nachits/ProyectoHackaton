<%@ page import="proyectohackaton.ConfiguracionVariable" %>



<div class="fieldcontain ${hasErrors(bean: configuracionVariableInstance, field: 'orden', 'error')} required">
	<label for="orden">
		<g:message code="configuracionVariable.orden.label" default="Orden" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="orden" type="number" value="${configuracionVariableInstance.orden}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionVariableInstance, field: 'propiedad', 'error')} ">
	<label for="propiedad">
		<g:message code="configuracionVariable.propiedad.label" default="Propiedad" />
		
	</label>
	<g:textField name="propiedad" value="${configuracionVariableInstance?.propiedad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionVariableInstance, field: 'tipoDato', 'error')} required">
	<label for="tipoDato">
		<g:message code="configuracionVariable.tipoDato.label" default="Tipo Dato" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoDato" name="tipoDato.id" from="${proyectohackaton.TipoDato.list()}" optionKey="id" required="" value="${configuracionVariableInstance?.tipoDato?.id}" class="many-to-one"/>

</div>

