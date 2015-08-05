app.service('iataConversion', 
  ['geolocateUser', '$http',
  function (geolocateUser, $http) {
    return geolocateUser.then(function(city){
    return $http.get("https://airport.api.aero/airport/match/" + city, {
      params: {
        "user_key": "8fdd2f669ad0c36eee5dc1d43421fa01"
      }
    }).then(function(response) {
      // conditional if name includes city, return that airport code
      return response.data.airports;
    });
  });
}]);
  

