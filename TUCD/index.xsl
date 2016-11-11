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
				<title>UCD Tutorial</title>
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
						$( "#accordion" ).accordion({collapsible: true});
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
							<div id="accordion">

								<!-- OVERVIEW -->
									 <h3>Overview</h3>
										<div>
											<ul class="tutorialMenu" >
												<li>
													<span class="fa-stack fa-lg">
														<i class="fa fa-user fa-stack-1x"></i> 
                                                 		<i class="fa fa-circle-o fa-stack-2x"></i>
                                                 	</span>
													<a ng-click="field.toShow='ucd'" class="buttons" href="">User-Centered Design</a>
												</li>
												<li>
													<span class="fa-stack fa-lg">
														<i class="fa fa-user fa-stack-1x"></i> 
                                                 		<i class="fa fa-search fa-stack-2x"></i>
                                                 	</span>
													<a ng-click="field.toShow='ur'" class="buttons" href="">User Research</a>
												</li>

												<li>
													<i class="fa fa-cogs fa-2x"></i>
													<a ng-click="field.toShow='pr'" class="buttons" href="">Prototyping</a>
												</li>

												<li>
													<i class="fa fa-question fa-2x"></i>
													<a ng-click="field.toShow='ev'" class="buttons" href="">Evaluation</a>
												</li>
															
														
											</ul>
											 


										</div>

										<!-- USER RESEARCH -->
										 <h3>User Research</h3>
											<div>
												<ul class="tutorialMenu">
													<xsl:for-each select="//method">
														<li>
															<xsl:if test="method_phase = 'User Research'">

																<i class="{icon}"></i>
																<a class="buttons" href = "#" ng-click="field.toShow='{method_name}Field'">
																<xsl:value-of select="method_name" />
																</a>
															</xsl:if>
														</li>
													</xsl:for-each>
												</ul>
											</div>



											<!-- PROTOTYPING -->
										 <h3>Prototyping</h3>
											<div>
												<ul class="tutorialMenu">
													<xsl:for-each select="//method">
														<li>
															<xsl:if test="method_phase = 'Prototyping'">

																<i class="{icon}"></i>
																<a class="buttons" href = "#" ng-click="field.toShow='{method_name}Field'">
																<xsl:value-of select="method_name" />
																</a>
															</xsl:if>
														</li>
													</xsl:for-each>
												</ul>
											</div>



											<!-- USER RESEARCH -->
										 <h3>Evaluation</h3>
											<div>
												<ul class="tutorialMenu">
													<xsl:for-each select="//method">
														<li>
															<xsl:if test="method_phase = 'Evaluation'">

																<i class="{icon}"></i>
																<a class="buttons" href = "#" ng-click="field.toShow='{method_name}Field'">
																<xsl:value-of select="method_name" />
																</a>
															</xsl:if>
														</li>
													</xsl:for-each>
												</ul>
											</div>

							</div>

						</div>
					</div>
		
		
		
		
		
								<div id="content">
		
									<div id="onecolumn">
				
										<div id="tabs">

											<!--OVERVIEW-->
											
											<div ng-show="field.toShow=='ucd'">	
												prova 1
											</div>
											<div ng-show="field.toShow=='ur'">	
												prova 2
											</div>
											<div ng-show="field.toShow=='pr'">	
												prova 3
											</div>
											<div ng-show="field.toShow=='ev'">	
												prova 4
											</div>



											<!--USER RESEARCH-->

											<xsl:for-each select="//method">
													
														<xsl:if test="method_phase = 'User Research'">
															<div ng-show="field.toShow=='{method_name}Field'">
																
																	
																<h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
																<br/>
																<strong>Description</strong>
																<p> 
																	<xsl:value-of select="./tutorial/description"/>
																</p>
																
																<strong>Benefits</strong>
																<p> 
																	<ul >
																		<xsl:for-each select="./tutorial/benefits/benefit">
																			<li>
																				<xsl:value-of select="child::text()"/>
																			</li>
																		</xsl:for-each>
																	</ul>
																</p>
																
																
																<strong>Best practices</strong>
																<p> 
																	<ul>
																		<xsl:for-each select="./tutorial/best_practices/best_practice">
																			<li>
																				<xsl:value-of select="child::text()"/>
																			</li>
																		</xsl:for-each>
																	</ul>
																	
																	
																</p>
																
																<strong>Examples</strong>
																<p> 
																	<ul >
																		<xsl:for-each select="./tutorial/examples/example">
																			<li>
																				<xsl:value-of select="child::text()"/>
																			</li>
																		</xsl:for-each>
																	</ul>
																	
																</p>
															</div>
														</xsl:if>
												
											</xsl:for-each>



											<!--PROTOTYPING-->

											<xsl:for-each select="//method">
													
														<xsl:if test="method_phase = 'Prototyping'">
															<div ng-show="field.toShow=='{method_name}Field'">
																	
																		<h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
																		<br/>
																		<strong>Description</strong>
																		<p>	
																			<xsl:value-of select="./tutorial/description"/>
																		</p>
																		
																		<strong>Benefits</strong>
																		<p>	
																			<ul>
																				<!--<xsl:for-each select="./tutorial">
																					<li>-->
																						<xsl:value-of select="./tutorial/benefit"/>
																					<!--</li>
																				</xsl:for-each>-->
																			</ul>
																		</p>
																		
																		
																		<strong>Best practices</strong>
																		<p>	
																			<xsl:value-of select="./tutorial/best_practices"/>
																		</p>
																			
																			<strong>Examples</strong>
																		<p>	
																			
																		</p>
															</div>
														</xsl:if>
												
											</xsl:for-each>



											<!--EVALUATION-->

											<xsl:for-each select="//method">
													
														<xsl:if test="method_phase = 'Evaluation'">
															<div ng-show="field.toShow=='{method_name}Field'">
																	
																		<h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
																		<br/>
																		<strong>Description</strong>
																		<p>	
																			<xsl:value-of select="./tutorial/description"/>
																		</p>
																		
																		<strong>Benefits</strong>
																		<p>	
																			<ul>
																				<!--<xsl:for-each select="./tutorial">
																					<li>-->
																						<xsl:value-of select="./tutorial/benefit"/>
																					<!--</li>
																				</xsl:for-each>-->
																			</ul>
																		</p>
																		
																		
																		<strong>Best practices</strong>
																		<p>	
																			<xsl:value-of select="./tutorial/best_practices"/>
																		</p>
																			
																			<strong>Examples</strong>
																		<p>	
																			
																		</p>
															</div>
														</xsl:if>
												
											</xsl:for-each>


											







											
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