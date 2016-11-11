// Create a module for our core AMail services
var aValServices = angular.module('AValidator', []);

var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";


function DetailControllerPersona($scope, $http, $timeout, methodObject, modeType) {
    $scope.personas = null;
    $scope.persObject = methodObject.sharedObject;
    $scope.pers = null;
    $scope.selectedPersona = null;
    $scope.perspos = -1;
    $scope.mode = modeType.sharedObject;
    $scope.titleText = 'New Persona';
    $scope.project_id = getUrlVar("projectID");
    $scope.dateOptions = {
        dateFormat: "dd.mm.yy"
    };

    $scope.$watch('persObject.data', function(newValue){
        $scope.pers = newValue;

    });


    $scope.NewPersona = function () {
            $scope.persObject.data = null;
            $scope.pers = null;
            $scope.perspos = -1;
            $scope.persForm.$setPristine();
            $scope.mode.data = 'default';
            $scope.titleText = 'New Persona';
        };


    $scope.DeletePersona = function () {
        if ($scope.pers.id != null && $scope.perspos != -1) {
             $scope.deleteDialog();  
        }
        $scope.pers = null;
        $scope.perspos = -1;
        $scope.persForm.$setPristine();
    };


    $scope.NewOrUpdatePersona = function () {

            if ($scope.mode.data == 'update'){

                $scope.titleText = 'Edit Persona';
                $scope.updatePersona($scope.pers);
            }

            else{

                $scope.pers.icon = " fa-user ";
                $scope.pers.UCD_method = "pers";
                $scope.pers.project_id = $scope.project_id;
                $scope.savePersona($scope.pers);
            }  
        };

    
    $scope.canDelete = function () {
        return $scope.persForm.$valid && !$scope.persForm.$dirty && $scope.pers != null;
    }
    $scope.canAdd = function () {
        return $scope.persForm.$valid && $scope.persForm.$dirty && $scope.pers != null;
    }
    
     $scope.open = function() {
     $timeout(function() {
       $scope.opened = true;
     });
   };
    


//connection with Mongo DB

 $scope.savePersona = function(pers) {
        // add a persona
        var addThis = $http.post("https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods",
            pers,
            { params : { apiKey : apiKeyString }}
        );
        addThis.success(function(data, status, headers, config) {
            
            $scope.getMethods();
        
        });
        addThis.error(function(data, status, headers, config) {
            throw new Error("Something got wrong with save");
        });
    };

     //select a persona
    $scope.selectPersona = function (pers) {
            if ($scope.selectPersona === pers)
            { $scope.selectedPersona = null;}
            else
            { $scope.selectedPersona = pers; }
        }


    // update a persona
         $scope.updatePersona = function(pers) {
            

            $scope.selectPersona = pers;

            var updUrl = 'https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods';
                updUrl += '/' + pers._id.$oid;

            var updThis = $http.put(updUrl, JSON.stringify( {   
                                                                "icon" : " fa-user ",
                                                                "UCD_method" :  "pers",
                                                                "project_id" : pers.project_id,
                                                                "file_name" : pers.file_name,
                                                                "user_group" : pers.user_group, 
                                                                "photo" : pers.photo,
                                                                "fictional_name" : pers.fictional_name, 
                                                                "age" : pers.age,
                                                                "sex" : pers.sex,
                                                                "priority" : pers.priority,
                                                                "marital_status" : pers.marital_status,
                                                                "family_status" : pers.fictional_status,  
                                                                "education" : pers.education,
                                                                "personality" : pers.personality,
                                                                "hobbies" :pers.hobbies,
                                                                "personal_goal" : pers.personal_goal,
                                                                "job_title" : pers.job_title,
                                                                "work_experience" : pers.work_experience,
                                                                "current_work" : pers.current_work,
                                                                "tasks_responsabilities" : pers.tasks_responsabilities,
                                                                "professional_goals" : pers.professional_goals,
                                                                "health" : pers.health,
                                                                "technology" : pers.technology,
                                                                "user_need" : pers.user_need,
                                                                "notes" : pers.notes,
                                                                "attachments" :pers.attachments,
                                                                "links" : pers.links


                                                            } ), { params: { apiKey: apiKeyString }});
           
           updThis.success(function (data, status, headers, config) {
               
             $scope.getMethods(); //get list methods
           });
           updThis.error(function (data, status, headers, config) {
               throw new Error("Something got wrong with update");
           });
       };





        // delete a persona
        $scope.deletePersona = function() {
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods/' +
                $scope.pers._id.$oid,
                {
                    params : { apiKey : apiKeyString }
                }   
            );
            delThis.success(function(data, status, headers, config) {
            
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

