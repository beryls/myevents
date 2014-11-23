controllers = angular.module('controllers')
controllers.controller("EventsController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope, $routeParams, $location, $resource)->
    $scope.search = (keywords)-> $location.path("/").search('keywords', keywords)
    Event = $resource('/events/:eventId', { eventId: "@id", format: 'json' })

    if $routeParams.keywords
      Event.query(keywords: $routeParams.keywords, (results)-> $scope.events = results)
    else
      $scope.events = []

    $scope.view = (eventId)-> $location.path("/events/#{eventId}")
    $scope.newEvent = -> $location.path("/events/new")
    $scope.edit      = (eventId)-> $location.path("/events/#{eventId}/edit")

])