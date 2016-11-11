<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    
    <!-- HTML5 compatibility -->
    <xsl:output method="html"
        doctype-system="about:legacy-compat"
        encoding="UTF-8"
        indent="yes" /> 


		<xsl:template match="/">
			<html xmlns="http://www.w3.org/1999/xhtml">
		
		
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<title>Tutorial</title>
				<meta name="keywords" content="" />
				<meta name="description" content="" />
		
				<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700|Archivo+Narrow:400,700" rel="stylesheet" type="text/css"/>
				<link href="default.css" rel="stylesheet" type="text/css" media="all" />
				<link rel="stylesheet" href="jquery-ui.css" />
				<link href="font-awesome-4.0.1/css/font-awesome.min.css" rel="stylesheet"/>
				<link rel="stylesheet" href="dist/themes/default/style.min.css" />
				<link rel="stylesheet" href="/resources/demos/style.css" />
				<!--[if IE 6]>
				<link href="default_ie6.css" rel="stylesheet" type="text/css" />
				<![endif]-->
		
				<script src="jquery-1.9.1.js"></script>
				<script src="jquery-ui.js"></script>
				<script src="angular.min.js"></script>
				<script src="script.js"></script>
				<script src="dist/jstree.min.js"></script> 
		
				<script>
					$(function() {
						$("#tabs").tabs();
					});

					 $(function() {
						$( "#accordion" ).accordion();
					});

				</script>
				
			</head>
		
		
		
				<body ng-app="">
					<div id="header" class="container">
						<div id="logo">
							<h1><a href="#">Tutorial User-Centered Design (UCD)</a></h1>
						</div>
					</div>
		
				
		
				<div id="page" class="container">
		
					<div id="sidebar">
						<div id="sbox1">
							<div id="jstree">
								<ul>
									<li data-jstree='{{"icon":"{//icon}"}}'>
										<a href = "#" onclick="method.toShow='{//method_name}Field'">
											<xsl:value-of select="//method_name" />
										</a>
									</li>
								</ul>
							</div>

						</div>
					</div>
		
		
		
		
		
								<div id="content">
		
									<div id="onecolumn">
				
										<div id="tabs">
											
											<div ng-show="method.toShow=='{//method_name}Field'">	
												prova 1
											</div>
											
											<!--<div ng-show="method.toShow=='{method_name}Field'">	
											<h3><i class=" fa-2x"></i> <xsl:value-of select="method_name"/></h3>
												
												<br/>
												<strong>Description</strong>
												<p>	
													<xsl:value-of select="description"/>
												</p>
												
												<strong>Benefits</strong>
												<p>	
													<ul>
														<xsl:for-each select="benefit">
															<li>
																<xsl:value-of select="benefit"/>
															</li>
														</xsl:for-each>
													</ul>
												</p>
												
												
												<strong>Best practices</strong>
												<p>	
													<xsl:value-of select="best_practices"/>
												</p>
												
												<strong>Examples</strong>
												<p>	
													<xsl:value-of select="example"/>
												</p>
											</div>-->
									
			
										</div>
										
									</div>
							
								</div>
							
					
					
					</div>
			
				</body>
			</html>
		</xsl:template>
</xsl:stylesheet>   