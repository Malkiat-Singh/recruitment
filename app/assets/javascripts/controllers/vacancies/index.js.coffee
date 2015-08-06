@app.controller('VacanciesController', ($scope, $rootScope, $state, Vacancies) ->

  $scope.updateVacanciesList = ->  
    Vacancies.getList()
      .then (vacancies) ->
        $scope.vacancies = vacancies

  $scope.deleteVacancy = (vacancy) ->
    vacancy.remove()
      .then () ->
        $scope.updateVacanciesList()

  $scope.updateVacanciesList()        

)
