app.controller('flightsController', ['$scope', 'iataConversion', function($scope, iataConversion){
  iataConversion.then(function(response) {
    $scope.response = response;
    console.log(response);
  });
}]);