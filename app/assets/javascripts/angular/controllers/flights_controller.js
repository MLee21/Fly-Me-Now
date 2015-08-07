app.controller('flightsController', ['$scope', 'flightInformation', function($scope, flightInformation){
  flightInformation.then(function(response) {
    $scope.response = response;
    console.log(response);
  });
}]);