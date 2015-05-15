(function(){

  angular
    .module('emlApp')
    .config(config);

    function config($stateProvider, $urlRouterProvider) {

      $stateProvider
        .state('tutorials', {
          url: '/',
          templateUrl: 'tutorials.html',
          controller: 'TutorialsController',
          controllerAs: 'app'
        })

        .state('tutorials_new', {
          url: '/tutorials/new',
          templateUrl: 'tutorialnew.html',
          controller: 'TutorialsController',
          controllerAs: 'TutsCtrl'
        })

        .state('tutorial', {
          url: '/tutorials/:id',
          templateUrl: 'tutorial.html',
          controller: 'LessonController',
          controllerAs: 'lesson'
        })

        .state('piano', {
          url: '/piano',
          templateUrl: 'piano.html',
          controller: 'PianoController',
          controllerAs: 'piano'
        });

      

        $urlRouterProvider.otherwise('/');
      }
 


})();