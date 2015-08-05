// app.service('flightInformationService', ['conversionService', '$http',
//   function (geolocationService, $http) {
//     conversionService(function(code){
//       return $http({
//       method: 'JSONP',
//       url: "http://fs-json.demo.vayant.com" + '/',
//       data: {
//         "Version": 2.7,
//         "DepartureFrom": formatDate.format,
//         "User": "Minnie.lee89@gmail.com",
//         "Pass": "0da933f3c6e6d8199ed02797b2e7f538e01e4a72",
//         "Origin": code,
//         "PriceMax": 1000,
//         "Environment": "fast_search_1_0"
//       }
//     });
//     function formatDate() {
//       var current_time = Date.now();
//       var format = moment(current_time).format("YYYY-MM-DDTHH:mm:ssZZ").slice(0,10);
//     }
//   });
// }]);