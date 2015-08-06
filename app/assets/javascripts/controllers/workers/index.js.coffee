@app.controller('WorkersController', ($scope, $rootScope, $state, Workers) ->


  $scope.updateWorkersList = ->  
    Workers.getList()
      .then (workers) ->
        $scope.workers = workers

  $scope.deleteWorker = (worker) ->
    worker.remove()
      .then () ->
        $scope.updateWorkersList()

  $scope.updateWorkersList()        

)