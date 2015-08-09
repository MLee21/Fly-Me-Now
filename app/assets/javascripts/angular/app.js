var app = angular.module('flightsApp', [
  'ngRoute'
]);

app.config(['$routeProvider',
  function($routeProvider){
    $routeProvider.
    when('/', {
      templateUrl: '/templates/trip_choices.html',
      controller: 'TripChoicesController'
    }).
    otherwise({
      redirectTo: '/'
    });

  }
])


