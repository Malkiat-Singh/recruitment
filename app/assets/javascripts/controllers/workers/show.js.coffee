@app.controller('WorkerController', ($scope, $rootScope, $state, worker) ->

  $scope.worker = worker
  $scope.strictly = false

  $scope.toggleView = ->
    if $scope.strictly 
      $scope.strictly = false
    else
      $scope.strictly = true
    $scope.updateVacanciesList()        

  $scope.updateVacanciesList = ->  
    $scope.vacancies = $scope.worker.getList('vacancies', {strictly: $scope.strictly }).$object

  $scope.updateVacanciesList()  

  $scope.deleteWorker = ->
    $scope.worker.remove()
      .then () ->
        $state.go 'workers'

)
