myevents = angular.module('myevents',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'authentication',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

myevents.config([ '$routeProvider', 'flashProvider',
  ($routeProvider,flashProvider)->

    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")

    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'EventsController'
      ).when('/login',
        templateUrl: "login.html"
        controller: 'LoginController'
      ).when('/events/new',
        templateUrl: "form.html"
        controller: 'EventController'
      ).when('/events/:eventId',
        templateUrl: "show.html"
        controller: 'EventController'
      ).when('/events/:eventId/edit',
        templateUrl: "form.html"
        controller: 'EventController')
])

controllers = angular.module('controllers', [])
