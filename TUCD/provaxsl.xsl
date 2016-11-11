<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    
    <!-- HTML5 compatibility -->
    <xsl:output method="html"
        doctype-system="about:legacy-compat"
        encoding="UTF-8"
        indent="yes" /> 
    
    <!-- all document -->
   
        
               <xsl:template match="/"> 
            <html xmlns="http://www.w3.org/1999/xhtml">
                <head>
                    <title>T-UCD</title>
                    <script src="jQuery/jquery-1.9.1.js"></script>
                    <script src="jQuery/jquery-ui.js"></script>

                    <script src="javascripts/guids/math.uuid.js"></script>
                    <script src="javascripts/angular/angular.js"></script>
                    <script src="javascripts/angular/angular-ui-utils.min.js"></script>
                    <script src="javascripts/bootstrap/ui-bootstrap-tpls-0.6.0.min.js"></script>
                    
                    <script src="controllers/ValidatorControllerPersona.js"></script>
                    <script src="controllers/ValidatorControllerThinkAloudEvaluation.js"></script>
                    <script src="controllers/ValidatorControllerScenario.js"></script>
                    <script src="controllers/ValidatorControllerSketch.js"></script>
                    <script src="controllers/ValidatorControllerObservation.js"></script>
                    <script src="controllers/ValidatorControllerInterview.js"></script>
                    <script src="controllers/ValidatorControllerSurvey.js"></script>
                    <script src="controllers/ValidatorControllerStoryboard.js"></script>
                    <script src="controllers/ValidatorControllerMHFidelity.js"></script>
                    <script src="controllers/ValidatorControllerAccessibility.js"></script>

                    
                    <script src="controllers/UCD_MethodsNavigation.js"></script>
                    
                    
                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                    <meta name="keywords" content="" />
                    <meta name="description" content="" />


                    <link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
                    <link rel="stylesheet" href="css/jquery-ui.css" />
                    <link rel="stylesheet" href="button.css" />
                    <link rel="stylesheet" href="pure-min.css" />
                    <!--<link rel="stylesheet" href="css/bootstrap.css" />-->
                    <link href="font-awesome-4.0.1/css/font-awesome.min.css" rel="stylesheet"/>
                        
                    
                    <!--<script src="jquery.min.js"></script>-->
                        <!--<link rel="stylesheet" href="/resources/demos/style.css" />-->
                        <!--[if IE 6]>
                      		<link href="default_ie6.css" rel="stylesheet" type="text/css" />
                      	<![endif]-->
                        <script>
                            $(function() {
                                 $("#tabs").tabs();
                            });
                             $(function() {
                                    $( ".accordion" ).accordion({collapsible: true, active: false,  heightStyle: "content"});
                                });
                        </script>
                    
                        <script>
                            $(function() {
                                $( ".datepicker" ).datepicker();  

                            });
                            function reloadPage()
                              {
                              location.reload();
                              };
                        </script>
                    
                   
                   

                    <div id="dialog-confirm-saved" title="Method saved" style="display: none;">
                                    <div>
                                        Method saved successfully!
                                    </div>
                                </div>    


                                <div id="dialog-confirm-updated" title="Method updated" style="display: none;">
                                    <div>
                                        Method updated successfully!
                                    </div>
                    </div> 


                <div id="dialog-confirm" title="Delete method" style="display: none;">
                            <div>
                                Are you sure to delete this method?
                            </div>
                        </div>
                        <div id="dialog-ok-delete" title="Method deleted!" style="display: none;">
                            <div>
                                Method successfully deleted!
                            </div>
                </div>


                    
        </head>
             <body ng-app="AValidator" ng-controller = "UCD_MethodsNavigationController">

                 <div id="header" class="container">
                     <div id="logo">
                         <h1><a  title="homepage" href="../HOMEPAGE/homepage.html">T-UCD</a></h1><!--<a href="javascript:reloadPage();">-->

                     </div>
                     <div class="tutorialButtonContainer"> <a type="submit" id="tutorialButton" class="pure-button pure-button-primary" href="../UCD_Tutorial/methods1.xml">UCD Tutorial</a></div>
                 </div>
                 
                 
                 
                 <div id="page" class="container">
                     
                    
                     
                     <!-- SIDEBAR -->
                     <div id="sidebar" ng-model="project">


                         <div  style="font-size:1.5em;line-height:2em;"><strong>Project:</strong> <i> {{project.project_name}}</i> </div>   

                        <div id="sbox1" >
                            <div id="saved_method">
                                <form class="pure-form">
                                    <input type="text" ng-model="search" class="pure-input-rounded" placeholder="Search"/>
                                </form>
                            </div>
                             
                            <div >
                                <table class="pure-table pure-table-horizontal" ng-model="projectMethods" ng-repeat= 'projectMethod in projectMethods | filter:search'>

                                    <tbody>
                                        <tr>
                                            <td class="col_A">
                                                <i ng-class="'fa' + projectMethod.icon + 'fa-2x'"></i> 
                                            </td>
                                            <td class="col_B">
                                                 <a href="" ng-click="SelectMethod(projectMethod)">  {{projectMethod.file_name}} </a> 
                                            </td>
                                            <td class="col_C">

                                                <a class="pure-button" title="edit" style="padding:0.5em 0.7em;" ng-click="SelectMethod(projectMethod)">
                                                    <i class="fa fa-pencil fa-lg"></i>
                                                </a>
                                    
                                                <a class="pure-button" title="delete" style="padding:0.5em 0.7em;" ng-click="deleteDialog(projectMethod)" >  <!--ng-disabled="!canDelete()"-->
                                                    <i class=" fa fa-trash-o fa-lg"></i>  
                                                </a> 
                                            </td>
                                        </tr>
                                    </tbody>
                             
                                </table> 
                            </div>

                        </div>


                    </div>


                        
                
                     
                     
                     
                     <div id="content">
                         <div id="onecolumn">
                             
                             <!-- TABS WITH METHODS -->
                             <div id="tabs">
                                 <ul>
                                     <li>
                                         <a href="#tabs-1">User Research</a>
                                     </li>
                                     <li>
                                         <a href="#tabs-2">Prototyping</a>
                                     </li>
                                     <li>
                                         <a href="#tabs-3">Evaluation</a>
                                     </li>
                                     
                                 </ul>
                                 
                                 
                                 <!-- TABS WITH BUTTON of METHODS -->
                                 
                                 <!--TAB 1: USER RESEARCH -->
                                 <div id="tabs-1">
                                     
                                     <div class="pure-g-r">

                                        <div class="pure-u-1-6">
                                     
                                     
                                             <!-- PERSONA -->
                                            
                                             <a href="#" class="pure-button" ng-click="showMethod.data = 'pers'; NewPersona()" >
        
                                                 <i class="fa fa-user fa-3x"></i>
                                                 <i class="fa fa-plus fa-2x"></i>
                                                 
                                                 <span class="a-btn-text">Persona</span>
                                                 
                                             </a>
                                        </div>
                                         
                                         
                                         <!-- SCENARIO -->
                                         <div class="pure-u-1-6">
                                             
                                             <a href="#" class="pure-button" ng-click="showMethod.data = 'sce'">
                                                 
                                                 <i class="fa fa-file-text-o fa-3x"></i> 
                                                 <i class="fa fa-plus fa-2x"></i>
                                                 
                                                 <span class="a-btn-text">Scenario</span>
                                                 
                                             </a>
                                         </div>
                                         
                                        
                                         
                                         
                                         
                                         
                                        
                                         
                                         <!-- INTERVIEW -->
                                         <div class="pure-u-1-6">
                                             
                                             <a href="#" class="pure-button" ng-click="showMethod.data ='int'">
                                                 
                                                 <i class="fa fa-microphone fa-3x"></i> 
                                                 <i class="fa fa-plus fa-2x"></i>
                                                 
                                                 <span class="a-btn-text">Interview</span>
                                                 
                                             </a>
                                         </div>
                                         
                                         <!-- Survey -->
                                         <div class="pure-u-1-6">
                                             
                                             <a href="#" class="pure-button" ng-click="showMethod.data ='sur'">
                                                 
                                                 <i class="fa fa-pencil-square-o fa-3x"></i> 
                                                 <i class="fa fa-plus fa-2x"></i>
                                                 
                                                 <span class="a-btn-text">Survey</span>
                                                 
                                             </a>
                                         </div>

                                          <!-- OBSERVATION -->
                                         <div class="pure-u-1-6">
                                             
                                             <a href="#" class="pure-button" ng-click="showMethod.data ='obs'">
                                                 
                                                 <i class="fa fa-eye fa-3x"></i> 
                                                 <i class="fa fa-plus fa-2x"></i>
                                                 
                                                 <span class="a-btn-text">Observation</span>
                                                 
                                             </a>
                                         </div>
                                         
                                         
                                         
                                     </div>
    
                                    	
                                 </div>
                                 
                                 
                                 
                                 <!--TAB 2: PROTOTYPING -->
                                 <div id="tabs-2">
                                     
                                     <div class="pure-g-r">
                                         
                                         <div class="pure-u-1-6">
                                             
                                             
                                             <!-- SKETCH -->
                                             <a href="#" class="pure-button" ng-click="showMethod.data ='ske'">
                                                 
                                                 <i class="fa fa-edit fa-3x"></i> 
                                                 <i class="fa fa-plus fa-2x"></i>
                                                 
                                                 <span class="a-btn-text">Sketch</span>
                                                 
                                             </a>
                                         </div>

                                         <!-- STORYBOARD -->
                                         <div class="pure-u-1-6">
                                             
                                             <a href="#" class="pure-button" ng-click="showMethod.data = 'sto'">
                                                 
                                                 <i class="fa fa-th fa-3x"></i> 
                                                 <i class="fa fa-plus fa-2x"></i>
                                                 
                                                 <span class="a-btn-text">Storyboard</span>
                                                 
                                             </a>
                                         </div>


                                          <!-- MEDIUM/HIGH-FIDELITY PROTOTYPE -->
                                         <div class="pure-u-1-6">
                                             
                                             <a href="#" class="pure-button" ng-click="showMethod.data = 'mhf'">
                                                 
                                                 <i class="fa fa-hand-o-up fa-3x"></i> 
                                                 <i class="fa fa-plus fa-2x"></i>
                                                 
                                                 <span class="a-btn-text">Medium/high-fidelity</span>
                                                 
                                             </a>
                                         </div>
                                         
                                         
                                     </div>
      
                                     
                                 </div>
                                 
                                 
                                 
                                 <!--TAB 3: EVALUATION -->
                                 <div id="tabs-3">
                                     
                                     <div class="pure-g-r">
                                         
                                         <div class="pure-u-1-4">
                                             
                                             
                                            <!-- USABILITY EVALUATION -->
                                            <a href="#" class="pure-button" ng-click="showMethod.data ='tae'">
                                                
                                                <i class="fa fa-laptop fa-3x"></i> 
                                                <i class="fa fa-plus fa-2x"></i>
                                                
                                                <span class="a-btn-text">Usability evaluation</span>
                                                
                                            </a>
                                         </div>

                                         <div class="pure-u-1-4">
                                             
                                             
                                            <!-- ACCESSIBILITY TESTING -->
                                            <a href="#" class="pure-button" ng-click="showMethod.data ='acc'">
                                                
                                                <i class="fa fa-wheelchair fa-3x"></i> 
                                                <i class="fa fa-plus fa-2x"></i>
                                                
                                                <span class="a-btn-text">Accessibility testing</span>
                                                
                                            </a>
                                         </div>
                                         
            
                                     </div>
                                     
                                 </div>
                                 
                                 
                                 
                                 
                             </div>
                         </div>
                         
                         <!-- WORKSPACE -->	
                         <div id="two-column">
                             <div class="box-content" style="overflow: auto;" >

                                 
                                 <!-- PERSONA -->
                                 <div ng-show="showMethod.data == 'pers'" width="700" height="1000" ng-controller = "DetailControllerPersona"> <xsl:call-template name="persona"/></div>
                                 
                                 <!-- SCENARIO -->
                                 <div ng-show="showMethod.data == 'sce'" width="700" height="1000" ng-controller = "DetailControllerScenario"> <xsl:call-template name="scenario"/></div>
                                 
                                 <!-- OBSERVATION -->
                                 <div ng-show="showMethod.data == 'obs'" width="700" height="1000" ng-controller = "DetailControllerObservation"> <xsl:call-template name="observation"/></div>
                                 
                                 <!-- SKETCH -->
                                 <div ng-show="showMethod.data=='ske'" width="700" height="1000" ng-controller = "DetailControllerSketch" > <xsl:call-template name="sketch"/></div>
                                 
                                 <!-- THINK-ALOUD EVALUATION -->
                                 <div ng-show="showMethod.data=='tae'" width="700" height="1000" ng-controller = "DetailControllerThinkAloudEv"> <xsl:call-template name="thinkAloudEvaluation"/></div>
                                 
                                 <!-- INTERVIEW -->
                                 <div ng-show="showMethod.data=='int'" width="700" height="1000" ng-controller = "DetailControllerInterview"> <xsl:call-template name="interview"/></div>
                                 
                                 <!-- SURVEY -->
                                 <div ng-show="showMethod.data=='sur'" width="700" height="1000" ng-controller = "DetailControllerSurvey"> <xsl:call-template name="survey"/></div>

                                 <!-- STORYBOARD -->
                                 <div ng-show="showMethod.data=='sto'" width="700" height="1000" ng-controller = "DetailControllerStoryboard"> <xsl:call-template name="storyboard"/></div>
                                 
                                  <!-- MEDIUM/HIGH-FIDELITY PROTOTYPING -->
                                 <div ng-show="showMethod.data=='mhf'" width="700" height="1000" ng-controller = "DetailControllerMHFidelity"> <xsl:call-template name="mhfidelity"/></div>

                                <!-- ACCESSIBILITY TESTING -->
                                <div ng-show="showMethod.data=='acc'" width="700" height="1000" ng-controller = "DetailControllerAccessibility"> <xsl:call-template name="accessibility"/></div>
                                 
                             </div>
                         </div>
                     </div>
                 </div>

             </body>
                
             
        
            
         </html>
    </xsl:template>
    
    
    
    
    
  <!--TEMPLATE FOR PERSONA -->  
    
    
    
    <xsl:template name ="persona" match="methods/persona">

        <div class="accordion">
            <h3>What's a persona?</h3>
                <div style="overflow: auto; height: 15em;">
                    <xsl:for-each select="//method">
                        <xsl:if test="method_name = 'Persona'">

                            <h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
                            <br/>
                            <strong>Description</strong>
                            <p> 
                                <xsl:value-of select="./tutorial/description"/>
                            </p>
                                                                        
                            <strong>Benefits</strong>
                                <p> 
                                    <ul>
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
                                    <ul>
                                        <xsl:for-each select="./tutorial/examples/example">
                                            <li>
                                                <xsl:value-of select="child::text()"/>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                                                            
                                </p>

                    </xsl:if>
                </xsl:for-each>
            </div>
        </div>


        <form name="persForm" class="pure-form pure-form-stacked" >   
 
            <fieldset id="fieldset"> 
              
               
                <legend class="legend"><i class="fa fa-user fa-2x"></i>  <strong>   {{titleText}}</strong></legend>
                

                <label for="file_name">File name* :</label><input type="text" name="{file_name}" ng-model="pers.file_name" ng-required="true"/>

                <!--<label>ID* :</label><input type="text" name="{_id}" ng-model="pers._id.$oid"/>-->


                
                <!-- General info -->
                <div class="pure-g-r">
                    <fieldset>
                        <legend>General information</legend>
                        
                         <div class="pure-u-1-2">
                             <label for="user_group">User Group :</label><input type="text" name="{user_group}" ng-model="pers.user_group" /> <!--ng-required="true"-->
                         </div>
                         <div class="pure-u-1-2">    
                             <label>Photo :</label><input type="file" name="{photo}" ng-model="pers.photo"/>
                         </div>
                         <div class="pure-u-1-2">
                             <label>Fictional name :</label><input type="date" name="{fictional_name}" ng-model="pers.fictional_name"/><!--ng-required="true"-->
                         </div>
                         <div class="pure-u-1-2">
                             <label>Age :</label><input type="number" name="{age}" ng-model="pers.age" /><!--ng-required="true"-->
                         </div>
                        <div class="pure-u-1-2">
                            <label>Sex:</label>
                            <label class="pure-radio">
                                <input id="sex_f" name="{sex}" type="radio" ng-model="pers.sex" value="female"/> Female
                            </label>
                            <label class="pure-radio">
                                <input id="sex_m" name="{sex}" type="radio" ng-model="pers.sex" value="male"/> Male
                            </label>
                                    <!--ng-required="true"-->
                        </div>
                        <div class="pure-u-1-2">
                            <label>Priority:</label>
                             <label class="pure-radio">
                                <input id="priority_H" name="{priority}" type="radio" ng-model="pers.priority" value="high"/> High (Primary Persona)
                             </label>
                             <label class="pure-radio">
                                <input id="priority_M" name="{priority}" type="radio" ng-model="pers.priority" value="medium"/> Medium
                             </label>
                            <label class="pure-radio">
                                <input id="priority_L" name="{priority}" type="radio" ng-model="pers.priority" value="low"/> Low
                             </label>
                        </div>
                    </fieldset>
                </div>
            
                
                <!-- Biography -->
                <div class="pure-g-r">
                    <fieldset>
                    <legend>Biography</legend>


                        <div class="pure-u-1-2">
                            <label>Marital status:</label>
                                <label class="pure-radio">
                                    <input id="marital_status" name="{marital_status}" type="radio" ng-model="pers.marital_status" value="single"/> Single
                                </label>
                                <label class="pure-radio">
                                    <input id="marital_status" name="{marital_status}" type="radio" ng-model="pers.marital_status" value="married"/> Married
                                </label>
                        </div>
                    
                    
                    <div class="pure-u-1-2">     
                        <label>Family status :</label><textarea type="text" name="{family_status}" ng-model="pers.family_status"/>
                    </div>
                    <div class="pure-u-1-2">     
                        <label>Education :</label><textarea type="text" name="{education}" ng-model="pers.education" /><!--ng-required="true"-->
                    </div>
                    <div class="pure-u-1-2">  
                        <label>Personality :</label><textarea type="text" name="{personality}" ng-model="pers.personality"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Hobbies :</label><textarea type="text" name="{hobbies}" ng-model="pers.hobbies" /><!--ng-required="true"-->
                    </div>
                    <div class="pure-u-1-2">
                        <label>Personal goals :</label><textarea type="text" name="{personal_goals}" ng-model="pers.personal_goals" /><!--ng-required="true"-->
                    </div>
                    </fieldset>
                    
                </div>    
                
                <!-- Professional status -->
                <div class="pure-g-r">
                    <fieldset>
                        <legend>Professional status</legend>
                        
                        <div class="pure-u-1-2">
                            <label>Job title :</label> <textarea type="text" name="{job_title}" ng-model="pers.job_title" /> <!--ng-required="true"-->
                        </div>
                        <div class="pure-u-1-2">     
                            <label>Work experience :</label><textarea type="text" name="{work_experience}" ng-model="pers.work_experience" /><!--ng-required="true"-->
                        </div>
                        <div class="pure-u-1-2">     
                            <label>Current work :</label><textarea type="text" name="{current_work}" ng-model="pers.current_work" /> <!--ng-required="true"-->
                        </div>
                        <div class="pure-u-1-2">  
                            <label>Tasks and responsabilities :</label><textarea type="text" name="{tasks_responsabilities}" ng-model="pers.tasks_responsabilities" /><!--ng-required="true"-->
                        </div>
                        <div class="pure-u-1-2">
                            <label>Professional goals :</label><textarea type="text" name="{professional_goals}" ng-model="pers.professional_goals" /><!--ng-required="true"-->
                        </div>
                    </fieldset>
                    
                </div>    
                
                
                
                <!-- Health & Technology -->
                <div class="pure-g-r">
                    
                    
                    <div class="pure-u-1-2">
                        <legend>Health</legend>
                        <textarea type="text" name="{health}" ng-model="pers.health"/><!--ng-required="true"-->
                    </div>
                    <div class="pure-u-1-2">
                        <legend>Technology</legend>
                        <textarea type="text" name="{technology}" ng-model="pers.technology" /><!--ng-required="true"-->
                    </div>
                    <div class="pure-u-1-2">
                        <legend>User needs</legend>
                        <textarea type="text" name="{user_need}" ng-model="pers.user_need" /><!--ng-required="true"-->
                    </div>
                    
                </div>
              
                
               
                
                
                <!-- Others -->
                <div class="pure-g-r">
                    <legend>Others</legend>
                    
                    <div class="pure-u-1-2">
                        <label>Notes</label><textarea class="others" type="text" name="{notes}" id="notes" ng-model="pers.notes"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Attachment :</label><input type="file" name="{attachments}" ng-model="pers.attachments"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Links :</label><input id="links" type="text" name="{links}" ng-model="pers.links"/>
                    </div>

                    
                </div>
                
                
                
                
                
                
                
            </fieldset>
            <!--<button ng-click="AddPersona()" ng-disabled="!canAdd()">Add</button>-->
            
            <div class="actionMethod">
                
                <a class="pure-button pure-button-primary" ng-click="NewOrUpdatePersona()" ng-class="method_saved" href="#saved_method">Save</a> <!--pure-button-disabled ng-disabled="!canAdd()" listPersona=true"-->
                <a class="pure-button" ng-click="NewPersona()">Reset</a>
                <!-- <button ng-click="DeletePersona()" ng-disabled="!canDelete()">Delete</button><br/>-->

            </div>   
        </form>
     
        
    </xsl:template> 
    
    
    
    
    
    
    
    
    
    <!--TEMPLATE FOR USABILITY EVALUATION -->  
 
    
    
    
    
    
    <xsl:template name="thinkAloudEvaluation" match="methods/thinkAloudEv">
        
        
        <div class="accordion">
            <h3>What's Usability Evaluation?</h3>
            <div style="overflow: auto; height: 15em;">
                <xsl:for-each select="//method">
                    <xsl:if test="method_name = 'Usability evaluation'">
                        
                        <h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
                        <br/>
                        <strong>Description</strong>
                        <p> 
                            <xsl:value-of select="./tutorial/description"/>
                        </p>
                        
                        <strong>Benefits</strong>
                        <p> 
                            <ul>
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
                            <ul>
                                <xsl:for-each select="./tutorial/examples/example">
                                    <li>
                                        <xsl:value-of select="child::text()"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            
                        </p>
                        
                    </xsl:if>
                </xsl:for-each>
            </div>
        </div>
        
        <form name="thinkAloudEvaluationForm" class="pure-form pure-form-stacked"> 
            <fieldset id="fieldset"> 
                
                
                <legend class="legend"><i class="fa fa-laptop fa-2x"></i> <strong> {{titleText}}</strong></legend>

                <label for="file_name">File name* :</label><input type="text" name="{file_name}" ng-model="thinkAloudEval.file_name" ng-required="true"/>

                       
                    
                    
                    <div class="pure-g-r">
                       
                            <div class="pure-u-1-2">
                                <label>Start :</label><input type="text" class="datepicker" name="{start_date_execution}" ng-model="thinkAloudEval.start_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>
                            </div>
                            <div class="pure-u-1-2">
                                <label>End :</label><input type="text" class="datepicker" name="{end_date_execution}" ng-model="thinkAloudEval.end_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>                 
                            </div>
                            <div class="pure-u-1-2">
                                <label>Objective:</label><textarea type="text" name="{objective}" ng-model="thinkAloudEval.objective" />
                            </div>
                    </div>
        
                 <!-- Evaluation description -->
                 <div class="pure-g-r">
                     <legend>Evaluation description</legend>
                
                     <strong>Users</strong><br/><br/>
                     <div class="pure-u-1-2">
                         <label>Number :</label><input type="number" name="{users_evaluation_number}" ng-model="thinkAloudEval.users_evaluation_number" />
                     </div>
                     <div class="pure-u-1-2">
                         <label>Group :</label><input type="text" name="{users_evaluation_group}" ng-model="thinkAloudEval.users_evaluation_group" />
                     </div>
                     <div class="pure-u-1-2">
                         <label>Users expected skills/knowledge :</label><textarea type="text" name="{users_expected_skills_knowledge}" ng-model="thinkAloudEval.users_expected_skills_knowledge"/>
                     </div>
                     
                     
                 </div>
     

                <!-- Condition -->
                <br/><br/>
                <div class="pure-g-r">
                <strong>Methodology</strong><br/><br/>
                    <div class="pure-u-1-2">
                        <label>Place :</label><input type="text" name="{place}" ng-model="thinkAloudEval.place" />

                             <label>Recording:</label>
                             <label class="pure-checkbox">
                                 <input type="checkbox" name="{recordingNotes}" ng-model="thinkAloudEval.recordingNotes" value="written_notes" /> Written notes 
                             </label>
                             <label class="pure-checkbox">
                                 <input type="checkbox" name="{recordingAudio}" ng-model="thinkAloudEval.recordingAudio" value="audio"/> Audio
                             </label>
                             <label class="pure-checkbox">
                                 <input type="checkbox" name="{recordingVideo}" ng-model="thinkAloudEval.recordingVideo" value="video"/> Video
                             </label>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Procedure :</label><textarea type="text" name="{how}" ng-model="thinkAloudEval.procedure" />
                    </div>
                    <div class="pure-u-1-2">
                        <label>Material :</label><textarea type="text" name="{material}" ng-model="thinkAloudEval.material" />
                    </div>
                    
                    <div class="pure-u-1-2">
                        <label>Training :</label><textarea type="text" name="{training}" ng-model="thinkAloudEval.training"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>User tasks :</label><textarea type="text" name="{user_task}" ng-model="thinkAloudEval.user_task"/>
                    </div>

                        <br/><br/>
               
                    <legend>Prototype(s)</legend>
                    <div class="pure-u-1-2">
                        <label>Prototype name :</label><input type="text" name="{mainPrototype_name}" ng-model="thinkAloudEval.mainPrototype_name"/>
                        <label>Prototype link:</label><input id="links" type="text" name="{mainPrototype_link}" ng-model="thinkAloudEval.mainPrototype_link"/>
                        <label>Prototype attachment:</label><input type="file" name="{mainPrototype_attachment}" ng-model="thinkAloudEval.mainPrototype_attachment"/>
                        <br/><br/>
                        
                    </div>
                        
                    <div class="pure-u-1-2">
                        <label>Prototype name :</label><input type="text" name="{prototype_name}" ng-model="thinkAloudEval.prototype_name"/>
                        <label>Prototype link:</label><input id="links" type="text" name="{prototype_link}" ng-model="thinkAloudEval.prototype_link"/>
                        <label>Prototype attachment:</label><input type="file" name="{prototype_attachment}" ng-model="thinkAloudEval.prototype_attachment"/>
                        <br/><br/>
                    </div>
               
                
                <br/><br/>

                
                </div>
                
                
                <!-- Results -->
                <div class="pure-g-r">
                    <legend>Results</legend>
                    
                    <div class="pure-u-1-2">
                        <label>Findings :</label><textarea type="text" name="{findings}" ng-model="thinkAloudEval.findings"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Recorded file :</label><input type="file" name="{recorded_file}" ng-model="thinkAloudEval.recorded_file" />                 
                    </div>
                    
                </div>
                
                <!-- Recommendations --> 
                <div class="pure-g-r">
                    <legend>Recommendations</legend>
                    
                    <div class="pure-u-1-2">
                        <label>High :</label><textarea type="text" name="{recommendations_high}" ng-model="thinkAloudEval.recommendations_high"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Medium :</label><textarea type="text" name="{recommendations_medium}" ng-model="thinkAloudEval.recommendations_medium" />                 
                    </div>
                    <div class="pure-u-1-2">
                        <label>Low :</label><textarea type="text" name="{recommendations_low}" ng-model="thinkAloudEval.recommendations_low" />                 
                    </div>
                    
                </div>
        
        
        
                <!-- Others -->
                <div class="pure-g-r">
                    <legend>Others</legend>
                    
                    <div class="pure-u-1-2">
                        <label>Notes :</label><textarea type="text" name="{notes}" id="notes" ng-model="thinkAloudEval.notes"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Links :</label><input id="links" type="text" name="{links}" ng-model="thinkAloudEval.links"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Attachments:</label><input type="file" name="{attachments}" ng-model="thinkAloudEval.attachments"/>
                    </div>
                </div>
            </fieldset>

            <div class="actionMethod">
                
                <a class="pure-button pure-button-primary" ng-click="NewOrUpdateThinkAloudEv()" href="#saved_method">Save</a> <!--pure-button-disabled ng-disabled="!canAdd()" listPersona=true"-->
                <a class="pure-button" ng-click="NewThinkAloudEval()">Reset</a>
                <!-- <button ng-click="DeletePersona()" ng-disabled="!canDelete()">Delete</button><br/>-->
                
            </div>   
            
        </form>
    </xsl:template>
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!--TEMPLATE FOR SCENARIO -->  
    
    <xsl:template name="scenario" match="methods/scenario">
        
        <div class="accordion">
            <h3>What's Scenario?</h3>
            <div style="overflow: auto; height: 15em;">
                <xsl:for-each select="//method">
                    <xsl:if test="method_name = 'Scenario'">
                        
                        <h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
                        <br/>
                        <strong>Description</strong>
                        <p> 
                            <xsl:value-of select="./tutorial/description"/>
                        </p>
                        
                        <strong>Benefits</strong>
                        <p> 
                            <ul>
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
                            <ul>
                                <xsl:for-each select="./tutorial/examples/example">
                                    <li>
                                        <xsl:value-of select="child::text()"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            
                        </p>
                        
                    </xsl:if>
                </xsl:for-each>
            </div>
        </div>
        
        
        
        <form name="scenForm" class="pure-form pure-form-stacked"> 
            <fieldset id="fieldset"> 
                
                <legend class="legend"><i class="fa fa-file-text-o fa-2x"></i> <strong> {{titleText}}</strong></legend> 
                
                <label for="file_name">File name* :</label><input type="text" name="{file_name}" ng-model="scen.file_name" ng-required="true"/>
                

                        <div class="pure-g-r">
                            <legend>Scenario Description</legend><textarea class="textareaBig" type="text" name="{scenario_description}" ng-model="scen.scenario_description"/>
                         </div>
                

        
                     <!-- Others -->
                     <div class="pure-g-r">
                         <legend>Others</legend>
                         
                         <div class="pure-u-1-2">
                             <label>Notes :</label><textarea type="text" name="{notes}" id="notes" ng-model="scen.notes"/>
                         </div>
                         <div class="pure-u-1-2">
                             <label>Links :</label><input id="links" type="text" name="{links}" ng-model="scen.links"/>
                         </div>
                         <div class="pure-u-1-2">
                             <label>Attachments:</label><input type="file" name="{attachments}" ng-model="scen.attachments"/>
                         </div>
                     </div>
            </fieldset>
            
            <div class="actionMethod">
                
                <a class="pure-button pure-button-primary" ng-click="NewOrUpdateScenario()" href="#saved_method">Save</a> <!--pure-button-disabled ng-disabled="!canAdd()" listPersona=true"-->
                <a class="pure-button" ng-click="NewScenario()">Reset</a>
                <!-- <button ng-click="DeletePersona()" ng-disabled="!canDelete()">Delete</button><br/>-->
                
            </div>   
        </form>


    </xsl:template>
    
    
    
    
    
    
    <!--TEMPLATE FOR OBSERVATION -->  
    
    <xsl:template name="observation" match="methods/observation">
        
        <div class="accordion">
            <h3>What's Observation?</h3>
            <div style="overflow: auto; height: 15em;">
                <xsl:for-each select="//method">
                    <xsl:if test="method_name = 'Observation'">
                        
                        <h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
                        <br/>
                        <strong>Description</strong>
                        <p> 
                            <xsl:value-of select="./tutorial/description"/>
                        </p>
                        
                        <strong>Benefits</strong>
                        <p> 
                            <ul>
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
                            <ul>
                                <xsl:for-each select="./tutorial/examples/example">
                                    <li>
                                        <xsl:value-of select="child::text()"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            
                        </p>
                        
                    </xsl:if>
                </xsl:for-each>
            </div>
        </div>
        
        <form name="obsForm" class="pure-form pure-form-stacked"> 
            <fieldset id="fieldset"> 
                
                <legend class="legend"><i class="fa fa-eye fa-2x"></i> <strong> {{titleText}}</strong></legend> 
                
                <label for="file_name">File name* :</label><input type="text" name="{file_name}" ng-model="obs.file_name" ng-required="true"/>
                

                <div class="pure-g-r">
                    
                    <div class="pure-u-1-2">
                        
                        <label>Start :</label><input type="text" class="datepicker" name="{start_date_execution}" ng-model="obs.start_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy" />
                    </div>
                    <div class="pure-u-1-2">
                        <label>End :</label><input type="text" class="datepicker" name="{end_date_execution}" ng-model="obs.end_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>                 
                    </div>
                    <div class="pure-u-1-2">
                        <label>Objective:</label><textarea type="text" name="{objective}" ng-model="obs.objective" />
                    </div>
                </div>
                
 
                
                <!-- Participants -->
                <div class="pure-g-r">
                    <legend>Participants</legend>
                    <div class="pure-u-1-2">
                        
                        <label>Number :</label><input type="number" name="{participants_number}" ng-model="obs.participants_number"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Group :</label><input id="links" type="text" name="{participants_group}" ng-model="obs.participants_group" />                 
                    </div>
                </div>
                
                
                <!-- Methodology -->
                <div class="pure-g-r">
                    <legend>Methodology</legend>
                    <div class="pure-u-1-2">
                        
                        <label>Place :</label><input type="text" name="{place}" ng-model="obs.place" />
                    </div>
                    <div class="pure-u-1-2">
                        <label>Procedure :</label><textarea type="text" name="{procedure}" ng-model="obs.procedure"/>                 
                    </div>
                    <div class="pure-u-1-2">
                        <label>Recording:</label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{recordingNotes}" ng-model="obs.recordingNotes" value="written_notes" /> Written notes 
                        </label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{recordingAudio}" ng-model="obs.recordingAudio" value="audio"/> Audio
                        </label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{recordingVideo}" ng-model="obs.recordingVideo" value="video"/> Video
                        </label>
                    </div>
                    
                    
                </div>
                
                <!-- Results --> 
                <div class="pure-g-r">
                    <legend>Results</legend>
                    
                    <div class="pure-u-1-2">
                        <label>Data collected:</label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{data_collectedQual}" ng-model="obs.data_collectedQual" /> Qualitative 
                        </label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{data_collectedQuan}" ng-model="obs.data_collectedQuan" /> Quantitative
                        </label>
                       
                    </div>
                    
                    
                     
                           
                        
                        <div class="pure-u-1-2">
                            <label>Findings :</label><textarea type="text" name="{findings}" ng-model="obs.findings"/>
                        </div>
                        <div class="pure-u-1-2">
                            <label>Recorded file :</label><input type="file" name="{recording_file}" ng-model="obs.recording_file"/>                 
                        </div>
                    
                    <!-- Recommendations --> 
                    <div class="pure-g-r">
                        <legend>Recommendations</legend>
                        
                            <div class="pure-u-1-2">
                                <label>High :</label><textarea type="text" name="{recommendations_high}" ng-model="obs.recommendations_high"/>
                            </div>
                            <div class="pure-u-1-2">
                                <label>Medium :</label><textarea type="text" name="{recommendations_medium}" ng-model="obs.recommendations_medium" />                 
                            </div>
                            <div class="pure-u-1-2">
                                <label>Low :</label><textarea type="text" name="{recommendations_low}" ng-model="obs.recommendations_low" />                 
                            </div>
                        
                    </div>

                </div>
                
                
                
                
                <!-- Others -->
                <div class="pure-g-r">
                    <legend>Others</legend>
                    
                    <div class="pure-u-1-2">
                        <label>Notes :</label><textarea type="text" name="{notes}" id="notes" ng-model="obs.notes"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Links :</label><input id="links" type="text" name="{links}" ng-model="obs.links"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Attachments:</label><input type="file" name="{attachments}" ng-model="obs.attachments"/>
                    </div>
                </div>
            </fieldset>
            <div class="actionMethod">
                
                <a class="pure-button pure-button-primary" ng-click="NewOrUpdateObservation()" href="#saved_method">Save</a> <!--pure-button-disabled ng-disabled="!canAdd()" listPersona=true"-->
                <a class="pure-button" ng-click="NewObservation()">Reset</a>
                <!-- <button ng-click="DeletePersona()" ng-disabled="!canDelete()">Delete</button><br/>-->

            </div>   

        </form>
        
        
    </xsl:template>
    
    
    
    
    
    
    
    
    
    
    <!--TEMPLATE FOR SKETCH --> 
    <xsl:template name="sketch" match="methods/sketch">
        
        <div class="accordion">
            <h3>What's Sketch?</h3>
            <div style="overflow: auto; height: 15em;">
                <xsl:for-each select="//method">
                    <xsl:if test="method_name = 'Sketch'">
                        
                        <h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
                        <br/>
                        <strong>Description</strong>
                        <p> 
                            <xsl:value-of select="./tutorial/description"/>
                        </p>
                        
                        <strong>Benefits</strong>
                        <p> 
                            <ul>
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
                            <ul>
                                <xsl:for-each select="./tutorial/examples/example">
                                    <li>
                                        <xsl:value-of select="child::text()"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            
                        </p>
                        
                    </xsl:if>
                </xsl:for-each>
            </div>
        </div>
        
        
        <form name="sketForm" class="pure-form pure-form-stacked"> 
            <fieldset id="fieldset"> 
                
                <legend class="legend"><i class="fa fa-edit fa-2x"></i>   <strong> {{titleText}}</strong></legend> 
                
                <label for="file_name">File name* :</label><input type="text" name="
                {file_name}" ng-model="sket.file_name" ng-required="true"/>
                
                
                
                <!--Dates of execution-->
                <div class="pure-g-r">
                    <legend>Dates of execution</legend>
                    <div class="pure-u-1-2">
                        
                        <label>Start :</label><input type="text" class="datepicker" name="{start_date_execution}" ng-model="sket.start_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>End :</label><input type="text" class="datepicker" name="{end_date_execution}" ng-model="sket.end_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy" />                 
                    </div>
                </div>
                
                <br/> <br/>
                <!--Sketches-->
                <div class="pure-g-r">
                    <legend>Sketche(s)</legend>
                    <div class="pure-u-1-2">
                        <label>Sketch name :</label><input type="text" name="{mainSketch_name}" ng-model="sket.mainSketch_name"/>
                        <label>Sketch link:</label><input id="links" type="text" name="{mainSketch_link}" ng-model="sket.mainSketch_link"/>
                        <label>Sketch attachment:</label><input type="file" name="{mainSketch_attachment}" ng-model="sket.mainSketch_attachment"/>
                    </div>
                        
                    <div class="pure-u-1-2">
                        <label>Sketch name :</label><input type="text" name="{sketch_name}" ng-model="sket.sketch_name"/>
                        <label>Sketch link:</label><input id="links" type="text" name="{sketch_link}" ng-model="sket.sketch_link"/>
                        <label>Sketch attachment:</label><input type="file" name="{sketch_attachment}" ng-model="sket.sketch_attachment"/>

                    </div>
                </div>
               
                
                
                <br/> <br/>
                <!-- Others -->
                <div class="pure-g-r">
                    <legend>Others</legend>
                    
                    <div class="pure-u-1-2">
                        <label>Notes :</label><textarea type="text" name="{notes}" id="notes" ng-model="sket.notes"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Links :</label><input id="links" type="text" name="{links}" ng-model="sket.links"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Attachments:</label><input type="file" name="{attachments}" ng-model="sket.attachments"/>
                    </div>
                </div>
            </fieldset>
            <div class="actionMethod">
                
                <a class="pure-button pure-button-primary" ng-click="NewOrUpdateSketch()" href="#saved_method">Save</a> <!--pure-button-disabled ng-disabled="!canAdd()" listPersona=true"-->
                <a class="pure-button" ng-click="NewSketch()">Reset</a>
                <!-- <button ng-click="DeletePersona()" ng-disabled="!canDelete()">Delete</button><br/>-->

            </div>   
        </form>
        
        
    </xsl:template>
   
   
   
   
   
   
   
    <!--TEMPLATE FOR INTERVIEW -->  
    
    <xsl:template name="interview" match="methods/interview">
        
        <div class="accordion">
            <h3>What's Interview?</h3>
            <div style="overflow: auto; height: 15em;">
                <xsl:for-each select="//method">
                    <xsl:if test="method_name = 'Interview'">
                        
                        <h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
                        <br/>
                        <strong>Description</strong>
                        <p> 
                            <xsl:value-of select="./tutorial/description"/>
                        </p>
                        
                        <strong>Benefits</strong>
                        <p> 
                            <ul>
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
                            <ul>
                                <xsl:for-each select="./tutorial/examples/example">
                                    <li>
                                        <xsl:value-of select="child::text()"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            
                        </p>
                        
                    </xsl:if>
                </xsl:for-each>
            </div>
        </div>
        
        
        <form name="intForm" class="pure-form pure-form-stacked"> 
            <fieldset id="fieldset"> 
                
                <legend class="legend"><i class="fa fa-microphone fa-2x"></i>  <strong> {{titleText}}</strong></legend> 
                
                <label for="file_name">File name* :</label><input type="text" name="{file_name}" ng-model="int.file_name" ng-required="true"/>
                
                
                <div class="pure-g-r">
                    
                    <div class="pure-u-1-2">
                        
                        <label>Start :</label><input type="text" class="datepicker" name="{start_date_execution}" ng-model="int.start_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>End :</label><input type="text" class="datepicker" name="{end_date_execution}" ng-model="int.end_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>                 
                    </div>
                    <div class="pure-u-1-2">
                        <label>Objective:</label><textarea type="text" name="{objective}" ng-model="int.objective" />
                    </div>
                </div>
                
                
                
                <!-- Participants -->
                <div class="pure-g-r">
                    <legend>Participants</legend>
                    <div class="pure-u-1-2">
                        
                        <label>Number :</label><input type="number" name="{participants_number}" ng-model="int.participants_number"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Group :</label><input type="text" name="{participants_group}" ng-model="int.participants_group" />                 
                    </div>
                </div>
                
                
                <!-- Methodology -->
                <div class="pure-g-r">
                    <legend>Methodology</legend>
                    <div class="pure-u-1-2">
                        <label>Procedure* :</label><textarea type="text" class="datepicker" name="{procedure}" ng-model="int.procedure" />                 
                    </div>
                    <div class="pure-u-1-2">
                        
                        <label>Place:</label><input type="text" name="{place}" ng-model="int.place"/>
                    
                        <label>Recording:</label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{recordingNotes}" ng-model="int.recordingNotes" value="written_notes" /> Written notes 
                        </label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{recordingAudio}" ng-model="int.recordingAudio" value="audio"/> Audio
                        </label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{recordingVideo}" ng-model="int.recordingVideo" value="video"/> Video
                        </label>
                    </div>
                    
                    <div class="pure-u-1-2">
                        <label>Questions :</label><input type="file" name="{questions}" ng-model="int.questions" />                 
                    </div>
                
                   
                </div>
                
                <!-- Results --> 
                <div class="pure-g-r">
                    <legend>Results</legend>
                    <div class="pure-u-1-2">
                        <label>Data collected:</label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{data_collectedQual}" ng-model="int.data_collectedQual" /> Qualitative 
                        </label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{data_collectedQuan}" ng-model="int.data_collectedQuan" /> Quantitative
                        </label>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Findings :</label><textarea type="text" name="{findings}" ng-model="int.findings" />
                    </div>
                    <div class="pure-u-1-2">
                        <label>Recorded file :</label><input type="file" name="{recorded_file}" ng-model="int.recorded_file"/>                 
                    </div>
                    
                    <!-- Recommendations --> 
                    <div class="pure-g-r">
                        <legend>Recommendations</legend>
                        
                        <div class="pure-u-1-2">
                            <label>High :</label><textarea type="text" name="{recommendations_high}" ng-model="int.recommendations_high"/>
                        </div>
                        <div class="pure-u-1-2">
                            <label>Medium :</label><textarea type="text" name="{recommendations_medium}" ng-model="int.recommendations_medium"/>                 
                        </div>
                        <div class="pure-u-1-2">
                            <label>Low :</label><textarea type="text" name="{recommendations_low}" ng-model="int.recommendations_low"/>                 
                        </div>
                        
                    </div>
                    
                </div>
                
                
                
                
                <!-- Others -->
                <div class="pure-g-r">
                    <legend>Others</legend>
                    
                    <div class="pure-u-1-2">
                        <label>Notes :</label><textarea type="text" name="{notes}" id="notes" ng-model="int.notes"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Links :</label><input id="links" type="text" name="{links}" ng-model="int.links"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Attachments:</label><input type="file" name="{attachments}" ng-model="int.attachments"/>
                    </div>
                </div>

            </fieldset>
                
                <div class="actionMethod">
                
                <a class="pure-button pure-button-primary" ng-click="NewOrUpdateInterview()" href="#saved_method">Save</a> <!--pure-button-disabled ng-disabled="!canAdd()" listPersona=true"-->
                <a class="pure-button" ng-click="NewInterview()">Reset</a>
                <!-- <button ng-click="DeletePersona()" ng-disabled="!canDelete()">Delete</button><br/>-->

            </div>   


        </form>
        
    </xsl:template>
    
    
    
    
    
    <!--TEMPLATE FOR SURVEY -->  
    
    <xsl:template name="survey" match="methods/survey">
        
        <div class="accordion">
            <h3>What's Survey?</h3>
            <div style="overflow: auto; height: 15em;">
                <xsl:for-each select="//method">
                    <xsl:if test="method_name = 'Survey'">
                        
                        <h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
                        <br/>
                        <strong>Description</strong>
                        <p> 
                            <xsl:value-of select="./tutorial/description"/>
                        </p>
                        
                        <strong>Benefits</strong>
                        <p> 
                            <ul>
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
                            <ul>
                                <xsl:for-each select="./tutorial/examples/example">
                                    <li>
                                        <xsl:value-of select="child::text()"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            
                        </p>
                        
                    </xsl:if>
                </xsl:for-each>
            </div>
        </div>
        
        
        <form name="surForm" class="pure-form pure-form-stacked"> 
            <fieldset id="fieldset"> 
                
                <legend class="legend"><i class="fa fa-pencil-square-o fa-2x"></i> <strong> {{titleText}}</strong></legend> 
                
                <label for="file_name">File name* :</label><input type="text" name="{file_name}" ng-model="sur.file_name" ng-required="true"/>

                <div class="pure-g-r">
                    
                    
                    
                    <div class="pure-u-1-2">
                        
                        <label>Start :</label><input type="text" class="datepicker" name="{start_date_execution}" ng-model="sur.start_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>End :</label><input type="text" class="datepicker" name="{end_date_execution}" ng-model="sur.end_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>                 
                    </div>
                    <div class="pure-u-1-2">
                        <label>Objective:</label><textarea type="text" name="{objective}" ng-model="sur.objective"/>
                    </div>
                </div>
                
                
                
                <!-- Participants -->
                <div class="pure-g-r">
                    <legend>Participants</legend>
                    <div class="pure-u-1-2">
                        
                        <label>Number :</label><input type="number" name="{participants_number}" ng-model="sur.participants_number"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Group :</label><input type="text" name="{participants_group}" ng-model="sur.participants_group" />                 
                    </div>
                </div>
                
                
                <!-- Methodology -->
                <div class="pure-g-r">
                    <legend>Methodology</legend>
                    <div class="pure-u-1-2">
                        
                        <label>Place :</label><input type="text" name="{place}" ng-model="sur.place"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Procedure :</label><textarea type="text"  name="{procedure}" ng-model="sur.procedure" />                 
                    </div>
                   <div class="pure-u-1-2">
                       <label>Recording:</label>
                       <label class="pure-checkbox">
                           <input type="checkbox" name="{recordingNotes}" ng-model="sur.recordingNotes" value="written_notes" /> Written notes 
                       </label>
                       <label class="pure-checkbox">
                           <input type="checkbox" name="{recordingAudio}" ng-model="sur.recordingAudio" value="audio"/> Audio
                       </label>
                       <label class="pure-checkbox">
                           <input type="checkbox" name="{recordingVideo}" ng-model="sur.recordingVideo" value="video"/> Video
                       </label>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Questions :</label><input type="file" name="{questions}" ng-model="sur.questions" />                 
                    </div>
                </div>
                
                <!-- Results --> 
                <div class="pure-g-r">
                    <legend>Results</legend>
                    <div class="pure-u-1-2">
                        <label>Data collected:</label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{data_collectedQual}" ng-model="sur.data_collectedQual" /> Qualitative 
                        </label>
                        <label class="pure-checkbox">
                            <input type="checkbox" name="{data_collectedQuan}" ng-model="sur.data_collectedQuan" /> Quantitative
                        </label>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Findings :</label><textarea type="text" name="{findings}" ng-model="sur.findings" />
                    </div>
                    <div class="pure-u-1-2">
                        <label>Recorded file :</label><input type="file" name="{recording_file}" ng-model="sur.recording_file"/>                 
                    </div>
                    
                    <!-- Recommendations --> 
                    <div class="pure-g-r">
                        <legend>Recommendations</legend>
                        
                        <div class="pure-u-1-2">
                            <label>High :</label><textarea type="text" name="{recommendations_high}" ng-model="sur.recommendations_high" />
                        </div>
                        <div class="pure-u-1-2">
                            <label>Medium :</label><textarea type="text" name="{recommendations_medium}" ng-model="sur.recommendations_medium" />                 
                        </div>
                        <div class="pure-u-1-2">
                            <label>Low :</label><textarea type="text" name="{recommendations_low}" ng-model="sur.recommendations_low"/>                 
                        </div>
                        
                    </div>
                    
                </div>
                
                
                
                
                <!-- Others -->
                <div class="pure-g-r">
                    <legend>Others</legend>
                    
                    <div class="pure-u-1-2">
                        <label>Notes :</label><textarea type="text" name="{notes}" id="notes" ng-model="sur.notes"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Links :</label><input id="links" type="text" name="{links}" ng-model="sur.links"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Attachments:</label><input type="file" name="{attachments}" ng-model="sur.attachments"/>
                    </div>
                </div>
            </fieldset>

             <div class="actionMethod">
                
                <a class="pure-button pure-button-primary" ng-click="NewOrUpdateSurvey()" href="#saved_method">Save</a> 
                <a class="pure-button" ng-click="NewSurvey()">Reset</a>

            </div>   
        </form>
        
    </xsl:template>





     <!--TEMPLATE FOR STORYBOARD --> 
    <xsl:template name="storyboard" match="methods/storyboard">
        <div class="accordion">
            <h3>What's Storyboard?</h3>
            <div style="overflow: auto; height: 15em;">
                <xsl:for-each select="//method">
                    <xsl:if test="method_name = 'Storyboard'">
                        
                        <h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
                        <br/>
                        <strong>Description</strong>
                        <p> 
                            <xsl:value-of select="./tutorial/description"/>
                        </p>
                        
                        <strong>Benefits</strong>
                        <p> 
                            <ul>
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
                            <ul>
                                <xsl:for-each select="./tutorial/examples/example">
                                    <li>
                                        <xsl:value-of select="child::text()"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            
                        </p>
                        
                    </xsl:if>
                </xsl:for-each>
            </div>
        </div>
        
        
        
        <form name="stoForm" class="pure-form pure-form-stacked"> 
            <fieldset id="fieldset"> 
                
                <legend class="legend"><i class="fa fa-th fa-2x"></i>   <strong> {{titleText}}</strong></legend> 
                
                <label for="file_name">File name* :</label><input type="text" name="
                {file_name}" ng-model="sto.file_name" ng-required="true"/>
                
                
                
                <!--Dates of execution-->
                <div class="pure-g-r">
                    <legend>Dates of execution</legend>
                    <div class="pure-u-1-2">
                        
                        <label>Start :</label><input type="text" class="datepicker" name="{start_date_execution}" ng-model="sto.start_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>End :</label><input type="text" class="datepicker" name="{end_date_execution}" ng-model="sto.end_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy" />                 
                    </div>
                </div>
                
                
                <!--Storyboards-->
                
                <br/><br/>
                <div class="pure-g-r">
                    <legend>Storyboard(s)</legend>
                    <div class="pure-u-1-2">
                        <label>Storyboard name :</label><input type="text" name="{mainStoryboard_name}" ng-model="sto.mainStoryboard_name"/>
                        <label>Storyboard link:</label><input id="links" type="text" name="{mainStoryboard_link}" ng-model="sto.mainStoryboard_link"/>
                        <label>Storyboard attachment:</label><input type="file" name="{mainStoryboard_attachment}" ng-model="sto.mainStoryboard_attachment"/>
                    </div>
                        
                    <div class="pure-u-1-2">
                        <label>Storyboard name :</label><input type="text" name="{mainSketch_name}" ng-model="sto.storyboard_name"/>
                        <label>Storyboard link:</label><input id="links" type="text" name="{sketch_link}" ng-model="sto.storyboard_link"/>
                        <label>Storyboard attachment:</label><input type="file" name="{storyboard_attachment}" ng-model="sto.storyboard_attachment"/>

                    </div>
                </div>
                
                <br/><br/>
                
                
                <!-- Others -->
                <div class="pure-g-r">
                    <legend>Others</legend>
                    
                    <div class="pure-u-1-2">
                        <label>Notes :</label><textarea type="text" name="{notes}" id="notes" ng-model="sto.notes"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Links :</label><input id="links" type="text" name="{links}" ng-model="sto.links"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Attachments:</label><input type="file" name="{attachments}" ng-model="sto.attachments"/>
                    </div>
               </div>
            </fieldset>
            <div class="actionMethod">
                
                <a class="pure-button pure-button-primary" ng-click="NewOrUpdateStoryboard()" href="#saved_method">Save</a> 
                <a class="pure-button" ng-click="NewStoryboard()">Reset</a>

            </div>   
        </form>
        
        
    </xsl:template>






    <!--TEMPLATE FOR MEDIUM/HIGH-FIDELITY PROTOTYPING --> 
    <xsl:template name="mhfidelity" match="methods/mhfidelity">
        
        <div class="accordion">
            <h3>What's Medium-/High-Fidelity prototyping?</h3>
            <div style="overflow: auto; height: 15em;">
                <xsl:for-each select="//method">
                    <xsl:if test="method_name = 'Medium-/High-Fidelity prototyping'">
                        
                        <h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
                        <br/>
                        <strong>Description</strong>
                        <p> 
                            <xsl:value-of select="./tutorial/description"/>
                        </p>
                        
                        <strong>Benefits</strong>
                        <p> 
                            <ul>
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
                            <ul>
                                <xsl:for-each select="./tutorial/examples/example">
                                    <li>
                                        <xsl:value-of select="child::text()"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            
                        </p>
                        
                    </xsl:if>
                </xsl:for-each>
            </div>
        </div>
        
        
        <form name="mhfForm" class="pure-form pure-form-stacked"> 
            <fieldset id="fieldset"> 
                
                <legend class="legend"><i class="fa fa-hand-o-up fa-2x"></i>   <strong> {{titleText}}</strong></legend> 
                
                <label for="file_name">File name* :</label><input type="text" name="
                {file_name}" ng-model="mhf.file_name" ng-required="true"/>
                
                
                
                <!--Dates of execution-->
                <div class="pure-g-r">
                    <legend>Dates of execution</legend>
                    <div class="pure-u-1-2">
                        
                        <label>Start :</label><input type="text" class="datepicker" name="{start_date_execution}" ng-model="mhf.start_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>End :</label><input type="text" class="datepicker" name="{end_date_execution}" ng-model="mhf.end_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy" />                 
                    </div>
                </div>
                
                
                <!--PROTOTYPES-->
               

                <br/><br/>
                <div class="pure-g-r">
                    <legend>Prototype(s)</legend>
                    <div class="pure-u-1-2">
                        <label>Prototype name :</label><input type="text" name="{mainPrototype_name}" ng-model="mhf.mainPrototype_name"/>
                        <label>Prototype link:</label><input id="links" type="text" name="{mainPrototype_link}" ng-model="mhf.mainPrototype_link"/>
                        <label>Prototype attachment:</label><input type="file" name="{mainPrototype_attachment}" ng-model="mhf.mainPrototype_attachment"/>
                        <br/><br/>
                        <label>Fidelity level:</label>
                            <label class="pure-radio">
                                <input id="fidelity_level" name="{mainFidelity_level}" type="radio" ng-model="mhf.mainFidelity_level" value="medium"/> Medium
                            </label>
                            <label class="pure-radio">
                                <input id="fidelity_level" name="{mainFidelity_level}" type="radio" ng-model="mhf.mainFidelity_level" value="high"/> High
                            </label>
                    </div>
                        
                    <div class="pure-u-1-2">
                        <label>Prototype name :</label><input type="text" name="{prototype_name}" ng-model="mhf.prototype_name"/>
                        <label>Prototype link:</label><input id="links" type="text" name="{prototype_link}" ng-model="mhf.prototype_link"/>
                        <label>Prototype attachment:</label><input type="file" name="{prototype_attachment}" ng-model="mhf.prototype_attachment"/>
                        <br/><br/>
                        <label>Fidelity level:</label>
                            <label class="pure-radio">
                                <input id="fidelity_level" name="{fidelity_level}" type="radio" ng-model="mhf.fidelity_level" value="medium"/> Medium
                            </label>
                            <label class="pure-radio">
                                <input id="fidelity_level" name="{fidelity_level}" type="radio" ng-model="mhf.fidelity_level" value="high"/> High
                            </label>
                    </div>
                </div>
                
                <br/><br/>
                
                
                
                <!-- Others -->
                <div class="pure-g-r">
                    <legend>Others</legend>
                    
                    <div class="pure-u-1-2">
                        <label>Notes :</label><textarea type="text" name="{notes}" id="notes" ng-model="mhf.notes"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Links :</label><input id="links" type="text" name="{links}" ng-model="mhf.links"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Attachments:</label><input type="file" name="{attachments}" ng-model="mhf.attachments"/>
                    </div>
                </div>
            </fieldset>
            <div class="actionMethod">
                
                <a class="pure-button pure-button-primary" ng-click="NewOrUpdateMHFidelity()" href="#saved_method">Save</a> 
                <a class="pure-button" ng-click="NewMHFidelity()">Reset</a>

            </div>   
        </form>
        
        
    </xsl:template>






     <!--TEMPLATE FOR ACCESSIBILITY TESTING -->  
    
    
    <xsl:template name="accessibility" match="methods/accessibility">
        
        
        <div class="accordion">
            <h3>What's Accessibility?</h3>
            <div style="overflow: auto; height: 15em;">
                <xsl:for-each select="//method">
                    <xsl:if test="method_name = 'Accessibility'">
                        
                        <h3 ><i class="{icon}"></i> <xsl:value-of select="./method_name"/></h3>
                        <br/>
                        <strong>Description</strong>
                        <p> 
                            <xsl:value-of select="./tutorial/description"/>
                        </p>
                        
                        <strong>Benefits</strong>
                        <p> 
                            <ul>
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
                            <ul>
                                <xsl:for-each select="./tutorial/examples/example">
                                    <li>
                                        <xsl:value-of select="child::text()"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            
                        </p>
                        
                    </xsl:if>
                </xsl:for-each>
            </div>
        </div>
        
        <form name="accForm" class="pure-form pure-form-stacked"> 
            <fieldset id="fieldset"> 
                
                
                <legend class="legend"><i class="fa fa-wheelchair fa-2x"></i> <strong> {{titleText}}</strong></legend>

                <label for="file_name">File name* :</label><input type="text" name="{file_name}" ng-model="acc.file_name" ng-required="true"/>

                       
                    
                    
                    <div class="pure-g-r">
                       
                            <div class="pure-u-1-2">
                                <label>Start :</label><input type="text" class="datepicker" name="{start_date_execution}" ng-model="acc.start_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>
                            </div>
                            <div class="pure-u-1-2">
                                <label>End :</label><input type="text" class="datepicker" name="{end_date_execution}" ng-model="acc.end_date_execution" ui-date="dateOptions" ui-date-format="dd.mm.yy"/>                 
                            </div>
                            <div class="pure-u-1-2">
                                <label>Objective:</label><textarea type="text" name="{objective}" ng-model="acc.objective" />
                            </div>
                    </div>
        
                 
     

                <!-- Condition -->
                <br/><br/>
                <div class="pure-g-r">
                    <legend><strong>Prototype(s)</strong></legend><br/><br/>

                    <div class="pure-u-1-2">
                        <label>Prototype name :</label><input type="text" name="{mainPrototype_name}" ng-model="acc.mainPrototype_name"/>
                        <label>Prototype link:</label><input id="links" type="text" name="{mainPrototype_link}" ng-model="acc.mainPrototype_link"/>
                        <label>Prototype attachment:</label><input type="file" name="{mainPrototype_attachment}" ng-model="acc.mainPrototype_attachment"/>
                        <br/><br/>
                        
                    </div>
                        
                    <div class="pure-u-1-2">
                        <label>Prototype name :</label><input type="text" name="{prototype_name}" ng-model="acc.prototype_name"/>
                        <label>Prototype link:</label><input id="links" type="text" name="{prototype_link}" ng-model="acc.prototype_link"/>
                        <label>Prototype attachment:</label><input type="file" name="{prototype_attachment}" ng-model="acc.prototype_attachment"/>
                        <br/><br/>
                    </div>
                
                    <br/><br/>

                </div>

                 <div class="pure-g-r">
                    <legend><strong>Web Content Accessibility Guidelines (WCAG) 2.0</strong></legend>
                   
                        <h3>Perceivable :</h3>
                        <input type="checkbox" name="{checkerP1}" ng-model="acc.checkerP1"/> <i> Provide text alternatives for non-text content.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsP1}" ng-model="acc.commentsP1"/><br/>

                        <input type="checkbox" name="{checkerP2}" ng-model="acc.checkerP2"/> <i> Provide captions and other alternatives for multimedia.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsP2}" ng-model="acc.commentsP2"/><br/>

                        <input type="checkbox" name="{checkerP3}" ng-model="acc.checkerP3"/> <i> Create content that can be presented in different ways, including by assistive technologies, without losing meaning.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsP3}" ng-model="acc.commentsP3"/><br/>

                        <input type="checkbox" name="{checkerP4}" ng-model="acc.checkerP4"/> <i> Make it easier for users to see and hear content.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsP4}" ng-model="acc.commentsP4"/><br/>
                   
                         <h3>Operable :</h3>
                        <input type="checkbox" name="{checkerO1}" ng-model="acc.checkerO1"/> <i> Make all functionality available from a keyboard.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsO1}" ng-model="acc.commentsO1"/><br/>

                        <input type="checkbox" name="{checkerO2}" ng-model="acc.checkerO2"/> <i> Give users enough time to read and use content.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsO2}" ng-model="acc.commentsO2"/><br/>

                        <input type="checkbox" name="{checkerO3}" ng-model="acc.checkerO3"/> <i> Do not use content that causes seizures.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsO3}" ng-model="acc.commentsO3"/><br/>

                        <input type="checkbox" name="{checkerO4}" ng-model="acc.checkerO4"/> <i> Help users navigate and find content.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsO4}" ng-model="acc.commentsO4"/><br/>

                        <h3>Understandable :</h3>
                        <input type="checkbox" name="{checkerU1}" ng-model="acc.checkerU1"/> <i> Make text readable and understandable.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsU1}" ng-model="acc.commentsU1"/><br/>

                        <input type="checkbox" name="{checkerU2}" ng-model="acc.checkerU2"/> <i> Make content appear and operate in predictable ways.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsU2}" ng-model="acc.commentsU2"/><br/>

                        <input type="checkbox" name="{checkerU3}" ng-model="acc.checkerU3"/> <i> Help users avoid and correct mistakes.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsU3}" ng-model="acc.commentsU3"/><br/>

                        <h3>Robust :</h3>
                        <input type="checkbox" name="{checkerR1}" ng-model="acc.checkerR1"/> <i> Maximize compatibility with current and future user tools.</i><br/>
                        <br/><label for="comments">Comments :</label><textarea id="notes" type="text" name="{commentsR1}" ng-model="acc.commentsR1"/><br/>

                        
                        
                
                    <br/><br/>

                </div>
                

                <!-- Recommendations --> 
                <div class="pure-g-r">
                    <legend>Recommendations</legend>
                    
                    <div class="pure-u-1-2">
                        <label>High :</label><textarea type="text" name="{recommendations_high}" ng-model="acc.recommendations_high"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Medium :</label><textarea type="text" name="{recommendations_medium}" ng-model="acc.recommendations_medium" />                 
                    </div>
                    <div class="pure-u-1-2">
                        <label>Low :</label><textarea type="text" name="{recommendations_low}" ng-model="acc.recommendations_low" />                 
                    </div>
                    
                </div>
        
        
        
                <!-- Others -->
                <div class="pure-g-r">
                    <legend>Others</legend>
                    
                    <div class="pure-u-1-2">
                        <label>Notes :</label><textarea type="text" name="{notes}" id="notes" ng-model="acc.notes"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Links :</label><input id="links" type="text" name="{links}" ng-model="acc.links"/>
                    </div>
                    <div class="pure-u-1-2">
                        <label>Attachments:</label><input type="file" name="{attachments}" ng-model="acc.attachments"/>
                    </div>
                </div>
            </fieldset>

            <div class="actionMethod">
                
                <a class="pure-button pure-button-primary" ng-click="NewOrUpdateAcc()" href="#saved_method">Save</a> 
                <a class="pure-button" ng-click="NewAcc()">Reset</a>
                
            </div>   
            
        </form>
    </xsl:template>
    
   
   
    
    
   
    
    
</xsl:stylesheet>   


      