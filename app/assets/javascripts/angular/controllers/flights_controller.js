// angular
//     .module('App',[])
//     .controller('recordsCollectionController',function($scope){
    //     $scope.selected = {};
    //     $scope.destinations = [
    //         {"id":1,"name":"Homer"},
    //         {"id":2,"name":"Marge"},
    //         {"id":3,"name":"Bart"},
    //         {"id":4,"name":"Lisa"},
    //         {"id":5,"name":"Maggie"}
    //     ];

    //     $scope.maxSelected = function(){
    //         var count = 0;
    //         for(x in $scope.selected){
    //             if($scope.selected[x]) count++;
    //         }
    //         return (count===3) ? true : false;
    //     };
    // });



function TripChoicesController($scope){
  $scope.selected = {};

  $scope.destinations = [
    {
      city: "Austin",
      state: "TX",
      airport_code: "AUS",
      isChecked: false
    },
    {
      city: "Boston",
      state: "MA",
      airport_code: "BOS",
      isChecked: false
    },
    {
      city: "Charleston",
      state: "SC",
      airport_code: "CHS",
      isChecked: false
    },
    {
      city: "Chicago",
      state: "IL",
      airport_code: "CHI",
      isChecked: false
    },
    {
      city: "Honolulu",
      state: "HI",
      airport_code: "HNL",
      isChecked: false
    },
    {
      city: "Houston",
      state: "TX",
      airport_code: "HOU",
      isChecked: false
    },
    {
      city: "Las Vegas",
      state: "NV",
      airport_code: "LAS",
      isChecked: false
    },
    {
      city: "Los Angeles",
      state: "CA",
      airport_code: "LAX",
      isChecked: false
    },
    {
      city: "Miami",
      state: "FL",
      airport_code: "MIA",
      isChecked: false
    },
    {
      city: "Myrtle Beach",
      state: "SC",
      airport_code: "MYR",
      isChecked: false
    },
    {
      city: "Nashville",
      state: "TN",
      airport_code: "BNA",
      isChecked: false
    },
    {
      city: "New Orleans",
      state: "LA",
      airport_code: "MSY",
      isChecked: false
    },
    {
      city: 'New York',
      state: "NY",
      airport_code: "NYC",
      isChecked: false

    },
    {
      city: 'Orlando',
      state: "FL",
      airport_code: "MCO",
      isChecked: false
    },
    {
      city: "Palm Springs",
      state: "CA",
      airport_code: "PSP",
      isChecked: false
    },
    {
      city: "Phoenix",
      state: "AZ",
      airport_code: "PHX",
      isChecked: false
    },
    {
      city: "Portland",
      state: "OR",
      airport_code: "PDX",
      isChecked: false
    },
    {
      city: "San Antonio",
      state: "TX",
      airport_code: "SAT",
      isChecked: false
    },
    {
      city: "San Diego",
      state: "CA",
      airport_code: "SAN",
      isChecked: false
    },
    {
      city: "San Francisco",
      state:"CA",
      airport_code: "SFO",
      isChecked: false
    },
    {
      city: "Seattle",
      state: "WA",
      airport_code: "SEA",
      isChecked: false
    },
    {
      city: "Washington",
      state: "DC",
      airport_code: "WAS",
      isChecked: false
    },
    {
      city: "San Juan",
      state: "PR",
      airport_code: "SJU",
      isChecked: false
    }
  ];
  
  $scope.maxSelected = function(){
    var count = 0;
    for(x in $scope.selected){
        if($scope.selected[x]) count++;
    }
    return (count===3) ? true : false;
  };

};






//only allow 3 cities to be selected
//upon click, box turns blue
//grab airport code of destination, 
//send each destination to FlightInformation Service 1 at a time
//Flight Information Service needs to accept a destination airport
