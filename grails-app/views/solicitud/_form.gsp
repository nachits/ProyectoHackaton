<%@ page import="proyectohackaton.Solicitud" %>



<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="solicitud.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${proyectohackaton.EstadoSolicitud.list()}" optionKey="id" required="" value="${solicitudInstance?.estado?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'fechaCreacion', 'error')} required">
	<label for="fechaCreacion">
		<g:message code="solicitud.fechaCreacion.label" default="Fecha Creacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${solicitudInstance?.fechaCreacion}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'flujosSolicitud', 'error')} ">
	<label for="flujosSolicitud">
		<g:message code="solicitud.flujosSolicitud.label" default="Flujos Solicitud" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${solicitudInstance?.flujosSolicitud?}" var="f">
    <li><g:link controller="flujoSolicitud" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="flujoSolicitud" action="create" params="['solicitud.id': solicitudInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'flujoSolicitud.label', default: 'FlujoSolicitud')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'tipoSolicitud', 'error')} required">
	<label for="tipoSolicitud">
		<g:message code="solicitud.tipoSolicitud.label" default="Tipo Solicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoSolicitud" name="tipoSolicitud.id" from="${proyectohackaton.TipoSolicitud.list()}" optionKey="id" required="" value="${solicitudInstance?.tipoSolicitud?.id}" class="many-to-one"/>

</div>

