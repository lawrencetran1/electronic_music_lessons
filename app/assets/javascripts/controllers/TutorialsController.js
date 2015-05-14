(function(){
  angular
    .module('emlApp',['ngResource'])
    .controller('TutorialsController', TutorialsController);

    TutorialsController.$inject = ['$http','$resource'];

    function TutorialsController($http, $resource){
      var tutorial = $resource('/api/tutorials/:id',{id:'@id'});
      // capture variable
      var self = this;
      self.test = 'sup';
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