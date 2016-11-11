<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    
    <!-- HTML5 compatibility -->
    <xsl:output method="html"
        doctype-system="about:legacy-compat"
        encoding="UTF-8"
        indent="yes" /> 


		
		
			<xsl:template match="/">
				<html xmlns="http://www.w3.org/1999/xhtml" id="example">
		
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<title>Tutorial User-Centered Design</title>
				<meta name="keywords" content="" />
				<meta name="description" content="" />
		
				<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700|Archivo+Narrow:400,700" rel="stylesheet" type="text/css"/>
				<link href="../UCD_Tutorial/default.css" rel="stylesheet" type="text/css" media="all" />
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
							<h1><a>Tutorial User-Centered Design</a></h1>
						</div>
						<div class="tutorialButtonContainer"> <a type="submit" class="pure-button pure-button-primary tutorialButton" href="../HOMEPAGE/homepage.html">T-UCD</a></div>
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
								<h3>User Research
												<span class="fa-stack fa-lg">
												<i class="fa fa-user fa-stack-1x"></i> 
												<i class="fa fa-search fa-stack-2x"></i>
											</span>
												
											</h3>
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
								<h3>Prototyping <i class="fa fa-cogs fa-2x"></i> </h3>
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
								<h3>Evaluation <i class="fa fa-question fa-2x"></i> </h3>
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
											
											
											
											<!-- USER-CENTERED DESIGN -->
											
											<div ng-show="field.toShow=='ucd'">	
												<h3 >
													<span class="fa-stack fa-lg">
													<i class="fa fa-user fa-stack-1x"></i> 
													<i class="fa fa-circle-o fa-stack-2x"></i>
												</span>
												User-Centered Design</h3>
												<br/>
												<p>
													Broadly speaking, User-Centered Design (UCD) is an approach to user interface design and development that focuses on the needs and tasks of the end-users of a computer system. Its purpose is to conceive a usable system, which is a system that has to be effective, efficient and enjoyable to use.  
												</p>
												<p>
													Effectiveness concerns the “accuracy and completeness with which users achieve specified goals”; efficiency is related to how quickly the end-users perform tasks after having learnt how to use the system. Finally, enjoyment regards how much a person who interacts with the system is free from frustration and enjoys using it.
												</p>
												<p>
													In order to design a usable system, UCD adopts a series of strategies:
												</p>
												
													<p>
														- centralization of user needs as the leader of the product development 
													</p>
													<p>
														- users’ involvement during the UCD process
													</p>
													<p>
														- iterative developing, which allows to built up the knowledge step by step 
													</p>
													<p>
														- involvement of many other disciplines
													</p>
												
												
												<p>
													UCD can adopt many processes to achieve its purpose. In T-UCD, the UCD process is simplified by dividing it into three phases: user research, prototyping and evaluation. Each of them is composed by specified UCD methods that will be described in the next sections of this tutorial.
												</p>
												
												<p>
													Advantages of adopting UCD to develop a system are both financial and user satisfaction. A common agreement within the industry is that UCD is considered as a fundamental factor of success for the product usefulness. 
													In fact, in many cases there is a reduction of the development time and effort and of the support costs. That means, for example, that UCD allows detecting earlier functionalities that are useless thus avoiding to develop them: the earlier changes are detected, the less it will cost.
													Moreover, often there is an increase of revenue and sales. That is due to the fact that the users of the computer system are more satisfied in using it. 
												</p>
												<p>
													The reason why there are all these advantages is that UCD allows designers and developers to have a better picture of how the system should be because there is more empathy with the users: designers and developers can put themselves in end-users’ shoes.
												</p>
												<p>
													Concerning the main disadvantage of UCD, it is known that it may be time consuming. But if there are high time and budget constraints it is better to perform some cheap and rapid methods of UCD than nothing at all.
												</p>
												<p>
													Generally, 10% of a project budget should be invested in UCD approach, which increases in average 83% the usability of the system (Nielsen 2008).
												</p>
												
												<p>
													Sources:
														<p>
															- <a href="http://www.usability.gov/what-and-why/benefits-of-ucd.html">http://www.usability.gov/what-and-why/benefits-of-ucd.html</a>
														</p>
														<p>
															- <a href="http://www.nngroup.com/articles/return-on-investment-for-usability/">http://www.nngroup.com/articles/return-on-investment-for-usability/</a>														
														</p>
															- <a href="http://www.usabilitynet.org/management/b_overview.htm">http://www.usabilitynet.org/management/b_overview.htm</a>														
														</p>
														<p>
															- Stone D., Jarrett C., Woodroffe M., Minocha S., <i>User Interface Design and Evaluation, Morgan Kaufmann</i>, USA, 2005, pp. 15-20.													
														</p>
												
												

											</div>
											
											
											
											
											<!-- USER RESEARCH -->
											
											<div ng-show="field.toShow=='ur'">
												
												<h3 >
													<span class="fa-stack fa-lg">
														<i class="fa fa-user fa-stack-1x"></i> 
														<i class="fa fa-search fa-stack-2x"></i>
													</span>
													User research</h3>
												
												<p>
													<br/>
												In order to redesign an existing system or to design a new one that meets the needs of the end-users, it is important to understand them, their tasks and their environment where the system is or will be used. It may appear a simple task, but actually there are many aspects that should be discovered such as biography (age, family, personality, education…), professional status (job title, work experience, current work, tasks and responsibilities, professional goals…), health (abilities and disabilities), the relation with the technology (easiness, difficulties…) and so on. At the end of this research, it should be established what aspects will be considered as the system requirements.
												</p>
												<p>
												In the UCD process, user research focuses on these goals by applying a variety of methods such as: interview, survey, observation, persona, scenario and so on. 
												</p>
												<p>
												In the next sections of this tutorial, they will be presented by a short description, benefits and by presenting some best practices and examples in order to perform them in the best way.
												</p>
												<p>
												Sources:
												</p>
													<p>
														- <a href="http://www.usabilitynet.org/tools/mainrequirements.htm">http://www.usabilitynet.org/tools/mainrequirements.htm</a>
													</p>
													<p>
														- Stone D., Jarrett C., Woodroffe M., Minocha S., <i>User Interface Design and Evaluation</i>, Morgan Kaufmann, USA, 2005, ch. 2.													
													</p>
												
												
												
											</div>
											
											
											
											
											
											<!-- PROTOTYPING -->
											
											<div ng-show="field.toShow=='pr'">	
												
												<h3><i class="fa fa-cogs fa-2x"></i> Prototyping </h3>
												<br/>
												<p>
													During this phase, some prototypes of user interfaces are designed based on requirements previously established during the user research phase. Firstly, they will be drafted on paper with few details (low-fidelity prototype). This allows an easy and cheap way of exploring first ideas from which more detailed prototypes will mature through iterative process of evaluation and redesign. Secondly, when the design objectives are mainly achieved a computer-based prototype and with more details (high-fidelity prototype) can be created. That allows a simulation of interaction with the interface (when clicking on a button a fictive command is executed), which conveys a more realistic idea of the final computer system.
												</p>
												<p>
												The process of designing interfaces should be based on design guidelines. The most common are listed and summarized here below (Preece, 2011):
												</p>
												
													<p>
														<strong>Visibility </strong> – The more visible functions are, the more likely users will be able to know what to do next. In contrast, when functions are "out of sight," it makes them more difficult for users to find them and know how to use them.. 
													</p>
													<p>
														<strong>Feedback</strong> – Feedback is about sending back information about what action has been done and what has been accomplished, allowing the person to continue with the activity. Various kinds of feedback are available for interaction design-audio, tactile, verbal, and combinations of these. 
													</p>
													<p>
														<strong>Constraints</strong> – The design concept of constraining refers to determining ways of restricting the kind of user interaction that can take place at a given moment. There are various ways this can be achieved. 
													</p>
													<p>
														<strong>Mapping</strong> – This refers to the relationship between controls and their effects in the world. Nearly all artifacts need some kind of mapping between controls and effects, whether it is a flashlight, car, power plant, or cockpit. An example of a good mapping between control and effect is the up and down arrows used to represent the up and down movement of the cursor, respectively, on a computer keyboard. 
													</p>
													<p>
														<strong>Consistency</strong> – This refers to designing interfaces to have similar operations and use similar elements for achieving similar tasks. In particular, a consistent interface is one that follows rules, such as using the same operation to select all objects. For example, a consistent operation is using the same input action to highlight any graphical object at the interface, such as always clicking the left mouse button. Inconsistent interfaces, on the other hand, allow exceptions to a rule. 
													</p>
													<p>
														<strong>Affordance</strong> – is a term used to refer to an attribute of an object that allows people to know how to use it. For example, a mouse button invites pushing (in so doing acting clicking) by the way it is physically constrained in its plastic shell. At a very simple level, to afford means "to give a clue" (Norman, The Design of Everyday things, Basic Books, 2002). When the affordances of a physical object are perceptually obvious it is easy to know how to interact with it. 
													</p>
												
												<p>
												Producing prototypes of the target system allows making changes before it will actually be implemented. Changes accomplished after the system is coded have a higher cost in terms of time and money.
												Involving typical end-users in this phase is really important because designers are not the real end-users and may design prototypes that do not meet their needs.
												</p>
												<p>
												At the end of this phase, few designs should be chosen in order to use it for the next phase: evaluation.
												</p>
												<p>
												The methods to accomplish these tasks are for example sketch and storyboard that are included in low-fidelity prototype group and other methods under high-fidelity prototype. They will be described in the next section of this tutorial by a short description, benefits and by proving best practices and some examples in order to perform them in the best way.
												</p>
												
												<p>
													Sources:
												</p>
														<p>
															- <a href="http://www.nngroup.com/articles/paper-prototyping/">http://www.nngroup.com/articles/paper-prototyping/</a>
														</p>
														<p>
															- <a href="http://www.usability.gov/how-to-and-tools/methods/prototyping.html">http://www.usability.gov/how-to-and-tools/methods/prototyping.html</a>														
														</p>
														<p>
															- <a href="http://www.usabilitynet.org/tools/design.htm">http://www.usabilitynet.org/tools/design.htm</a>														
														</p>
														<p>
															- Preece, J., Rogers, Y., Sharp, H. (2011), <i>Interaction Design: Beyond Human-Computer Interaction</i>, New York: Wiley and Sons, p.26-29.											
														</p>
														<p>
															- Stone D., Jarrett C., Woodroffe M., Minocha S., <i>User Interface Design and Evaluation</i>, Morgan Kaufmann, USA, 2005, ch. 3.													
														</p>
													
												
	
												
												
											<!-- EVALUATION -->	
											</div>
											<div ng-show="field.toShow=='ev'">	
												
												<h3><i class="fa fa-question fa-2x"></i> Evaluation </h3>
												<br/>
												<p>
												Finally, the third phase consists in evaluating if the prototype(s), which has been established in the previous phase is/are usable: effective, efficient and satisfactory to use. The most commonly performed kind of evaluation is that which involves the end-users. Typically, they are supposed to accomplish some tasks with the prototype, to give feedback about problems and to explain their expectations. This phase is useful to designers in terms of understanding what should be improved.
												</p>
												<p>
												Furthermore, it is also possible to hire usability experts that check if the prototype achieves the usability heuristics.
												</p>
												<p>
												At the end of this phase, designers  should have gathered data in several formats such as comments, notes and audio or video recordings.
												</p>
												<p>
												Some methods performed in this phase are usability evaluation, heuristic evaluation and accessibility evaluation.
												</p>
												<p>
												They will be described in the next section of this tutorial by a short description of the method, of the benefits and by presenting some best practices and examples in order to perform them in the best way.
												</p>
												
												<p>
												Sources:
												</p>
													
														<p>
															- <a href="http://www.usabilitynet.org/tools/expertheuristic.htm">http://www.usabilitynet.org/tools/expertheuristic.htm</a>
														</p>
														<p>
															- <a href="http://www.usabilitynet.org/tools/evaluate.htm">http://www.usabilitynet.org/tools/evaluate.htm</a>														
														</p>
														<p>
															- Stone D., Jarrett C., Woodroffe M., Minocha S., <i>User Interface Design and Evaluation</i>, Morgan Kaufmann, USA, 2005, ch. 4.													
														</p>
													
												

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


			
										</div>
										
									</div>
							
								</div>
							
					
					
					</div>
			
				</body>
		</html>
			</xsl:template>
			
	
</xsl:stylesheet>   