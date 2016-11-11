// Create a module for our core AMail services
var aValServices = angular.module('AValidator', []);

var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";

function DetailControllerInterview($scope, $http, $timeout, methodObject, modeType) {
    $scope.interviews = null;
    $scope.intObject = methodObject.sharedObject;
    $scope.int = null;
    $scope.selectedInterview = null;
    $scope.intpos = -1;
    $scope.mode = modeType.sharedObject;
    $scope.mode = 'default';
    $scope.titleText = 'New Interview';
    $scope.project_id = getUrlVar("projectID");
    $scope.dateOptions = {
        dateFormat: "dd.mm.yy"
    };


    $scope.$watch('intObject.data', function(newValue){
        $scope.int = newValue;

    });

     $scope.NewInterview = function () {
            $scope.intObject.data = null;
            $scope.int = null;
            $scope.intpos = -1;
            $scope.intForm.$setPristine();
            $scope.mode.data = 'default';
            $scope.titleText = 'New Interview';
        };

    // $scope.AddInterview = function () {
    //     if ($scope.int.id != null && $scope.intpos != -1) {
    //         $scope.interviews.splice($scope.intpos, 1, $scope.int);
    //     }
    //     else {
    //         $scope.int.id = Math.uuid();
    //         $scope.interviews.push($scope.int);
    //     }
    //     $scope.int = null;
    //     $scope.intpos = -1;
    //     $scope.intForm.$setPristine();
    // };
    // $scope.SelectInterview = function (int) {
    //     if (int != null) {
    //         $scope.int = {
    //             id: int.id, 
    //             start_date_execution: int.start_date_execution,
    //             end_date_execution: int.end_date_execution,
    //             objective: int.objective, 
    //             participants_number: int.participants_number,
    //             participants_group: int.participants_group, 
    //             place: int.place, 
    //             procedure: int.procedure,
    //             recording: int.recording,
    //             questions:int.questions, 
    //             data_collected: int.data_collected, 
    //             findings: int.findings, 
    //             recording_file: int.recording_file,
    //             recommendations_high: int.recommendations_high,
    //             recommendations_medium: int.recommendations_medium,
    //             recommendations_low: int.recommendations_low,
    //             attachments: int.findings, 
    //             notes: int.notes,
    //             links: int.links
    //             };
    //         $scope.intpos = $scope.interviews.indexOf(int);
    //     }
    //     else {
    //         $scope.int = null;
    //         $scope.intpos = -1;
    //     }
    //     $scope.intForm.$setPristine();
    // };
    $scope.DeleteInterview = function () {
        if ($scope.int.id != null && $scope.intpos != -1) {
            $scope.deleteDialog();  

        }
        $scope.int = null;
        $scope.intpos = -1;
        $scope.intForm.$setPristine();
    };

    $scope.NewOrUpdateInterview = function () {

            if ($scope.mode.data == 'update'){
                //$scope.int = JSON.parse(JSON.stringify(int));
                $scope.titleText = 'New Interview';
                $scope.updateInterview($scope.int);
            }

            else{

                $scope.int.icon = " fa-microphone ";
                $scope.int.UCD_method = "int";
                $scope.int.project_id = $scope.project_id;
                $scope.saveInterview($scope.int);
            }  
        };
    
    $scope.canDelete = function () {
        return $scope.intForm.$valid && !$scope.intForm.$dirty && $scope.int != null;
    }
    $scope.canAdd = function () {
        return $scope.intForm.$valid && $scope.intForm.$dirty && $scope.int != null;
    }
    
     $scope.open = function() {
     $timeout(function() {
       $scope.opened = true;
     });
   };


//connection with Mongo DB

 $scope.saveInterview = function(int) {
        var addThis = $http.post("https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods",
            int,
            { params : { apiKey : apiKeyString }}
        );
        addThis.success(function(data, status, headers, config) {
            $scope.getMethods();
            

        });
        addThis.error(function(data, status, headers, config) {
            throw new Error("Something got wrong with save");
        });
    };

     //select a interview
    $scope.selectInterview = function (int) {
            if ($scope.selectInterview === int)
            { $scope.selectInterview = null;}
            else
            { $scope.selectInterview = int; }
        }
    
    // update a interview
         $scope.updateInterview = function(int) {
            
            $scope.selectInterview  = int;

            var updUrl = 'https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods';
                updUrl += '/' + int._id.$oid;

            var updThis = $http.put(updUrl, JSON.stringify( { 
                                                                "icon" : " fa-microphone ",
                                                                "UCD_method" :  "inte",
                                                                "project_id" : int.project_id,
                                                                "file_name" : int.file_name,
                                                                "start_date_execution" : int.start_date_execution,
                                                                "end_date_execution" : int.end_date_execution,
                                                                "objective" : int.objective,
                                                                "participants_number" : int.participants_number,
                                                                "participants_group" : int.participants_group,
                                                                "place" : int.place,
                                                                "procedure" : int.procedure,
                                                                "recordingNotes" : int.recordingNotes,
                                                                "recordingAudio" : int.recordingAudio,
                                                                "recordingVideo" : int.recordingVideo,
                                                                "questions" : int.questions,
                                                                "data_collectedQual" : int.data_collectedQual,
                                                                "data_collectedQuan" : int.data_collectedQuan,
                                                                "questions" : int.questions,
                                                                "findings" : int.findings,
                                                                "recorded_file" : int.recorded_file,
                                                                "recommendations_high" : int.recommendations_high,
                                                                "recommendations_medium" : int.recommendations_medium,
                                                                "recommendations_low" : int.recommendations_low,
                                                                "notes" : int.notes,
                                                                "links" : int.links,
                                                                "attachments" : int.attachments


                                                            } ), { params: { apiKey: apiKeyString }});
           
           updThis.success(function (data, status, headers, config) {
               
             //  $scope.getProjects(); get list methods
           });
           updThis.error(function (data, status, headers, config) {
               throw new Error("Something got wrong with update");
           });
       };

       // delete interview
        $scope.deleteInterview = function() {
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods/' +
                $scope.int._id.$oid,
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

