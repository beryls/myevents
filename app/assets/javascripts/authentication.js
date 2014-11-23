angular.module('authentication', [])

.config(function($httpProvider){
  // Intercepts every http request.  If the response is success, pass it through.  If the response is an
  // error, and that error is 401 (unauthorised) then the user isn't logged in, redirect to the login page
  // var interceptor = function($q, $location, $rootScope) {
  //   return {
  //     'responseError': function(rejection) {
  //       if (rejection.status == 401) {
  //         $rootScope.$broadcast('event:unauthorized');
  //         $location.path('/login');
  //         console.log(rejection);
  //         return rejection;
  //       }
  //       return $q.reject(rejection);
  //     }
  //   };
  // };
  // $httpProvider.interceptors.push(interceptor);

  // console.log($httpProvider);
  // $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

  // var interceptor = ['$location', '$rootScope', '$q', function($location, $rootScope, $q) {
  //     function success(response) {
  //       console.log("Hey!");
  //         return response;
  //     };

  //     function error(response) {
  //       console.log("Ooh");
  //         if (response.status == 401) {
  //             $rootScope.$broadcast('event:unauthorized');
  //             $location.path('/login');
  //             console.log("Ooh");
  //             return response;
  //         };
  //         return $q.reject(response);
  //     };

  //     return function(promise) {
  //       console.log("Promise: " + promise);
  //         return promise.then(success, error);
  //     };
  // }];

  // $httpProvider.interceptors.push(interceptor);
});