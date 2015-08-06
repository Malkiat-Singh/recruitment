
@app.config ($stateProvider, $urlRouterProvider, $httpProvider) ->

  $urlRouterProvider.otherwise '/vacancies'
  $stateProvider
    .state 'vacancies',
      url: '/vacancies'
      templateUrl: 'assets/templates/vacancies/index.html'
      controller: 'VacanciesController'

    .state 'vacanciesNew',
      url: '/vacancies/new'
      templateUrl: 'assets/templates/vacancies/new.html'
      controller: 'VacanciesNewController'    
      resolve:
        skills: ($stateParams, Skills) -> 
          Skills.getList()         

    .state 'vacancyEdit',
      url: '/vacancies/:vacancy_id/edit'
      templateUrl: 'assets/templates/vacancies/edit.html'
      controller: 'VacancyEditController'
      resolve:
        vacancy: ($stateParams, Vacancies) ->
          Vacancies.one($stateParams.vacancy_id).get()      
        skills: ($stateParams, Skills) -> 
          Skills.getList()          

    .state 'vacancy',
      url: '/vacancies/:vacancy_id'
      templateUrl: 'assets/templates/vacancies/show.html'
      controller: 'VacancyController'  
      resolve:
        vacancy: ($stateParams, Vacancies) ->
          Vacancies.one($stateParams.vacancy_id).get()

    .state 'workers',
      url: '/workers'
      templateUrl: 'assets/templates/workers/index.html'
      controller: 'WorkersController'

    .state 'workersNew',
      url: '/workers/new'
      templateUrl: 'assets/templates/workers/new.html'
      controller: 'WorkersNewController'
      resolve:
        skills: ($stateParams, Skills) -> 
          Skills.getList()            

    .state 'workerEdit',
      url: '/workers/:worker_id/edit'
      templateUrl: 'assets/templates/workers/edit.html'
      controller: 'WorkerEditController'
      resolve:
        worker: ($stateParams, Workers) ->
          Workers.one($stateParams.worker_id).get()
        skills: ($stateParams, Skills) -> 
          Skills.getList()

    .state 'worker',
      url: '/workers/:worker_id'
      templateUrl: 'assets/templates/workers/show.html'
      controller: 'WorkerController'  
      resolve:
        worker: ($stateParams, Workers) ->
          Workers.one($stateParams.worker_id).get()
