// Create a module for our core AMail services
var aValServices = angular.module('AValidator', []);

var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";


function DetailControllerMHFidelity($scope, $http, $timeout, methodObject, modeType) {
    $scope.mhfidelitys = null;
    $scope.mhfObject = methodObject.sharedObject;
    $scope.mhf = null;
    $scope.selectedMHFidelity = null;
    $scope.mhfpos = -1;
    $scope.mode = 'default';
    $scope.mode = modeType.sharedObject;
    $scope.titleText = 'New Medium/High fidelity prototype';
    $scope.project_id = getUrlVar("projectID");
    $scope.dateOptions = {
        dateFormat: "dd.mm.yy"
    };

    $scope.$watch('mhfObject.data', function(newValue){
        $scope.mhf = newValue;

    });


    $scope.NewMHFidelity = function () {
            $scope.mhfObject.data = null;
            $scope.mhf = null;
            $scope.mhfpos = -1;
            $scope.mhfForm.$setPristine();
            $scope.mode.data = 'default';
            $scope.titleText = 'New Medium/High fidelity prototype';
        };




    $scope.DeleteMHFidelity = function () {
        if ($scope.mhf.id != null && $scope.mhfpos != -1) {
             $scope.deleteDialog();  
        }
        $scope.mhf = null;
        $scope.mhfpos = -1;
        $scope.mhfForm.$setPristine();
    };


    $scope.NewOrUpdateMHFidelity = function () {

            if ($scope.mode.data == 'update'){

                $scope.titleText = 'Edit Medium/High fidelity prototype';

                $scope.updateMHFidelity($scope.mhf);
            }

            else{

                $scope.mhf.icon = " fa-hand-o-up ";
                $scope.mhf.UCD_method = "mhf";
                $scope.mhf.project_id = $scope.project_id;
                $scope.saveMHFidelity($scope.mhf);
            }  
        };

    
    $scope.canDelete = function () {
        return $scope.mhfForm.$valid && !$scope.mhfForm.$dirty && $scope.mhf != null;
    }
    $scope.canAdd = function () {
        return $scope.mhfForm.$valid && $scope.mhfForm.$dirty && $scope.mhf != null;
    }
    
     $scope.open = function() {
     $timeout(function() {
       $scope.opened = true;
     });
   };
    


//connection with Mongo DB

 $scope.saveMHFidelity = function(mhf) {
        // add a persona
        var addThis = $http.post("https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods",
            mhf,
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
    $scope.selectMHFidelity = function (mhf) {
            if ($scope.selectMHFidelity === mhf)
            { $scope.selectedMHFidelity = null;}
            else
            { $scope.selectedMHFidelity = mhf; }
        }


    // update a persona
         $scope.updateMHFidelity = function(mhf) {
            

            $scope.selectMHFidelity = mhf;

            var updUrl = 'https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods';
                updUrl += '/' + mhf._id.$oid;

            var updThis = $http.put(updUrl, JSON.stringify( { 

                                                                "icon" : " fa-hand-o-up ",
                                                                "UCD_method" :  "mhf",
                                                                "project_id" : mhf.project_id,
                                                                "file_name" : mhf.file_name,
                                                                "start_date_execution" : mhf.start_date_execution,
                                                                "end__date_execution" : mhf.end__date_execution,
                                                                "mainPrototype_name" : mhf.mainPrototype_name,
                                                                "mainPrototype_link" : mhf.mainPrototype_link,
                                                                "mainPrototype_attachment" :mhf.mainPrototype_attachment,
                                                                "mainFidelity_level" : mhf.mainFidelity_level,
                                                                "mhf.fidelity_level" : mhf.fidelity_level,
                                                                "prototype_name" : mhf.prototype_name,
                                                                "prototype_link" : mhf.prototype_link,
                                                                "prototype_attachment" :mhf.prototype_attachment,
                                                                "notes" : mhf.notes,
                                                                "attachments" :mhf.attachments,
                                                                "links" : mhf.links


                                                            } ), { params: { apiKey: apiKeyString }});
           
           updThis.success(function (data, status, headers, config) {
               
             $scope.getMethods(); //get list methods
           });
           updThis.error(function (data, status, headers, config) {
               throw new Error("Something got wrong with update");
           });
       };





        // delete a persona
        $scope.deleteMHFidelity = function() {
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods/' +
                $scope.mhf._id.$oid,
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

