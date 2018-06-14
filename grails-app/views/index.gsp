<!DOCTYPE html>
<html>
	<head>  
            <g:if test="${session?.nombreUsuario}">
		<meta name="layout" content="main"/>
                   </g:if>
		<title>Welcome </title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
                        .accordion {
                            background-color: #4B0082;
                            color: #fff;
                            cursor: pointer;
                            padding: 18px;
                            width: 100%;
                            text-align: left;
                            border-style: double;
                            border-width: thick;
                            outline: none;
                            transition: 0.4s;
                        }
                        
                        .accordionInner {
                            background-color: #fff;
                            color: #000000;
                            cursor: pointer;
                            padding: 18px;
                            width: 100%;
                            text-align: left;
                            border: none;
                            outline: none;
                            transition: 0.4s;
                        }

                        /* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
                        .active, .accordion:hover {
                            background-color: #4B0082;
                        }
                        

                        /* Style the accordion panel. Note: hidden by default */
                        .panel {
                            padding: 0 18px;
                            background-color: white;
                            display: none;
                            overflow: hidden;
                        }
                        
                        
		</style>
                
	</head>
	<body>
		

		<div id="page-body" role="main">
			<h1>Bienvenido </h1>
			
		</div>
   
      
                
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
