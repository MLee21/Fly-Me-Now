app.controller('ResultsController', [
 '$scope', 'results', 

  function($scope, results){
    console.log("Results",results);
    $scope.results = results;
  }
])
