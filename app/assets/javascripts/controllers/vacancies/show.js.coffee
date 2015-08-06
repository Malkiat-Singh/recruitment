@app.controller('VacancyController', ($scope, $rootScope, $state, vacancy) ->

  $scope.vacancy = vacancy
  $scope.strictly = false

  $scope.toggleView = ->
    if $scope.strictly 
      $scope.strictly = false
    else
      $scope.strictly = true
    $scope.updateWorkersList()        

  $scope.updateWorkersList = ->  
    $scope.workers = $scope.vacancy.getList('workers', {strictly: $scope.strictly }).$object

  $scope.updateWorkersList()  

  $scope.deleteVacancy = ->
    $scope.vacancy.remove()
      .then () ->
        $state.go 'vacancies'

)