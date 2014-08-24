
# User API Service

App.factory 'UserService', ['Restangular', (Restangular) ->
	Restangular.all('api/users')
]