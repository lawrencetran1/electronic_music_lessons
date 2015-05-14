(function(){

	angular
		.module('emlApp')
		.config(config);

		function config($stateProvider, $urlRouterProvider) {

			$stateProvider
        .state('home', {
          url: '/',
          templateUrl: 'home.html',
          controller: 'TutorialsController',
          controllerAs: 'app'
        })

				.state('tutorials_new', {
					url: '/tutorials/new',
          templateUrl: 'tutorialnew.html',
					controller: 'TutorialsController',
					controllerAs: 'TutsCtrl'
				})

        .state('tutorials', {
          url: '/tutorials/:tutorialId',
          templateUrl: 'tutorial.html',
          controller: 'TutorialsController',
          controllerAs: 'Tutorial'
        });

      

        $urlRouterProvider.otherwise('/');
		  }
 



})();