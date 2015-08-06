app.service('flightInformation', 
  ['geolocateUser', '$http',
  function (geolocateUser, $http) {
    return geolocateUser.then(function(city) {
      return $http.get("/flights", {
      params: {
        city: city,
      }
    }).then(function(response){
      return response.data;
    });
  });
}]);
