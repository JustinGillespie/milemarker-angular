
# Bootstrap angular framework
window.App = angular.module "milemarker", ['ui.router', 'restangular', 'templates']

App.config ($httpProvider, $stateProvider, $urlRouterProvider) ->

	# CSRF Token Fix
	# TODO: Is this the most secure way? http://bit.ly/1oBhKdG
	
	authToken = $("meta[name=\"csrf-token\"]").attr("content")
	$httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

  # Routes

	$stateProvider.state "root",
		url: ""
		views:
			"main":    { templateUrl: "dashboard/index.html" }
			"sidebar": { template: "" }

	$stateProvider.state "index",
		url: "/"
		views:
			"main":    { templateUrl: "dashboard/index.html" }
			"sidebar": { template: "" }

	$stateProvider.state "users",
		url: "/team"
		views:
			"main":    { templateUrl: "users/index.html" }
			"sidebar": { template: "users sidebar" }

	$stateProvider.state "projects",
		url: "/projects"
		views:
			"main":    { templateUrl: "projects/index.html" }

	$stateProvider.state "projects/new",
		url: "/projects/new"
		views:
			"main":    { templateUrl: "projects/new.html" }
