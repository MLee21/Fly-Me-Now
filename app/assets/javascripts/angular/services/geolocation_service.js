app.factory('geolocateUser', function($window, $q) {
  var deferred = $q.defer();

  $window.navigator.geolocation.getCurrentPosition(function(position){
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    geocoder.geocode({'latLng': latlng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        var result = results[0];
        var city = "";
        var state = "";
        for(var i=0, len=result.address_components.length; i<len; i++) {
          var ac = result.address_components[i];
          if(ac.types.indexOf("locality") >= 0) city = ac.long_name;
          if(ac.types.indexOf("administrative_area_level_1") >= 0) state = ac.long_name;
        }
        if(city != '' && state != '') {
          deferred.resolve(city);
        }
      }
    });
  });
  
  return deferred.promise; 
});