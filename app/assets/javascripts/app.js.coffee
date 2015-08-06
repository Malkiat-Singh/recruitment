@app = angular.module('app', [
  'ui.router',
  'templates',
  'restangular',
  'ngTagsInput'
])

@app.config([
  '$httpProvider', ($httpProvider)->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])

@app.factory 'Vacancies', [
  'Restangular'
  (Restangular) ->
    service = Restangular.service('vacancies')
]

@app.factory 'Workers', [
  'Restangular'
  (Restangular) ->
    service = Restangular.service('workers')
]

@app.factory 'Skills', [
  'Restangular'
  (Restangular) ->
    service = Restangular.service('skills')
]

@app.filter 'moment', ->
  (date) ->
    moment(date).format 'MMMM Do YYYY'

@app.config (RestangularProvider) ->
  RestangularProvider.setBaseUrl '/api/v1'
  RestangularProvider.addRequestInterceptor (elem, operation, what, url) ->
    if operation == 'post' or operation == 'put'
      wrapper = {}
      wrapper['vacancy'] = if what == "vacancies" then elem 
      wrapper['worker'] = if what == "workers" then elem 
      wrapper['skill'] = if what == "skills" then elem 
    wrapper

@app.run(->
  
)