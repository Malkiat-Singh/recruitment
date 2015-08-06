@app.controller('VacanciesNewController', ($scope, $rootScope, $state, Vacancies, skills) ->

  $scope.vacancy = {}
  $scope.skills = skills

  $scope.createVacancy = ->
    Vacancies.post $scope.vacancy 
      .then (() ->
        $state.go 'vacancies'
      ), (errors) ->
        $scope.error = errors

)