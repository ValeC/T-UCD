// Create a module for our core AMail services
var aValServices = angular.module('AValidator', []);

var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";


function DetailControllerScenario($scope, $http, $timeout, methodObject, modeType) {
    $scope.scenarios = null;
    $scope.scenObject = methodObject.sharedObject;
    $scope.scen = null;
    $scope.selectedScenario = null;
    $scope.scenpos = -1;
    $scope.mode = modeType.sharedObject;
    $scope.mode = 'default';
    $scope.titleText = 'New Scenario';
    $scope.project_id = getUrlVar("projectID");
    $scope.dateOptions = {
        dateFormat: "dd.mm.yy"
    };


    $scope.$watch('scenObject.data', function(newValue){
        $scope.scen = newValue;

    });

    $scope.NewScenario = function () {
            $scope.scenObject.data = null;
            $scope.scen = null;
            $scope.scenpos = -1;
            $scope.scenForm.$setPristine();
            $scope.mode.data = 'default';
            $scope.titleText = 'New Scenario';
    };


    // $scope.AddScenario = function () {
    //     if ($scope.scen.id != null && $scope.scenpos != -1) {
    //         $scope.scenarios.splice($scope.scenpos, 1, $scope.scen);
    //     }
    //     else {
    //         $scope.scen.id = Math.uuid();
    //         $scope.scenarios.push($scope.scen);
    //     }
    //     $scope.scen = null;
    //     $scope.scenpos = -1;
    //     $scope.scenForm.$setPristine();
    // };
    // $scope.SelectScenario = function (scen) {
    //     if (scen != null) {
    //         $scope.scen = {
    //             id: scen.id, 
    //             creator_name: scen.creator_name,
    //             scenario_description: scen.scenario_description,
    //             links: scen.links,
    //             notes : scen.notes,
    //             attachments : scen.attachments  
    //         };
            
    //         $scope.scenpos = $scope.scenarios.indexOf(scen);
    //     }
    //     else {
    //         $scope.scen = null;
    //         $scope.scenpos = -1;
    //     }
    //     $scope.scenForm.$setPristine();
    // };
    $scope.DeleteScenario = function () {
        if ($scope.scen.id != null && $scope.scenpos != -1) {
                $scope.deleteDialog();          
        }
        $scope.scen = null;
        $scope.scenpos = -1;
        $scope.scenForm.$setPristine();
    };
   

    $scope.NewOrUpdateScenario = function () {

            if ($scope.mode.data == 'update'){
                //$scope.scen = JSON.parse(JSON.stringify(scen));
                $scope.titleText = 'New Scenario';
                $scope.updateScenario($scope.scen);
            }

            else{

                $scope.scen.icon = " fa-file-text-o ";
                $scope.scen.UCD_method = "sce";
                $scope.scen.project_id = $scope.project_id;
                $scope.saveScenario($scope.scen);
            }  
        };


    $scope.canDelete = function () {
        return $scope.scenForm.$valid && !$scope.scenForm.$dirty && $scope.scen != null;
    }
    $scope.canAdd = function () {
        return $scope.scenForm.$valid && $scope.scenForm.$dirty && $scope.scen != null;
    }
    
     $scope.open = function() {
     $timeout(function() {
       $scope.opened = true;
     });
   };
    
//connection with Mongo DB


    $scope.saveScenario = function(scen) {
        // add a scenario
        var addThis = $http.post("https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods",
            scen,
            { params : { apiKey : apiKeyString }}
        );
        addThis.success(function(data, status, headers, config) {
            
            $scope.getMethods();
            

        });
        addThis.error(function(data, status, headers, config) {
            throw new Error("Something got wrong with save");
        });
    };

     //select a scenario
    $scope.selectScenario = function (scen) {
            if ($scope.selectScenario === scen)
            { $scope.selectedScenario = null;}
            else
            { $scope.selectedScenario = scen; }
        }
        // update a scenario
         $scope.updateScenario = function(scen) {
            
            $scope.selectScenario = scen;

            var updUrl = 'https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods';
                updUrl += '/' + scen._id.$oid;

            var updThis = $http.put(updUrl, JSON.stringify( { 
                                                                "icon" : " fa-file-text-o ",
                                                                "UCD_method" :  "scen",
                                                                "project_id" : scen.project_id,
                                                                "file_name" : scen.file_name,
                                                                "scenario_description" : scen.scenario_description,
                                                                "notes" : scen.notes, 
                                                                "links" : scen.links,
                                                                "attachments" : scen.attachments

                                                            } ), { params: { apiKey: apiKeyString }});
           
           updThis.success(function (data, status, headers, config) {
               
           });
           updThis.error(function (data, status, headers, config) {
               throw new Error("Something got wrong with update");
           });
       };


        // delete a scenario
        $scope.deleteScenario = function() {
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods/' +
                $scope.scen._id.$oid,
                {
                    params : { apiKey : apiKeyString }
                }   
            );
            delThis.success(function(data, status, headers, config) {
               // $scope.getProjsects(); get list methods
                //return true;
            });
            delThis.error(function(data, status, headers, config) {
                throw new Error("Something got wrong with delete");
                return false;
            });
        };


function getUrlVar(key){
            var result = new RegExp(key + "=([^&]*)", "i").exec(window.location.search);
            return result && unescape(result[1]) || "";
        }


    
}

