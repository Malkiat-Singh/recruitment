@app.controller('WorkersNewController', ($scope, $rootScope, $state, Workers, skills) ->

  $scope.worker = {status: "active"}
  $scope.skills = skills

  $scope.createWorker = ->
    Workers.post $scope.worker 
      .then (() ->
        $state.go 'workers'
      ), (errors) ->
        $scope.error = errors


)