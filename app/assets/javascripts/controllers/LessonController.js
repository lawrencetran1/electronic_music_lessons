(function(){
  angular
    .module('emlApp')
    .run(['$anchorScroll', function($anchorScroll) {
    $anchorScroll.yOffset = 50;   
    }])
    .controller('LessonController', LessonController);


    LessonController.$inject = ['$http', '$resource', '$state','$stateParams',
    '$scope','$anchorScroll','$location'];


  function LessonController($http,$resource,$state, $stateParams, $scope,$anchorScroll,$location){ 
      var self = this;    
      var Tutorial = $resource('/api/tutorials/:id',{id:'@id'});
     
      var lessons = $http.get('/api/tutorials/' + $stateParams.id).
          success(function(data, status, headers, config){
          return data;  
        });
        lessons.then(function(response){
        self.tutorial = response.data;
        self.lessons = response.data.lessons;
        console.log(self.lessons);
      });

      $scope.gotoAnchor = function(x) {
        var newHash = 'anchor' + x;
        if ($location.hash() !== newHash) {
          $location.hash('anchor' + x);
        } else {
          $anchorScroll();
      }        
    
    };        
  }
    
})();