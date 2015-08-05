app.service('conversionService', 
  ['geolocateUser', '$http',
  function (geolocateUser, $http) {
    return geolocateUser.then(function(city){
      return $http.get({
        url: "https://airport.api.aero/airport/",
        data: {
          "city": city,
          "user_key": "8fdd2f669ad0c36eee5dc1d43421fa01"
        }
      }).then(function(response){
        return response.airports[0].code;
      });
    });
  });
}]);
  