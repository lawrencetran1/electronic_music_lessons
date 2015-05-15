(function(){
  angular
    .module('emlApp')
    .controller('TutorialsController', TutorialsController);

    TutorialsController.$inject = ['$http','$resource','$state'];

    function TutorialsController($http, $resource,$state){
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

        switch(ctrl.tutorialCategory){
          case 'Keyboards':
            ctrl.tutorialPicture = 'keyboards.jpg'
            break;
          case 'Audio Production':
            ctrl.tutorialPicture = 'audio-production.jpg'
            break;
          case 'Music Theory':
            ctrl.tutorialPicture = 'music-theory.jpg'
            break;
          case 'DJ':
            ctrl.tutorialPicture = 'dj.jpg'
            break;                            
        }

        ctrl.tutorialsArray.push({
          name: ctrl.tutorialName,
          description: ctrl.tutorialDescription,
          category: ctrl.tutorialCategory,
          picture: ctrl.tutorialPicture,
          lessons_attributes: ctrl.lessonsArray
        });

        $http.post('/api/tutorials', {

          name: ctrl.tutorialName,
          description: ctrl.tutorialDescription,
          category: ctrl.tutorialCategory,
          picture: ctrl.tutorialPicture,
          lessons_attributes: ctrl.lessonsArray

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