app.factory('tripChoiceDataFromApi', 
  ['geolocateUser', '$http', '$q',
  function (geolocateUser, $http, $q) {

    return function(selectTripChoices) {
      var tripPromises = selectTripChoices.map(function(trip){

        return geolocateUser.then(function(origin){
          var destination = trip.airport_code;
          return $http.get("/flights", {
            params: {
              origin_city: origin,
              destination_city: destination
            }
          });

        })
      });
      return $q.all(tripPromises);
    }
  }
]);


//$q wait until all trip promises have "resolved" = the value 
//has returned.  .then is a method that accepts a function
//() allows you to access a future value.
