var app = angular.module('flightsApp', [
  'ngRoute'
  ]);

flightsApp.config({['$routeProvider',
  function($routeProvider){
    $routeProvider.
    when('/deals', {
      templateUrl: 'deals.html',
      //should be homepage
      controller: 'dealsController'
    }).
    when('deals/:dealId', {
      templateURL: 'deals-by-city.html',
      controller: 'dealsByCityController'
    }).
    otherwise({
      redirectTo: '/deals'
    });

  });
})
