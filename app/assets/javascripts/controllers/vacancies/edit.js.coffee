@app.controller('VacancyEditController', ($scope, $rootScope, $state, vacancy, skills) ->

  $scope.vacancy = vacancy
  $scope.skills = skills

  $scope.updateVacancy = ->
    $scope.vacancy.put()
      .then (() ->
        $state.go 'vacancies'
      ), (errors) ->
        $scope.error = errors

)