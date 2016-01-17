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
	<br>
	<br>
	<br>
	<div class="container"
		<div class="alineacion">
			<div class="panel panel-success">
					<div class="panel-body">
						<div class="alert alert-danger" role="alert">
							<button type="button" class="close" data-dismiss="alert">&times;</button><g:message code="springSecurity.denied.message" />
						</div>
					</div>

			</div>
		</div>
	</div>
</body>
</html>
