<%@ page import="proyectohackaton.ConfiguracionSolicitudAutorizacion" %>



<div class="fieldcontain ${hasErrors(bean: configuracionSolicitudAutorizacionInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="configuracionSolicitudAutorizacion.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${configuracionSolicitudAutorizacionInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionSolicitudAutorizacionInstance, field: 'colaboradorAprobador', 'error')} required">
	<label for="colaboradorAprobador">
		<g:message code="configuracionSolicitudAutorizacion.colaboradorAprobador.label" default="Colaborador Aprobador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="colaboradorAprobador" name="colaboradorAprobador.id" from="${proyectohackaton.Colaborador.list()}" optionKey="id" required="" value="${configuracionSolicitudAutorizacionInstance?.colaboradorAprobador?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionSolicitudAutorizacionInstance, field: 'colaboradorAprobadorSuplente', 'error')} required">
	<label for="colaboradorAprobadorSuplente">
		<g:message code="configuracionSolicitudAutorizacion.colaboradorAprobadorSuplente.label" default="Colaborador Aprobador Suplente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="colaboradorAprobadorSuplente" name="colaboradorAprobadorSuplente.id" from="${proyectohackaton.Colaborador.list()}" optionKey="id" required="" value="${configuracionSolicitudAutorizacionInstance?.colaboradorAprobadorSuplente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionSolicitudAutorizacionInstance, field: 'esAprobadorFinal', 'error')} ">
	<label for="esAprobadorFinal">
		<g:message code="configuracionSolicitudAutorizacion.esAprobadorFinal.label" default="Es Aprobador Final" />
		
	</label>
	<g:checkBox name="esAprobadorFinal" value="${configuracionSolicitudAutorizacionInstance?.esAprobadorFinal}" />

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionSolicitudAutorizacionInstance, field: 'grupoColaborador', 'error')} required">
	<label for="grupoColaborador">
		<g:message code="configuracionSolicitudAutorizacion.grupoColaborador.label" default="Grupo Colaborador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="grupoColaborador" name="grupoColaborador.id" from="${proyectohackaton.GrupoColaborador.list()}" optionKey="id" required="" value="${configuracionSolicitudAutorizacionInstance?.grupoColaborador?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionSolicitudAutorizacionInstance, field: 'orden', 'error')} required">
	<label for="orden">
		<g:message code="configuracionSolicitudAutorizacion.orden.label" default="Orden" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="orden" type="number" value="${configuracionSolicitudAutorizacionInstance.orden}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionSolicitudAutorizacionInstance, field: 'tipoSolicitud', 'error')} required">
	<label for="tipoSolicitud">
		<g:message code="configuracionSolicitudAutorizacion.tipoSolicitud.label" default="Tipo Solicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoSolicitud" name="tipoSolicitud.id" from="${proyectohackaton.TipoSolicitud.list()}" optionKey="id" required="" value="${configuracionSolicitudAutorizacionInstance?.tipoSolicitud?.id}" class="many-to-one"/>

</div>

