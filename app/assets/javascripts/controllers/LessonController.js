(function(){
  angular
    .module('emlApp')
    .run(['$anchorScroll', function($anchorScroll) {
    $anchorScroll.yOffset = 50;   
    }])
    .controller('LessonController', LessonController);


    LessonController.$inject = ['$http', '$resource', '$state', '$stateParams', '$scope', '$timeout', '$sce'];


  function LessonController($http, $resource, $state, $stateParams, $scope, $timeout, $sce){ 
      var self = this;    
      var Tutorial = $resource('/api/tutorials/:id',{id:'@id'});

      var keyword;
      var lessons = $http.get('/api/tutorials/' + $stateParams.id).
          success(function(data, status, headers, config){
          return data;  
        });
        lessons.then(function(response){
        self.tutorial = response.data;
        keyword = response.data.category;
        self.lessons = response.data.lessons;
        // must wait to init collapsible
        $timeout(function(){
                $('.collapsible').collapsible({});
            },500);
      });

      var youtube = $http.get('https://www.googleapis.com/youtube/v3/search?order=viewCount&part=snippet&q=dj&channelId=UCwjiBFz7LuxYvmIRw5kChFA&maxResults=1&key=AIzaSyC3N_wXv7GRGU2ZPViN3PNW8W9_FyzOtBY')
        .success(function(data){
          return data;
        });
        youtube.then(function(response){
          self.videoId = response.data.items[0].id.videoId;
          $scope.movie = {src:"http://www.youtube.com/embed/"+response.data.items[0].id.videoId};
        });

      $scope.trustSrc = function(src) {
        return $sce.trustAsResourceUrl(src);
      };
      
      self.audio_a = new Audio('audio/keyboard_c.mp3');
      self.audio_s = new Audio('audio/keyboard_d.mp3');
      self.audio_d = new Audio('audio/keyboard_e.mp3');
      self.audio_f = new Audio('audio/keyboard_f.mp3');
      self.audio_g = new Audio('audio/keyboard_g.mp3');
      self.audio_h = new Audio('audio/keyboard_a.mp3');
      self.audio_j = new Audio('audio/keyboard_b.mp3');
      self.audio_k = new Audio('audio/keyboard_c2.mp3');
      self.audio_l = new Audio('audio/keyboard_d2.mp3');
      self.audio_semicolon = new Audio('audio/keyboard_e2.mp3');

      self.keyboard = [
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

      self.tester = function($event) {
        var key = $event.keyCode;
        console.log($event.keyCode);
        if (key == 65) {self.audio_a.play()}
        else if (key == 83) {self.audio_s.play()}
        else if (key == 68) {self.audio_d.play()}
        else if (key == 70) {self.audio_f.play()}
        else if (key == 71) {self.audio_g.play()}
        else if (key == 72) {self.audio_h.play()}
        else if (key == 74) {self.audio_j.play()}
        else if (key == 75) {self.audio_k.play()}
        else if (key == 76) {self.audio_l.play()}
        else if (key == 186) {self.audio_semicolon.play()}
      }            
      
  }
    
})();