
<%@ page import="proyectohackaton.Plantilla" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plantilla.label', default: 'Plantilla')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-plantilla" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered">
			<thead>
					<tr>
                                            <th><g:message code='plantilla.tipoSolicitud.label' default='Estado' /></th>
                                            <th><g:message code='plantilla.fecha.label' default='Fecha' /></th>
                                            <th></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${plantillaInstanceList}" status="i" var="plantillaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${plantillaInstance.id}">${plantillaInstance.tipoSolicitud.glosa}</g:link></td>
					
						<td><g:formatDate date="${plantillaInstance.fecha}" /></td>
                                                
                                                <td>
                                                    <g:link type="button" class="btn btn-primary" action="generacionArchivo" id="${plantillaInstance.tipoSolicitud.id}">
                                                        vista Previa
                                                    </g:link>
                                                </td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${plantillaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
