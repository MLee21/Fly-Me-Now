app.controller('TripChoicesController', [
  '$scope', 'tripChoiceDataFromApi',
  //tripChoiceDataFromApi comes from fle.js of the same name.
  //In this file it is a dependency
  //$ is for angular dependencies

  function ($scope, tripChoiceDataFromApi){
    $scope.selected = {};

    $scope.destinations = [
      {
        city: "Austin",
        state: "TX",
        airport_code: "AUS",
      },
      {
        city: "Boston",
        state: "MA",
        airport_code: "BOS",
      },
      {
        city: "Charleston",
        state: "SC",
        airport_code: "CHS",
      },
      {
        city: "Chicago",
        state: "IL",
        airport_code: "CHI",
      },
      {
        city: "Honolulu",
        state: "HI",
        airport_code: "HNL",
      },
      {
        city: "Houston",
        state: "TX",
        airport_code: "HOU",
      },
      {
        city: "Las Vegas",
        state: "NV",
        airport_code: "LAS",
      },
      {
        city: "Los Angeles",
        state: "CA",
        airport_code: "LAX",
      },
      {
        city: "Miami",
        state: "FL",
        airport_code: "MIA",
      },
      {
        city: "Myrtle Beach",
        state: "SC",
        airport_code: "MYR",
      },
      {
        city: "Nashville",
        state: "TN",
        airport_code: "BNA",
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
        city: "Palm Springs",
        state: "CA",
        airport_code: "PSP",
      },
      {
        city: "Phoenix",
        state: "AZ",
        airport_code: "PHX",
      },
      {
        city: "Portland",
        state: "OR",
        airport_code: "PDX",
      },
      {
        city: "San Antonio",
        state: "TX",
        airport_code: "SAT",
      },
      {
        city: "San Diego",
        state: "CA",
        airport_code: "SAN",
      },
      {
        city: "San Francisco",
        state:"CA",
        airport_code: "SFO",
      },
      {
        city: "Seattle",
        state: "WA",
        airport_code: "SEA",
      },
      {
        city: "Washington",
        state: "DC",
        airport_code: "WAS",
      },
      {
        city: "San Juan",
        state: "PR",
        airport_code: "SJU",
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
