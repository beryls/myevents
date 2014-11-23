controllers = angular.module('controllers')
controllers.controller("EventController", [ '$scope', '$routeParams', '$resource', '$location', 'flash'
  ($scope, $routeParams, $resource, $location, flash)->
    Event = $resource('/events/:eventId', { eventId: "@id", format: 'json' },
      {
        'save': {method: 'PUT'},
        'create': {method: 'POST'}
      }
    )

    if $routeParams.eventId
      Event.get({eventId: $routeParams.eventId},
        ((event)-> $scope.event = event),
        ((httpReponse)->
          $scope.event = null
          flash.error   = "There is no event with ID #{$routeParams.eventId}")
      )
    else
      $scope.event = {}

    $scope.back = -> $location.path("/")
    $scope.edit   = -> $location.path("/events/#{$scope.event.id}/edit")
    $scope.cancel = ->
      if $scope.event.id
        $location.path("/events/#{$scope.event.id}")
      else
        $location.path("/")

    $scope.save = ->
      onError = (_httpResponse)-> flash.error = "Something went wrong"
      if $scope.event.id
        $scope.event.$save(
          ( ()-> $location.path("/events/#{$scope.event.id}") ),
          onError)
      else
        Event.create($scope.event,
          ( (newEvent)-> $location.path("/events/#{newEvent.id}") ),
          onError
        )

    $scope.delete = ->
      $scope.event.$delete()
      $scope.back()
])