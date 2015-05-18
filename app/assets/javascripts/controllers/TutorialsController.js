  (function(){
  angular
    .module('emlApp')
    .controller('TutorialsController', TutorialsController);

    TutorialsController.$inject = ['$http','$resource','$state'];

    function TutorialsController($http, $resource, $state){
      var tutorial = $resource('/api/tutorials/:id',{id:'@id'});

      // capture variable
      var ctrl = this;

      ctrl.audio_a = new Audio('a.ogg');
      ctrl.audio_s = new Audio('d.ogg');
      ctrl.audio_d = new Audio('s.ogg');
      ctrl.audio_f = new Audio('f.ogg');
      ctrl.audio_g = new Audio('g.ogg');
      ctrl.audio_h = new Audio('h.ogg');
      ctrl.audio_j = new Audio('j.ogg');
      ctrl.audio_k = new Audio('k.ogg');
      ctrl.audio_l = new Audio('l.ogg');
      ctrl.audio_semicolon = new Audio(';.ogg');

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
          $state.go('tutorials');
        }).error(function(response){
          console.log(response);
        });

        ctrl.lessonsArray = [];
        $state.go('tutorials');
      };

      ctrl.addLesson = function() {
        ctrl.lessonsArray.push({name: "", category: "", body: ""});
      }

      ctrl.removeLesson = function() {
        var lastItem = ctrl.lessonsArray.length-1;
        ctrl.lessonsArray.splice(lastItem);
      };

      ctrl.keyboard = [
        {key: 'a'},
        {key: 's'},
        {key: 'd'},
        {key: 'f'},
        {key: 'g'},
        {key: 'h'},
        {key: 'j'},
        {key: 'k'},
        {key: 'l'},
        {key: ';'}
      ];

      ctrl.tester = function($event) {
        var key = $event.keyCode;
        console.log($event.keyCode);
        if (key == 65) {ctrl.audio_a.play()}
        else if (key == 83) {ctrl.audio_s.play()}
        else if (key == 68) {ctrl.audio_d.play()}
        else if (key == 70) {ctrl.audio_f.play()}
        else if (key == 71) {ctrl.audio_g.play()}
        else if (key == 72) {ctrl.audio_h.play()}
        else if (key == 74) {ctrl.audio_j.play()}
        else if (key == 75) {ctrl.audio_k.play()}
        else if (key == 76) {ctrl.audio_l.play()}
        else if (key == 186) {ctrl.audio_semicolon.play()}
      }

    }


}());