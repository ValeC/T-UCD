// Create a module for our core AMail services
var aValServices = angular.module('AValidator', []);

var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";

function DetailControllerSurvey($scope, $http, $timeout,  methodObject, modeType) {
    $scope.surveys = null;
    $scope.surObject = methodObject.sharedObject;
    $scope.sur = null;
    $scope.selectedSurvey = null;
    $scope.surpos = -1;
    $scope.mode = modeType.sharedObject;
    $scope.mode = 'default';
    $scope.titleText = 'New Survey';
    $scope.titleTextEdit = 'Edit Survey';
    $scope.project_id = getUrlVar("projectID");
    $scope.dateOptions = {
        dateFormat: "dd.mm.yy"
    };

    $scope.$watch('surObject.data', function(newValue){
        $scope.sur = newValue;

    });

    $scope.NewSurvey = function () {
                $scope.surObject.data = null;
                $scope.sur = null;
                $scope.surpos = -1;
                $scope.surForm.$setPristine();
                $scope.mode.data = 'default';
                $scope.titleText = 'New Survey';
    };



    // $scope.AddSurvey = function () {
    //     if ($scope.sur.id != null && $scope.surpos != -1) {
    //         $scope.surveys.splice($scope.surpos, 1, $scope.sur);
    //     }
    //     else {
    //         $scope.sur.id = Math.uuid();
    //         $scope.surveys.push($scope.sur);
    //     }
    //     $scope.sur = null;
    //     $scope.surpos = -1;
    //     $scope.surForm.$setPristine();
    // };
    // $scope.SelectSurvey = function (sur) {
    //     if (sur != null) {
    //         $scope.sur = {
    //             id: sur.id, 
    //             start_date_execution: sur.start_date_execution,
    //             end_date_execution: sur.end_date_execution,
    //             objective: sur.objective, 
    //             participants_number: sur.participants_number,
    //             participants_group: sur.participants_group, 
    //             place: sur.place, 
    //             procedure: sur.procedure,
    //             recording: sur.recording,
    //             questions:sur.questions, 
    //             data_collected: sur.data_collected, 
    //             findings: sur.findings, 
    //             recording_file: sur.recording_file,
    //             recommendations_high: sur.recommendations_high,
    //             recommendations_medium: sur.recommendations_medium,
    //             recommendations_low: sur.recommendations_low,
    //             attachments: sur.findings, 
    //             notes: sur.notes,
    //             links: sur.links
    //             };
    //         $scope.surpos = $scope.surveys.indexOf(sur);
    //     }
    //     else {
    //         $scope.sur = null;
    //         $scope.surpos = -1;
    //     }
    //     $scope.surForm.$setPristine();
    // };
    $scope.DeleteSurvey = function () {
        if ($scope.sur.id != null && $scope.surpos != -1) {
            $scope.deleteDialog();  
        }
        $scope.sur = null;
        $scope.surpos = -1;
        $scope.surForm.$setPristine();
    };

    $scope.NewOrUpdateSurvey = function () {

            if ($scope.mode.data == 'update'){
                //$scope.sur = JSON.parse(JSON.stringify(sur));
                $scope.titleText = 'Edit Survey ';
                $scope.updateSurvey($scope.sur);
            }

            else{

                $scope.sur.icon = " fa-pencil-square-o ";
                $scope.sur.UCD_method = "sur";
                $scope.sur.project_id = $scope.project_id;
                $scope.saveSurvey($scope.sur);
            }  
        };


    
    $scope.canDelete = function () {
        return $scope.surForm.$valid && !$scope.surForm.$dirty && $scope.sur != null;
    }
    $scope.canAdd = function () {
        return $scope.surForm.$valid && $scope.surForm.$dirty && $scope.sur != null;
    }
    
     $scope.open = function() {
     $timeout(function() {
       $scope.opened = true;
     });
   };



//connection with Mongo DB

 $scope.saveSurvey = function(sur) {
        var addThis = $http.post("https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods",
            sur,
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
    $scope.selectSurvey = function (sur) {
            if ($scope.selectSurvey === sur)
            { $scope.selectSurvey = null;}
            else
            { $scope.selectSurvey = sur; }
        }
    
    // update a interview
         $scope.updateSurvey = function(sur) {
            
            $scope.selectSurvey  = sur;

            var updUrl = 'https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods';
                updUrl += '/' + sur._id.$oid;

            var updThis = $http.put(updUrl, JSON.stringify( { 
                                                                "icon" : " fa-pencil-square-o ",
                                                                "UCD_method" :  "sur",
                                                                "project_id" : sur.project_id,
                                                                "file_name" : sur.file_name,
                                                                "start_date_execution" : sur.start_date_execution,
                                                                "end_date_execution" : sur.end_date_execution,
                                                                "objective" : sur.objective,
                                                                "participants_number" : sur.participants_number,
                                                                "participants_group" : sur.participants_group,
                                                                "place" : sur.place,
                                                                "procedure" : sur.procedure,
                                                                "recording" : sur.recording,
                                                                "questions" : sur.questions,
                                                                "data_collected" : sur.data_collected,
                                                                "findings" : sur.findings,
                                                                "recorded_file" : sur.recorded_file,
                                                                "recommendations_high" : sur.recommendations_high,
                                                                "recommendations_medium" : sur.recommendations_medium,
                                                                "recommendations_low" : sur.recommendations_low,
                                                                "notes" : sur.notes,
                                                                "links" : sur.links,
                                                                "attachments" : sur.attachments


                                                            } ), { params: { apiKey: apiKeyString }});
           
           updThis.success(function (data, status, headers, config) {
               
           });
           updThis.error(function (data, status, headers, config) {
               throw new Error("Something got wrong with update");
           });
       };

       // delete interview
        $scope.deleteSurvey = function() {
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods/' +
                $scope.sur._id.$oid,
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

