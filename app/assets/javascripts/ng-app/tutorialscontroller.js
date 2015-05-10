(function(){
  angular
    .module('emlApp',['ngResource'])
    .controller('TutorialsController', TutorialsController);

    TutorialsController.$inject = ['$http','$resource'];

    function TutorialsController($http, $resource){
      // var tutorial = $resource('/api/tutorials/:id',{id:'@id'});
      // capture variable
      var self = this;
      // Create a promise - asynchronis
      var promise = $http.get('/api/tutorials').
          success(function(data, status, headers, config){
          return data;  
        });

       promise.then(function(response){
        self.tutorials = response.data;
      });

      var tutorial = $http.get('/api/tutorials/1').
          success(function(data, status, headers, config){
          return data;  
        });

       tutorial.then(function(response){
        console.log(response.data);
        self.tutorial = response.data;
      });

      var lessons = $http.get('/api/tutorials/1').
          success(function(data, status, headers, config){
          return data;  
        });
        lessons.then(function(response){
        console.log(response.data.lessons);
        self.lessons = response.data.lessons;
      }); 



      }


}());