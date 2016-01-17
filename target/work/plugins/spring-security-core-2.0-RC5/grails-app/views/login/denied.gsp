<%--
  Created by IntelliJ IDEA.
  User: FelipeFernandez
  Date: 12-12-15
  Time: 9:56
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="main"/>
</head>

<body>
	<g:render template="/layouts/headerInterno"/>
	<div class="container"

					<div class="panel panel-success">
						<fieldset class="form">
							<div class="panel-body">
								<div class="alert alert-danger" role="alert">
									<button type="button" class="close" data-dismiss="alert">&times;</button><g:message code="springSecurity.denied.message" />
								</div>
							</div>
						</fieldset>
					</div>
	</div>
</body>
</html>

%{--<head>
<meta name='layout' content='main' />
<title><g:message code="springSecurity.denied.title" /></title>
</head>

<body>
<div class='body'>
	<div class='errors'><g:message code="springSecurity.denied.message" /></div>
</div>
</body>--}%
