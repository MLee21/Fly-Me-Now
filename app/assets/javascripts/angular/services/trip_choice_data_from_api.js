app.factory('tripChoiceDataFromApi', 
  ['geolocateUser', '$http', '$q',
  function (geolocateUser, $http, $q) {
    return function(selectTripChoices) {
      return geolocateUser.then(function(origin){
        var tripPromisesByCity = selectTripChoices.reduce(function(tripPromisesByCity, trip){
          var destination = trip.airport_code;
          var tripPromise = $http.get("/flights", {
            params: {
              origin_city: origin,
              destination_city: destination
            }
          }).then(function(response) {
            return response.data;
          });
          tripPromisesByCity[destination] = tripPromise;
          return tripPromisesByCity;
        }, {});

        return $q.all(tripPromisesByCity);
      });
    }
  }
]);


//$q wait until all trip promises have "resolved" = the value 
//has returned.  .then is a method that accepts a function
//() allows you to access a future value.
