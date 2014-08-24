
# Bootstrap angular framework
window.App = angular.module "milemarker", ['ui.router', 'restangular', 'templates']

App.config ($httpProvider, $stateProvider, $urlRouterProvider) ->

	# CSRF Token Fix
	# TODO: Is this the most secure way? http://bit.ly/1oBhKdG
	
	authToken = $("meta[name=\"csrf-token\"]").attr("content")
	$httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

  # Routes

	$stateProvider.state "index",
			url: "/"
			views:
				"projects":    { template: "" }
				"anotherview": { template: "" }

		$stateProvider.state "state1",
			url: "/fuckyou"
			views:
				"projects":
					#templateUrl: "projects/index.html"
					template: "Sup dog."
				"anotherview":
					#templateUrl: "projects/show.html"
					template: "I kill you."