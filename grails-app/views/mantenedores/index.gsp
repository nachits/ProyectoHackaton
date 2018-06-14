
<%@ page import="proyectohackaton.Plantilla" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plantilla.label', default: 'Plantilla')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:if test="${session?.nombreUsuario}">
		<div id="page-body" role="main">
			<h1>Bienvenido </h1>
			<p>Congratulations, you have successfully started your first Grails application! At the moment
			   this is the default page, feel free to modify it to either redirect to a controller or display whatever
			   content you may choose. Below is a list of controllers that are currently deployed in this application,
			   click on each to execute its default action:</p>

			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
		</div>
                 </g:if>
                 <g:else>
                     <g:form url="[controller:'colaborador', action:'entrar']" class="form-horizontal form-medium" method="post" enctype="multipart/form-data">
                     <h1>Bienvenido </h1>
                      <input type="text" class="form-control" placeholder="Ingrese usuario." id="nombreUsuario" name="nombreUsuario"  />
                       <g:submitButton name="entra" class="save btn btn-primary" value="Entrar"  />
                       </g:form>
                  </g:else>
                
                <script>
                var acc = document.getElementsByClassName("accordion");
                var i;

                for (i = 0; i < acc.length; i++) {
                    acc[i].addEventListener("click", function() {
                        /* Toggle between adding and removing the "active" class,
                        to highlight the button that controls the panel */
                        this.classList.toggle("active");

                        /* Toggle between hiding and showing the active panel */
                        var panel = this.nextElementSibling;
                        if (panel.style.display === "block") {
                            panel.style.display = "none";
                        } else {
                            panel.style.display = "block";
                        }
                    });
                }
                
                var acc2 = document.getElementsByClassName("accordionInner");
                var i;

                for (i = 0; i < acc2.length; i++) {
                    acc2[i].addEventListener("click", function() {
                        /* Toggle between adding and removing the "active" class,
                        to highlight the button that controls the panel */
                        this.classList.toggle("active");

                        /* Toggle between hiding and showing the active panel */
                        var panel = this.nextElementSibling;
                        if (panel.style.display === "block") {
                            panel.style.display = "none";
                        } else {
                            panel.style.display = "block";
                        }
                    });
                }
                
                
                </script>
	</body>
</html>
