app.controller('ResultsController', [
 '$scope', 'results', 

  function($scope, results){
    console.log(results);
    $scope.results = results;
  }
])
