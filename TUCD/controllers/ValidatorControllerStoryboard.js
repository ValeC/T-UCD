// Create a module for our core AMail services
var aValServices = angular.module('AValidator', []);

var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";


function DetailControllerStoryboard($scope, $http, $timeout, methodObject, modeType) {
    $scope.storyboards = null;
    $scope.stoObject = methodObject.sharedObject;
    $scope.sto = null;
    $scope.selectedStoryboard = null;
    $scope.stopos = -1;
    $scope.mode = modeType.sharedObject;
    $scope.mode = 'default';
    $scope.titleText = 'New Storyboard';
    $scope.project_id = getUrlVar("projectID");
    $scope.dateOptions = {
        dateFormat: "dd.mm.yy"
    };


    $scope.$watch('stoObject.data', function(newValue){
        $scope.sto = newValue;

    });

     $scope.NewStoryboard= function () {
            $scope.stoObject.data = null;
            $scope.sto = null;
            $scope.stopos = -1;
            $scope.stoForm.$setPristine();
            $scope.mode.data = 'default';
            $scope.titleText = 'New Storyboard';
        };

    $scope.DeleteStoryboard = function () {
        if ($scope.sto.id != null && $scope.stopos != -1) {
            $scope.deleteDialog();
        }
        $scope.sto = null;
        $scope.stopos = -1;
        $scope.stoForm.$setPristine();
    };

    $scope.NewOrUpdateStoryboard = function () {

            if ($scope.mode.data == 'update'){
                $scope.sto = JSON.parse(JSON.stringify(sto));
                $scope.titleText = 'Edit Storyboard';
                $scope.updateStoryboard($scope.sto);
            }

            else{

                $scope.sto.icon = " fa-th ";
                $scope.sto.UCD_method = "sto";
                $scope.sto.project_id = $scope.project_id;
                $scope.saveStoryboard($scope.sto);
            }  
        };


    $scope.canDelete = function () {
        return $scope.stoForm.$valid && !$scope.stoForm.$dirty && $scope.sto != null;
    }
    $scope.canAdd = function () {
        return $scope.stoForm.$valid && $scope.stoForm.$dirty && $scope.sto != null;
    }
    
     $scope.open = function() {
     $timeout(function() {
       $scope.opened = true;
     });
   };
    




//connection with Mongo DB

 $scope.saveStoryboard = function(sto) {
        
        var addThis = $http.post("https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods",
            sto,
            { params : { apiKey : apiKeyString }}
        );
        addThis.success(function(data, status, headers, config) {
            
            $scope.getMethods();
            

        });
        addThis.error(function(data, status, headers, config) {
            throw new Error("Something got wrong with save");
        });
    };

     //select a storyboard
    $scope.selectStoryboard = function (sto) {
            if ($scope.selectStoryboard === sto)
            { $scope.selectedStoryboard = null;}
            else
            { $scope.selectedStoryboard = sto; }
        }


    // update a storyboard
         $scope.updateStoryboard = function(sto) {
            
            $scope.selectStoryboard = sto;

            var updUrl = 'https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods';
                updUrl += '/' + sto._id.$oid;

            var updThis = $http.put(updUrl, JSON.stringify( { 
                                                                "icon" : " fa-th ",
                                                                "UCD_method" :  "sto",
                                                                "project_id" : sto.project_id,
                                                                "file_name" : sto.file_name,
                                                                "start_date_execution" : sto.start_date_execution,
                                                                "end_date_execution" : sto.end_date_execution,
                                                                "mainStoryboard" : sto.mainStoryboard,
                                                                "storyboard" : sto.storyboard,
                                                                "notes" : sto.notes,
                                                                "links" : sto.links,
                                                                "attachments" : sto.attachments

                                                            } ), { params: { apiKey: apiKeyString }});
           
           updThis.success(function (data, status, headers, config) {
               
             //  $scope.getProjects(); get list methods
           });
           updThis.error(function (data, status, headers, config) {
               throw new Error("Something got wrong with update");
           });
       };





        // delete a storyboard
        $scope.deleteStoryboard = function() {
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods/' +
                $scope.sto._id.$oid,
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

