app.controller('TripChoicesController', [
  '$scope', 'tripChoiceDataFromApi',
  //tripChoiceDataFromApi comes from fle.js of the same name.
  //In this file it is a dependency
  //$ is for angular dependencies

  function ($scope, tripChoiceDataFromApi){
    $scope.selected = {};

    $scope.destinations = [
      {
        city: "Fort Lauderdale",
        state: "FL",
        airport_code: "FLL",
      },
      {
        city: "Atlanta",
        state: "GA",
        airport_code: "ATL",
      },
      {
        city: "Houston",
        state: "TX",
        airport_code: "HOU",
      },
      {
        city: "New Orleans",
        state: "LA",
        airport_code: "MSY",
      },
      {
        city: 'New York',
        state: "NY",
        airport_code: "NYC",
      },
      {
        city: 'Orlando',
        state: "FL",
        airport_code: "MCO",
      },
    
      {
        city: "Seattle",
        state: "WA",
        airport_code: "SEA",
      },
      {
        city: "Tampa",
        state: "FL",
        airport_code: "TPA",
      },
      {
        city: "San Juan",
        state: "PR",
        airport_code: "SJU",
      },
      {
        city: "Miami",
        state: "FL",
        airport_code: "MIA"
      }
    ];

//key is the city and the value is the entire destination object
// tripChoicesByCity is a hash with the city as the key
    $scope.tripChoicesByCity = $scope.destinations.reduce(function(tripChoicesByCity, tripChoice) {
      tripChoicesByCity[tripChoice.city] = tripChoice;
      return tripChoicesByCity;
    }, {});

    
    $scope.maxSelected = function(){
      var count = 0;
      for(x in $scope.selected){
          if($scope.selected[x]) count++;
      }
      return (count===3) ? true : false;
    };

    $scope.fetchFlights = function () {
      //get the tripChoice objects 
      var selectTripChoices = [];
      for (var selectedCity in $scope.selected) {
        selectTripChoices.push($scope.tripChoicesByCity[selectedCity]);
      }

      //return the search results for all the user's selected cities
      tripChoiceDataFromApi(selectTripChoices).then(function(tripResultsFromApi) {
      //hallelujahVacation are the return values from the promise of the vacations 
        console.log(tripResultsFromApi);
      })
    };
  }
]);







//only allow 3 cities to be selected
//upon click, box turns blue
//grab airport code of destination, 
//send each destination to FlightInformation Service 1 at a time
//Flight Information Service needs to accept a destination airport
