(function(){
  angular
    .module('emlApp')
    .controller('LessonController', LessonController);

    LessonController.$inject = ['$http', '$resource', '$state','$stateParams'];


  function LessonController($http,$resource,$state, $stateParams){ 
      var self = this;    
      var Tutorial = $resource('/api/tutorials/:id',{id:'@id'});


      var tutorial = $http.get('/api/tutorials/').
          success(function(data, status, headers, config){
          return data;  
        });

       tutorial.then(function(response){
        console.log(response.data);
        self.tutorial = response.data;
      });
     
      var lessons = $http.get('/api/tutorials/' + $stateParams.id).
          success(function(data, status, headers, config){
          return data;  
        });
        lessons.then(function(response){
       
        self.lessons = response.data.lessons;
        console.log(self.lessons);
      });

  }      


})(); 