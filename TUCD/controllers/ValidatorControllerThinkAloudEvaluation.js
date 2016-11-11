// Create a module for our core AMail services
var aValServices = angular.module('AValidator', []);

var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";


function DetailControllerThinkAloudEv($scope, $http, $timeout, methodObject, modeType) {
    $scope.thinkAloudEvaluations = null;
    $scope.thinkAloudEvalObject = methodObject.sharedObject;
    $scope.thinkAloudEval = null;
    $scope.selectedThinkAloudEv = null;
    $scope.mode = 'default';
    $scope.titleText = 'New Usability Evaluation';
    $scope.project_id = getUrlVar("projectID");
    $scope.taepos = -1;
    $scope.mode = modeType.sharedObject;
    $scope.dateOptions = {
        dateFormat: "dd.mm.yy"
    };


    $scope.$watch('thinkAloudEvalObject.data', function(newValue){
        $scope.thinkAloudEval = newValue;

    });

    $scope.NewThinkAloudEval = function () {
            $scope.thinkAloudEvalObject.data = null;
            $scope.thinkAloudEval = null;
            $scope.taepos = -1;
            $scope.thinkAloudEvaluationForm.$setPristine();
            $scope.mode.data = 'default';
            $scope.titleText = 'New Usability Evaluation';
        };

    // $scope.AddThinkAloudEv = function () {
    //     if ($scope.thinkAloudEval.id != null && $scope.taepos != -1) {
    //         $scope.thinkAloudEvaluations.splice($scope.taepos, 1, $scope.thinkAloudEval);
    //     }
    //     else {
    //         $scope.thinkAloudEval.id = Math.uuid();
    //         $scope.thinkAloudEvaluations.push($scope.thinkAloudEval);
    //     }
    //     $scope.thinkAloudEval = null;
    //     $scope.taepos = -1;
    //     $scope.taeForm.$setPristine();
    // };
    // $scope.SelectThinkAloudEv = function (thinkAloudEval) {
    //     if (thinkAloudEval != null) {
            // $scope.thinkAloudEval = {
            //     id: thinkAloudEval.id, 
            //     start_date_execution:thinkAloudEval.start_date_execution ,
            //     end_date_execution: thinkAloudEval.end_date_execution,
            //     objective:thinkAloudEval.objective,
            //     users_evaluation_number:thinkAloudEval.users_evaluation_number,
            //     users_evaluation_group: thinkAloudEval.users_evaluation_group,
            //     users_expected_skills_knowledge: thinkAloudEval.users_expected_skills_knowledge,
            //     place: thinkAloudEval.place,
            //     procedure: thinkAloudEval.procedure, 
            //     user_task: thinkAloudEval.user_task, 
            //     material:thinkAloudEval.material,
            //     recording: thinkAloudEval.recording,
            //     training: thinkAloudEval.training,
            //     prototype_name: thinkAloudEval.prototype_name,
            //     prototype_attachments: thinkAloudEval.prototype_attachments,
            //     findings: thinkAloudEval.findings,
            //     recording_file: thinkAloudEval.recording_file,
            //     recommendations_high: thinkAloudEval.recommendations_high,
            //     recommendations_medium: thinkAloudEval.recommendations_medium,
            //     recommendations_low: thinkAloudEval.recommendations_low,
            //     links: thinkAloudEval.links,
            //     notes: thinkAloudEval.notes,
            //     attachments: thinkAloudEval.attachments
            // };
            // $scope.taepos = $scope.thinkAloudEvaluations.indexOf(thinkAloudEval);
    //     }
    //     else {
    //         $scope.thinkAloudEval = null;
    //         $scope.taepos = -1;
    //     }
    //     $scope.taeForm.$setPristine();
    // };

    $scope.DeleteThinkAloudEv = function () {
        if ($scope.thinkAloudEval.id != null && $scope.taepos != -1) {
             $scope.deleteDialog();  
        }
        $scope.thinkAloudEval = null;
        $scope.taepos = -1;
        $scope.thinkAloudEvaluationForm.$setPristine();
    };

    $scope.NewOrUpdateThinkAloudEv = function () {

            if ($scope.mode.data == 'update'){
                //$scope.thinkAloudEval = JSON.parse(JSON.stringify(thinkAloudEval));
                $scope.titleText = 'Edit Usability Evaluation';
                $scope.updateThinkAloudEv($scope.thinkAloudEval);
            }

            else{

                $scope.thinkAloudEval.icon = " fa-laptop ";
                $scope.thinkAloudEval.UCD_method = "tae";
                $scope.thinkAloudEval.project_id = $scope.project_id;
                $scope.saveThinkAloudEv($scope.thinkAloudEval);
            }  
        };
    
    $scope.canDelete = function () {
        return $scope.thinkAloudEvaluationForm.$valid && !$scope.thinkAloudEvaluationForm.$dirty && $scope.thinkAloudEval != null;
    }
    $scope.canAdd = function () {
        return $scope.thinkAloudEvaluationForm.$valid && $scope.thinkAloudEvaluationForm.$dirty && $scope.thinkAloudEval != null;
    }




//connection with Mongo DB

 $scope.saveThinkAloudEv = function(thinkAloudEval) {
        // add a persona
        var addThis = $http.post("https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods",
            thinkAloudEval,
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
    $scope.selectThinkAloudEv = function (thinkAloudEval) {
            if ($scope.selectThinkAloudEv === thinkAloudEval)
            { $scope.selectedThinkAloudEvThinkAloudEv= null;}
            else
            { $scope.selectedThinkAloudEvThinkAloudEv= thinkAloudEval; }
        }


    // update a persona
         $scope.updateThinkAloudEv = function(thinkAloudEval) {
            
            $scope.selectThinkAloudEv = thinkAloudEval;

            var updUrl = 'https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods';
                updUrl += '/' + thinkAloudEval._id.$oid;

            var updThis = $http.put(updUrl, JSON.stringify( { 
                                                                "icon" : " fa-laptop ",
                                                                "UCD_method" :  "tae",
                                                                "project_id" : thinkAloudEval.project_id,
                                                                "file_name" : thinkAloudEval.file_name,
                                                                "start_date_execution":thinkAloudEval.start_date_execution ,
                                                                "end_date_execution": thinkAloudEval.end_date_execution,
                                                                "objective":thinkAloudEval.objective,
                                                                "users_evaluation_number":thinkAloudEval.users_evaluation_number,
                                                                "users_evaluation_group": thinkAloudEval.users_evaluation_group,
                                                                "users_expected_skills_knowledge": thinkAloudEval.users_expected_skills_knowledge,
                                                                "place": thinkAloudEval.place,
                                                                "procedure": thinkAloudEval.procedure, 
                                                                "user_task": thinkAloudEval.user_task, 
                                                                "material":thinkAloudEval.material,
                                                                "recordingNotes" : thinkAloudEval.recordingNotes,
                                                                "recordingAudio" : thinkAloudEval.recordingAudio,
                                                                "recordingVideo" : thinkAloudEval.recordingVideo,
                                                                "data_collectedQual" : thinkAloudEval.data_collectedQual,
                                                                "data_collectedQuan" : thinkAloudEval.data_collectedQuan,
                                                                "training": thinkAloudEval.training,
                                                                "prototype_name": thinkAloudEval.prototype_name,
                                                                "prototype_attachments": thinkAloudEval.prototype_attachments,
                                                                "findings": thinkAloudEval.findings,
                                                                "recorded_file": thinkAloudEval.recorded_file,
                                                                "recommendations_high": thinkAloudEval.recommendations_high,
                                                                "recommendations_medium": thinkAloudEval.recommendations_medium,
                                                                "recommendations_low": thinkAloudEval.recommendations_low,
                                                                "links": thinkAloudEval.links,
                                                                "notes": thinkAloudEval.notes,
                                                                "attachments": thinkAloudEval.attachments
                                                               


                                                            } ), { params: { apiKey: apiKeyString }});
           
           updThis.success(function (data, status, headers, config) {
               
             //  $scope.getProjects(); get list methods
           });
           updThis.error(function (data, status, headers, config) {
               throw new Error("Something got wrong with update");
           });
       };





        // delete a persona
        $scope.deleteThinkAloudEv  = function() {
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods/' +
                $scope.thinkAloudEval._id.$oid,
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

