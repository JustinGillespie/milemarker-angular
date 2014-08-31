
# User API Service

App.factory 'UserService', ['$resource', ($resource) ->
	
	$resource '/api/users/:id/:action/:search',
		id: '@id'
		action: '@action'
	,
		update:
			method: "PATCH"
]