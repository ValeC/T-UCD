var aValServices = angular.module('AValidator', [])

                        //communication with the other controllers
                           .factory('showMethodForm', function(){
                           return{ sharedObject: {data: ''} }})

                           .factory('methodObject', function(){
                           return{ sharedObject: {data: null} }})

                           .factory('modeType', function(){
                           return{ sharedObject: {data: 'default'} }})

                           ;


var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";

function UCD_MethodsNavigationController($scope, $http, showMethodForm, methodObject, modeType) {

	$scope.project_id = getUrlVar("projectID");
	$scope.project = null;
	$scope.projectMethods = null;
	$scope.proj = null;
    $scope.projspos = -1;
    $scope.showMethod = showMethodForm.sharedObject;
    $scope.method = methodObject.sharedObject;
    $scope.mode = modeType.sharedObject;


     
      // get project
        $scope.getProject = function ()
        {
            var getList = $http.get('https://api.mongolab.com/api/1/databases/timeman/collections/Projects/' + 
                          $scope.project_id, 
                           {
                    			params : { apiKey : apiKeyString }
                			} 
            );
            getList.success(function(data, status, headers, config) {
                $scope.project = data;
                
            });
            getList.error(function(data, status, headers, config) {
               throw new Error("Something got wrong with get");
            });

        };
		
		$scope.getProject();

		$scope.getMethods = function ()
        {
            var getList = $http.get("https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods",
            	{ params : 
            	   { apiKey : apiKeyString,
            	     q : JSON.stringify({ "project_id" : $scope.project_id})
            	   }
            	}
            	

            );
            getList.success(function(data, status, headers, config) {
                $scope.projectMethods = data;
                
            }); 
            getList.error(function(data, status, headers, config) {
               throw new Error("Something got wrong with get");
            });
        };

		$scope.getMethods();


        $scope.SelectMethod = function(method){
            $scope.showMethod.data = method.UCD_method;
            $scope.method.data = method;
            $scope.mode.data = 'update';
            //$scope.textTitle = $scope.method.textTitleEdit;

        }


 // delete a persona
        $scope.deleteMethod = function() {
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods/' +
                $scope.method._id.$oid,
                {
                    params : { apiKey : apiKeyString }
                }   
            );
            delThis.success(function(data, status, headers, config) {
                $scope.getMethods(); //get list methods
                return true;
            });
            delThis.error(function(data, status, headers, config) {
                throw new Error("Something got wrong with delete");
                return false;
            });
        };





        $scope.deleteDialog = function(method) {
                    $scope.method = method;
                    $( "#dialog-confirm" ).dialog({
                        resizable: false,
                        height: 160,
                        modal: true,
                        buttons: {
                            Delete: function() {
                                $scope.$apply(function(){
                                    $scope.deleteMethod();
                                    $scope.getMethods();
                                        $scope.method = null;
                                        
                                        $(".ui-dialog-content").dialog("close");
                                        
                                        $( "#dialog-ok-delete" ).dialog({
                                            resizable: false,
                                            height: 160,
                                            modal: true,
                                            buttons: {
                                                
                                                OK: function() {
                                                    $( this ).dialog( "close" );

                                                }
                                            }
                                        });
                                });
                            },
                            
                            Cancel: function() {
                                $( this ).dialog( "close" );
                             
                            }
                    }
                });
              };





//get the projectId from url
        function getUrlVar(key){
      			var result = new RegExp(key + "=([^&]*)", "i").exec(window.location.search);
      			return result && unescape(result[1]) || "";
      		};

            

	}