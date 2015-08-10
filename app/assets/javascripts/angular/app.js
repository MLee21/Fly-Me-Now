var app = angular.module('flightsApp', [
  'ui.router'
]);

app.config(['$stateProvider', '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider){

    $urlRouterProvider.otherwise('/');

    $stateProvider.
    state('tripchoices', {
      url: '/',
      templateUrl: '/templates/trip_choices.html',
      controller: 'TripChoicesController'
    }).
    state('results', {
      url: '/results',
      templateUrl: '/templates/results.html', 
      controller: 'ResultsController', 
      params: { selectTripChoices: [] },
      resolve: {
        //these keys will end up being injected into the Results controller
        results: function($stateParams, tripChoiceDataFromApi){
          return tripChoiceDataFromApi($stateParams.selectTripChoices);
        }
      }
    })
  }
])
