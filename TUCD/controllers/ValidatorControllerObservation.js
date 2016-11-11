// Create a module for our core AMail services
var aValServices = angular.module('AValidator', []);

var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";


function DetailControllerObservation($scope, $http, $timeout, methodObject, modeType) {
    $scope.observations = null;
    $scope.obsObject = methodObject.sharedObject;
    $scope.obs = null;
    $scope.selectedObservation = null;
    $scope.obspos = -1;
    $scope.mode = modeType.sharedObject;
    $scope.mode = 'default';
    $scope.titleText = 'New Observation';
    $scope.project_id = getUrlVar("projectID");
    $scope.dateOptions = {
        dateFormat: "dd.mm.yy"
    };


    $scope.$watch('obsObject.data', function(newValue){
        $scope.obs = newValue;

    });

    $scope.NewObservation = function () {
                $scope.obsObject.data = null;
                $scope.obs = null;
                $scope.obspos = -1;
                $scope.obsForm.$setPristine();
                $scope.mode.data = 'default';
                $scope.titleText = 'New Observation';
    };

    // $scope.AddObservation = function () {
    //     if ($scope.obs.id != null && $scope.obspos != -1) {
    //         $scope.observations.splice($scope.obspos, 1, $scope.obs);
    //     }
    //     else {
    //         $scope.obs.id = Math.uuid();
    //         $scope.observations.push($scope.obs);
    //     }
    //     $scope.obs = null;
    //     $scope.obspos = -1;
    //     $scope.obsForm.$setPristine();
    // };
    // $scope.SelectObservation = function (obs) {
    //     if (obs != null) {
    //         $scope.obs = {
    //             id: obs.id, 
    //             start_date_execution: obs.start_date_execution,
    //             end_date_execution: obs.end_date_execution,
    //             objective: obs.objective, 
    //             participants_number: obs.participants_number,
    //             participants_group: obs.participants_group, 
    //             place: obs.place, 
    //             procedure: obs.procedure,
    //             recording: obs.recording, 
    //             data_collected: obs.data_collected, 
    //             findings: obs.findings, 
    //             recording_file: obs.recording_file,
    //             recommendations_high: obs.recommendations_high,
    //             recommendations_medium: obs.recommendations_medium,
    //             recommendations_low: obs.recommendations_low,
    //             attachments: obs.findings, 
    //             notes: obs.notes,
    //             links: obs.links
    //             };
    //         $scope.obspos = $scope.observations.indexOf(obs);
    //     }
    //     else {
    //         $scope.obs = null;
    //         $scope.obspos = -1;
    //     }
    //     $scope.obsForm.$setPristine();
    //};
    $scope.DeleteObservation = function () {
        if ($scope.obs.id != null && $scope.obspos != -1) {
             $scope.deleteDialog(); 
        }
        $scope.obs = null;
        $scope.obspos = -1;
        $scope.obsForm.$setPristine();
    };


    $scope.NewOrUpdateObservation = function () {

            if ($scope.mode.data == 'update'){
                //$scope.obs = JSON.parse(JSON.stringify(obs));
                $scope.updateObservation($scope.obs);
                $scope.titleText = "Edit Observation";
            }

            else{

                $scope.obs.icon = " fa-eye ";
                $scope.obs.UCD_method = "obs";
                $scope.obs.project_id = $scope.project_id;
                $scope.saveObservation($scope.obs);
            }  
        };
    
    $scope.canDelete = function () {
        return $scope.obsForm.$valid && !$scope.obsForm.$dirty && $scope.obs != null;
    }
    $scope.canAdd = function () {
        return $scope.obsForm.$valid && $scope.obsForm.$dirty && $scope.obs != null;
    }
    
     $scope.open = function() {
     $timeout(function() {
       $scope.opened = true;
     });
   };



//connection with Mongo DB

 $scope.saveObservation = function(obs) {
        var addThis = $http.post("https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods",
            obs,
            { params : { apiKey : apiKeyString }}
        );
        addThis.success(function(data, status, headers, config) {
            $scope.getMethods();
            

        });
        addThis.error(function(data, status, headers, config) {
            throw new Error("Something got wrong with save");
        });
    };

     //select a observation
    $scope.selectObservation = function (obs) {
            if ($scope.selectObservation === obs)
            { $scope.selectObservation = null;}
            else
            { $scope.selectObservation = obs; }
        }
    
    // update a observation
         $scope.updateObservation = function(obs) {
            
            $scope.selectObservation  = obs;

            var updUrl = 'https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods';
                updUrl += '/' + obs._id.$oid;

            var updThis = $http.put(updUrl, JSON.stringify( { 
                                                                "icon" : " fa-eye ",
                                                                "UCD_method" :  "obs",
                                                                "project_id" : obs.project_id,
                                                                "file_name" : obs.file_name,
                                                                "start_date_execution" : obs.start_date_execution,
                                                                "end_date_execution" : obs.end_date_execution,
                                                                "objective" : obs.objective,
                                                                "participants_number" : obs.participants_number,
                                                                "participants_group" : obs.participants_group,
                                                                "place" : obs.place,
                                                                "procedure" : obs.procedure,
                                                                "recordingNotes" : obs.recordingNotes,
                                                                "recordingAudio" : obs.recordingAudio,
                                                                "recordingVideo" : obs.recordingVideo,
                                                                "questions" : obs.questions,
                                                                "data_collectedQual" : obs.data_collectedQual,
                                                                "data_collectedQuan" : obs.data_collectedQuan,
                                                                "findings" : obs.findings,
                                                                "recorded_file" : obs.recorded_file,
                                                                "recommendations_high" : obs.recommendations_high,
                                                                "recommendations_medium" : obs.recommendations_medium,
                                                                "recommendations_low" : obs.recommendations_low,
                                                                "notes" : obs.notes,
                                                                "links" : obs.links,
                                                                "attachments" : obs.attachments


                                                            } ), { params: { apiKey: apiKeyString }});
           
           updThis.success(function (data, status, headers, config) {
               
             //  $scope.getProjects(); get list methods
           });
           updThis.error(function (data, status, headers, config) {
               throw new Error("Something got wrong with update");
           });
       };

       // delete observation
        $scope.deleteObservation = function() {
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods/' +
                $scope.obs._id.$oid,
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

