
# Bootstrap angular framework
window.App = angular.module "milemarker", ['ngResource', 'ngAnimate', 'ui.router', 'templates', 'angularFileUpload']

App.config ($httpProvider, $stateProvider) ->

	defaults = $httpProvider.defaults.headers

	# CSRF Token Fix
	# TODO: Is this the most secure way? http://bit.ly/1oBhKdG

	authToken = $("meta[name=\"csrf-token\"]").attr("content")
	$httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

	
	# PATCH requests
	
	defaults.patch = defaults.patch || {}
	defaults.patch['Content-Type'] = 'application/json'


	# Routes

	$stateProvider.state 'dashboard',
		url: '/dashboard'
		templateUrl: 'dashboard/index.html'


	$stateProvider.state 'profile',
		url: '/profile'
		templateUrl: 'profile/index.html'


	$stateProvider.state 'projects',
		url: '/projects'
		templateUrl: 'projects/index.html'


	$stateProvider.state 'projects.view',
		url: '/:id'
		templateUrl: 'projects/view.html'
		controller: ($scope, $stateParams) ->
			$scope.showProject($stateParams.id)


	$stateProvider.state 'team',
		url: '/team'
		templateUrl: 'team/index.html'


	$stateProvider.state 'team.view',
		url: '/:id'
		templateUrl: 'team/view.html'
		controller: ($scope, $stateParams) ->
			$scope.showUser($stateParams.id)