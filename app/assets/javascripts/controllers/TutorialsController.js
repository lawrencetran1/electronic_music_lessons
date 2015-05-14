(function(){
  angular
    .module('emlApp',['ngResource'])
    .controller('TutorialsController', TutorialsController);

    TutorialsController.$inject = ['$http','$resource'];

    function TutorialsController($http, $resource){
      var tutorial = $resource('/api/tutorials/:id',{id:'@id'});

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