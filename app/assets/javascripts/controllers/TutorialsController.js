(function(){
  angular
    .module('emlApp')
    .controller('TutorialsController', TutorialsController);

    TutorialsController.$inject = ['$http','$resource','$state'];

    function TutorialsController($http, $resource,$state){
      var Tutorial = $resource('/api/tutorials/:id',{id:'@id'});
     
      // tutorials = Tutorial.query();

      // tutorials = Tutorial({id: stateParams.id});

      // /api/tutorials/1


      // capture variable
      var ctrl = this;

      // Create a promise - asynchronis
      var promise = $http.get('/api/tutorials').success(function(data, status, headers, config){
        return data;  
      });

      promise.then(function(response){
        ctrl.tutorials = response.data;
      });

      ctrl.tutorialsArray = [];

      ctrl.lessonsArray = [];

      ctrl.addTutorial = function() {
        ctrl.tutorialsArray.push({
          name: ctrl.tutorialName,
          description: ctrl.tutorialDescription,
          category: ctrl.tutorialCategory,
          picture: ""
        });

        $http.post('/api/tutorials', {
          name: ctrl.tutorialName,
          category: ctrl.tutorialCategory,
          description: ctrl.tutorialDescription,
          lessons: ctrl.lessonsArray
        }).success(function(response){
          console.log(response);
        }).error(function(response){
          console.log(response);
        });
        
        ctrl.lessonsArray = [];
      };

      ctrl.addLesson = function() {
        ctrl.lessonsArray.push({name: "", category: "", body: ""});
      }

      ctrl.removeLesson = function() {
        var lastItem = ctrl.lessonsArray.length-1;
        ctrl.lessonsArray.splice(lastItem);
      };      

    }


}());