<html>
<head>
	<meta name="layout" content="main">
</head>
<body>
<g:render template="/layouts/headerExterno"/>
<div class="site-wrapper">
	<div class="site-wrapper-inner">
		<div class="container">
			<div class="row">
				<div class="centrado">
					<div id="create-usuario" class="content scaffold-create" role="main">
						<g:form url="[resource:usuarioInstance, action:'save']" class="form-signin">
							<fieldset class="form">
								<g:render template="form"/>
							</fieldset>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
