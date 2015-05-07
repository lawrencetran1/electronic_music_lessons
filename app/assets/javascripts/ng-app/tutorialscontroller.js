(function(){
  angular
    .module('emlApp')
    .controller('TutorialsController', TutorialsController);

    TutorialsController.$inject = ['$http'];

    function TutorialsController($http){
      
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

      }
}());