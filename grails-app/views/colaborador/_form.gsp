<%@ page import="proyectohackaton.Colaborador" %>



<div class="fieldcontain ${hasErrors(bean: colaboradorInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="colaborador.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${colaboradorInstance?.apellidoMaterno}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: colaboradorInstance, field: 'apellidoPaterno', 'error')} ">
	<label for="apellidoPaterno">
		<g:message code="colaborador.apellidoPaterno.label" default="Apellido Paterno" />
		
	</label>
	<g:textField name="apellidoPaterno" value="${colaboradorInstance?.apellidoPaterno}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: colaboradorInstance, field: 'estadoColaborador', 'error')} required">
	<label for="estadoColaborador">
		<g:message code="colaborador.estadoColaborador.label" default="Estado Colaborador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estadoColaborador" name="estadoColaborador.id" from="${proyectohackaton.EstadoColaborador.list()}" optionKey="id" required="" value="${colaboradorInstance?.estadoColaborador?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: colaboradorInstance, field: 'grupoColaborador', 'error')} required">
	<label for="grupoColaborador">
		<g:message code="colaborador.grupoColaborador.label" default="Grupo Colaborador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="grupoColaborador" name="grupoColaborador.id" from="${proyectohackaton.GrupoColaborador.list()}" optionKey="id" required="" value="${colaboradorInstance?.grupoColaborador?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: colaboradorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="colaborador.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${colaboradorInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: colaboradorInstance, field: 'nombreUsuario', 'error')} ">
	<label for="nombreUsuario">
		<g:message code="colaborador.nombreUsuario.label" default="Nombre Usuario" />
		
	</label>
	<g:textField name="nombreUsuario" value="${colaboradorInstance?.nombreUsuario}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: colaboradorInstance, field: 'roles', 'error')} ">
	<label for="roles">
		<g:message code="colaborador.roles.label" default="Roles" />
		
	</label>
	<g:select name="roles" from="${proyectohackaton.Roles.list()}" multiple="multiple" optionKey="id" size="5" value="${colaboradorInstance?.roles*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: colaboradorInstance, field: 'rut', 'error')} required">
	<label for="rut">
		<g:message code="colaborador.rut.label" default="Rut" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rut" type="number" value="${colaboradorInstance.rut}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: colaboradorInstance, field: 'saldoMedioDias', 'error')} required">
	<label for="saldoMedioDias">
		<g:message code="colaborador.saldoMedioDias.label" default="Saldo Medio Dias" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="saldoMedioDias" type="number" value="${colaboradorInstance.saldoMedioDias}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: colaboradorInstance, field: 'saldoVacaciones', 'error')} required">
	<label for="saldoVacaciones">
		<g:message code="colaborador.saldoVacaciones.label" default="Saldo Vacaciones" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="saldoVacaciones" type="number" value="${colaboradorInstance.saldoVacaciones}" required=""/>

</div>

