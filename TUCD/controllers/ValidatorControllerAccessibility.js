// Create a module for our core AMail services
var aValServices = angular.module('AValidator', []);

var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";


function DetailControllerAccessibility($scope, $http, $timeout, methodObject, modeType) {
    $scope.accessibilitys = null;
    $scope.accObject = methodObject.sharedObject;
    $scope.acc = null;
    $scope.selectedAcc = null;
    $scope.mode = modeType.sharedObject;
    $scope.titleText = 'New Accessibility testing';
    $scope.project_id = getUrlVar("projectID");
    $scope.accpos = -1;
    $scope.dateOptions = {
        dateFormat: "dd.mm.yy"
    };


    $scope.$watch('accObject.data', function(newValue){
        $scope.acc = newValue;

    });

    $scope.NewAcc = function () {
            $scope.accObject.data = null;
            $scope.acc = null;
            $scope.accpos = -1;
            $scope.accForm.$setPristine();
            $scope.mode.data = 'default';
            $scope.titleText = 'New Accessibility testing';
        };

    
    $scope.DeleteAcc = function () {
        if ($scope.acc.id != null && $scope.accpos != -1) {
             $scope.deleteDialog();  
        }
        $scope.acc = null;
        $scope.accpos = -1;
        $scope.accForm.$setPristine();
    };

    $scope.NewOrUpdateAcc = function () {

            if ($scope.mode.data == 'update'){
               // $scope.acc = JSON.parse(JSON.stringify(acc));
                $scope.titleText = 'Edit Accessibility testing';
                $scope.updateAcc($scope.acc);
            }

            else{

                $scope.acc.icon = " fa-wheelchair ";
                $scope.acc.UCD_method = "acc";
                $scope.acc.project_id = $scope.project_id;
                $scope.saveAcc($scope.acc);
            }  
        };
    
    $scope.canDelete = function () {
        return $scope.accForm.$valid && !$scope.accForm.$dirty && $scope.acc != null;
    }
    $scope.canAdd = function () {
        return $scope.accForm.$valid && $scope.accForm.$dirty && $scope.acc != null;
    }




//connection with Mongo DB

 $scope.saveAcc = function(acc) {
       
        var addThis = $http.post("https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods",
            acc,
            { params : { apiKey : apiKeyString }}
        );
        addThis.success(function(data, status, headers, config) {
            
            $scope.getMethods();
            

        });
        addThis.error(function(data, status, headers, config) {
            throw new Error("Something got wrong with save");
        });
    };

     //select a access
    $scope.selectAcc = function (acc) {
            if ($scope.selectAcc === acc)
            { $scope.selectedAcc= null;}
            else
            { $scope.selectedAcc = acc; }
        }


    // update a access
         $scope.updateAcc = function(acc) {
            
            $scope.selectAcc = acc;

            var updUrl = 'https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods';
                updUrl += '/' + acc._id.$oid;

            var updThis = $http.put(updUrl, JSON.stringify( {   
                                                                "icon" : " fa-wheelchair ",
                                                                "UCD_method" :  "acc",
                                                                "project_id" : acc.project_id,
                                                                "file_name" : acc.file_name,
                                                                "start_date_execution":acc.start_date_execution ,
                                                                "end_date_execution": acc.end_date_execution,
                                                                "objective":acc.objective,
                                                                "mainPrototype_name" : acc.mainPrototype_name,
                                                                "mainPrototype_link" :  acc.mainPrototype_link,
                                                                "mainPrototype_attachment" : acc.mainPrototype_attachment,
                                                                "prototype_name": acc.prototype_name,
                                                                "prototype_link" : acc.prototype_link,
                                                                "prototype_attachment": acc.prototype_attachment,
                                                                
                                                                "checkerP1" : acc.checkerP1,
                                                                "commentsP1" : acc.commentsP1,
                                                                "checkerP2" : acc.checkerP2,
                                                                "commentsP2" : acc.commentsP2,
                                                                "checkerP3" : acc.checkerP3,
                                                                "commentsP3" : acc.commentsP3,
                                                                "checkerP4" : acc.checkerP4,
                                                                "commentsP4" : acc.commentsP4,

                                                                "checkerO1" : acc.checkerO1,
                                                                "commentsO1" : acc.commentsO1,
                                                                "checkerO2" : acc.checkerO2,
                                                                "commentsO2" : acc.commentsO2,
                                                                "checkerO3" : acc.checkerO3,
                                                                "commentsO3" : acc.commentsO3,
                                                                "checkerO4" : acc.checkerO4,
                                                                "commentsO4" : acc.commentsO4,

                                                                "checkerU1" : acc.checkerU1,
                                                                "commentsU1" : acc.commentsU1,
                                                                "checkerU2" : acc.checkerU2,
                                                                "commentsU2" : acc.commentsU2,
                                                                "checkerU3" : acc.checkerU3,
                                                                "commentsU3" : acc.commentsU3,

                                                                "checkerR1" : acc.checkerR1,
                                                                "commentsR1" : acc.commentsR1,
                                                               
                                                                "recommendations_high": acc.recommendations_high,
                                                                "recommendations_medium": acc.recommendations_medium,
                                                                "recommendations_low": acc.recommendations_low,
                                                                "links": acc.links,
                                                                "notes": acc.notes,
                                                                "attachments": acc.attachments
                                                               


                                                            } ), { params: { apiKey: apiKeyString }});
           
           updThis.success(function (data, status, headers, config) {
            
           });
           updThis.error(function (data, status, headers, config) {
               throw new Error("Something got wrong with update");
           });
       };





        // delete a acc
        $scope.deleteAcc  = function() {
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/UCD_methods/' +
                $scope.acc._id.$oid,
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

