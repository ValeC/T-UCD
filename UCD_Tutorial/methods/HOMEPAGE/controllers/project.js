// Create a module for our core AMail services
var aValServices = angular.module('ProjectsHomepage', ['ui.date']);

var apiKeyString = "EZaocWcSRDd36ZuShAsXENRQuzXF8MM7";

function DetailControllerProject($scope, $http) {
    $scope.projects = null;
    $scope.proj = null;
    $scope.selectedProject = null;
    $scope.projspos = -1;
    $scope.mode = 'default';
    $scope.titleText = 'New Project';
    $scope.buttonText = 'Create & Go';
    $scope.dateOptions = {
        dateFormat: "dd.mm.yy"
    };


    $scope.NewProject = function () {
        $scope.proj = null; 
        $scope.projpos = -1;
        $scope.projForm.$setPristine();
        $scope.mode = 'default'
        $scope.titleText = 'New Project';
        $scope.buttonText = 'Create & Go';
    };


    $scope.AddProject = function () {

        //if project already exists
        if ($scope.proj.id != null && $scope.projpos != -1) {
            //substitute it with the old one
            $scope.projects.splice($scope.projpos, 1, $scope.proj);
        }

        //else, create a new one
        else {
            $scope.proj.id = Math.uuid();
            $scope.projects.push($scope.proj);
        }

        //after adding, reset the form
        $scope.proj = null;
        $scope.projpos = -1;
        $scope.projForm.$setPristine();
    };

    $scope.UpdateProject = function (proj) {

        //when selecting message, put it in the form
        if (proj != null) {
            $scope.proj = JSON.parse(JSON.stringify(proj));

            //$scope.projpos = $scope.projects.indexOf(proj);
            $scope.mode = 'update';
            $scope.titleText = 'Edit Project';
            $scope.buttonText = 'Save';

        }
        else {
            $scope.proj = null;
            $scope.projpos = -1;
        }
        $scope.projForm.$setPristine();
    };

    
    $scope.DeleteProject = function (proj) {
            $scope.proj = proj;

            //if the project exists
            if ($scope.proj._id != null && $scope.projpos != -1) {

                $scope.deleteDialog();  
            }
            
        };

    $scope.NewOrUpdateProject = function () {

        if ($scope.mode == 'update'){
            $scope.updateProject($scope.proj);
        }

        else{
            $scope.saveProject($scope.proj);
            
        }

        
        
    };

    //we can add and delete the message if: the form is valid (why??), not dirty?? and it exists
    $scope.canDelete = function () {
        return $scope.projForm.$valid && !$scope.projForm.$dirty && $scope.proj != null;
    }
    $scope.canAdd = function () {
        return $scope.projForm.$valid && $scope.projForm.$dirty && $scope.proj != null;
    }





//connection with Mongo DB



    // get projects
        $scope.getProjects = function ()
        {
            var getList = $http.get('https://api.mongolab.com/api/1/databases/timeman/collections/Projects',
                { params: { apiKey: apiKeyString } }
            );
            getList.success(function(data, status, headers, config) {
                $scope.projects = data;
                
            });
            getList.error(function(data, status, headers, config) {
               throw new Error("Something got wrong with get");
            });
        };

        $scope.getProjects();

        $scope.saveProject = function(proj) {
        // add a project
        var addThis = $http.post("https://api.mongolab.com/api/1/databases/timeman/collections/Projects",
            proj,
            { params : { apiKey : apiKeyString }}
        );
        addThis.success(function(data, status, headers, config) {
            $scope.go(data._id.$oid);

            //$scope.getProjects();

        });
        addThis.error(function(data, status, headers, config) {
            throw new Error("Something got wrong with save");
        });
    };


    //select a project
    $scope.selectProject = function (proj) {
            if ($scope.selectProject === proj)
            { $scope.selectedProject = null;}
            else
            { $scope.selectedProject = proj; }
        }



    // update a project
     $scope.updateProject = function(proj) {
        
        $scope.selectProject = proj;

        var updUrl = 'https://api.mongolab.com/api/1/databases/timeman/collections/Projects';
            updUrl += '/' + proj._id.$oid;

        var updThis = $http.put(updUrl, JSON.stringify( { 
                                                            "project_name" : proj.project_name, 
                                                            "description" : proj.description,
                                                            "customer" : proj.customer, 
                                                            "project_members" : proj.project_members,
                                                            "start_date" : proj.start_date,
                                                            "end_date" : proj.end_date

                                                        } ), { params: { apiKey: apiKeyString }});
       
       updThis.success(function (data, status, headers, config) {
           
           $scope.getProjects();
       });
       updThis.error(function (data, status, headers, config) {
           throw new Error("Something got wrong with update");
       });
   };







         // delete a project
        $scope.deleteProject = function() {
            //if (project == undefined) { project = $scope.projects[1] };
            var delThis = $http.delete('https://api.mongolab.com/api/1/databases/timeman/collections/Projects/' +
                $scope.proj._id.$oid,
                {
                    params : { apiKey : apiKeyString }
                }   
            );
            delThis.success(function(data, status, headers, config) {
                $scope.getProjects();
                return true;
            });
            delThis.error(function(data, status, headers, config) {
                throw new Error("Something got wrong with delete");
                return false;
            });
        };



        $scope.deleteDialog = function(proj) {
            $scope.proj = proj;
            $( "#dialog-confirm" ).dialog({
                resizable: false,
                height: 160,
                modal: true,
                buttons: {
                    Delete: function() {
                        $scope.$apply(function(){
                            $scope.deleteProject();
                            //if ( $scope.deleteProject()){
                                $scope.proj = null;
                                //$scope.projpos = -1;
                                //$scope.projForm.$setPristine();
                                $(".ui-dialog-content").dialog("close");
                                
                                $( "#dialog-ok-delete" ).dialog({
                                    resizable: false,
                                    height: 160,
                                    modal: true,
                                    buttons: {
                                        
                                        OK: function() {
                                            $( this ).dialog( "close" );
                                        }
                                    }
                                });
                            //}
                            // else{

                            //     $( "#dialog-delete-error" ).dialog({
                            //         resizable: false,
                            //         height: 160,
                            //         modal: true,
                            //         buttons: {
                                        
                            //             OK: function() {
                            //                 $( this ).dialog( "close" );
                            //             }
                            //         }
                            //     });


                            // }

                        });
                    },
                    
                    Cancel: function() {
                        $( this ).dialog( "close" );
                     
                    }
            }
        });
      };

    



    //go to project
    $scope.go = function(id){

        window.location.href = "../proveXSL/methods1.xml?projectID=" + id;
    }


}

