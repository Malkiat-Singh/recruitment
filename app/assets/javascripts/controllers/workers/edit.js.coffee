@app.controller('WorkerEditController', ($scope, $rootScope, $state, skills, worker) ->

  $scope.worker = worker
  $scope.skills = skills

  $scope.updateWorker = ->
    $scope.worker.put()
      .then (() ->
        $state.go 'workers'
      ), (errors) ->
        $scope.error = errors

)
