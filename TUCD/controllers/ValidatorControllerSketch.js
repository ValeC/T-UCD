// Create a module for our core AMail services
var aValServices = angular.module('AValidator', []);

var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";


function DetailControllerSketch($scope, $http, $timeout, methodObject, modeType) {
    $scope.sketches = null;
    $scope.sketObject = methodObject.sharedObject;
    $scope.sket = null;
    $scope.selectedSketch = null;
    $scope.sketpos = -1;
    $scope.mode = modeType.sharedObject;
    $scope.titleText = 'New Sketch';
    $scope.project_id = getUrlVar("projectID");
    $scope.dateOptions = {
        dateFormat: "dd.mm.yy"
    };


    $scope.$watch('sketObject.data', function(newValue){
        $scope.sket = newValue;

    });

     $scope.NewSketch= function () {
            $scope.sketObject.data = null;
            $scope.sket = null;
            $scope.sketpos = -1;
            $scope.sketForm.$setPristine();
            $scope.mode.data = 'default';
            $scope.titleText = 'New Sketch';
        };

    // $scope.AddSketch = function () {
    //     if ($scope.sket.id != null && $scope.sketpos != -1) {
    //         $scope.sketches.splice($scope.sketpos, 1, $scope.sket);
    //     }
    //     else {
    //         $scope.sket.id = Math.uuid();
    //         $scope.sketches.push($scope.sket);
    //     }
    //     $scope.sket = null;
    //     $scope.sketpos = -1;
    //     $scope.sketForm.$setPristine();
    // };
    // $scope.SelectSketch = function (sket) {
    //     if (sket != null) {
    //         $scope.sket = {
    //             id: sket.id, 
    //             creator_name: sket.creator_name,
    //             start_date_execution: sket.start_date_execution,
    //             end_date_execution: sket.end_date_execution,
    //             mainSketch:sket.mainSketch,
    //             sketch: sket.sketch,
    //             notes : sket.notes,
    //             links: sket.links,
    //             attachments : sket.attachments  
    //         };
            
    //         $scope.sketpos = $scope.sketches.indexOf(sket);
    //     }
    //     else {
    //         $scope.sket = null;
    //         $scope.sketpos = -1;
    //     }
    //     $scope.sketForm.$setPristine();
    // };
    $scope.DeleteSketch = function () {
        if ($scope.sket.id != null && $scope.sketpos != -1) {
            $scope.deleteDialog();
        }
        $scope.sket = null;
        $scope.sketpos = -1;
        $scope.sketForm.$setPristine();
    };

    $scope.NewOrUpdateSketch = function () {

            if ($scope.mode.data == 'update'){
                //$scope.sket = JSON.parse(JSON.stringify(sket));
                $scope.titleText = 'Edit Sketch';
                $scope.updateSketch($scope.sket);
            }

            else{

                $scope.sket.icon = " fa-edit ";
                $scope.sket.UCD_method = "ske";
                $scope.sket.project_id = $scope.project_id;
                $scope.saveSketch($scope.sket);
            }  
        };


    $scope.canDelete = function () {
        return $scope.sketForm.$valid && !$scope.sketForm.$dirty && $scope.sket != null;
    }
    $scope.canAdd = function () {
        return $scope.sketForm.$valid && $scope.sketForm.$dirty && $scope.sket != null;
    }
    
     $scope.open = function() {
     $timeout(function() {
       $scope.opened = true;
     });
   };
    




//connection with Mongo DB

 $scope.saveSketch = function(sket) {
        // add a sketch
        var addThis = $http.post("https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods",
            sket,
            { params : { apiKey : apiKeyString }}
        );
        addThis.success(function(data, status, headers, config) {
            
            $scope.getMethods();
            

        });
        addThis.error(function(data, status, headers, config) {
            throw new Error("Something got wrong with save");
        });
    };

     //select a sketch
    $scope.selectSketch = function (sket) {
            if ($scope.selectSketch === sket)
            { $scope.selectedSketch = null;}
            else
            { $scope.selectedSketch = sket; }
        }


    // update a sketch
         $scope.updateSketch = function(sket) {
            
            $scope.selectSketch = sket;

            var updUrl = 'https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods';
                updUrl += '/' + sket._id.$oid;

            var updThis = $http.put(updUrl, JSON.stringify( { 
                                                                "icon" : " fa-edit ",
                                                                "UCD_method" :  "ske",
                                                                "project_id" : sket.project_id,
                                                                "file_name" : sket.file_name,
                                                                "start_date_execution" : sket.start_date_execution,
                                                                "end_date_execution" : sket.end_date_execution,
                                                                "mainSketch" : sket.mainSketch,
                                                                "sketch" : sket.sketch,
                                                                "notes" : sket.notes,
                                                                "links" : sket.links,
                                                                "attachments" : sket.attachments

                                                            } ), { params: { apiKey: apiKeyString }});
           
           updThis.success(function (data, status, headers, config) {
               
             //  $scope.getProjects(); get list methods
           });
           updThis.error(function (data, status, headers, config) {
               throw new Error("Something got wrong with update");
           });
       };





        // delete a sketch
        $scope.deleteSketch = function() {
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods/' +
                $scope.sket._id.$oid,
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

