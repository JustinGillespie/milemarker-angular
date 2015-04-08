
# Projects API Service

App.factory 'ProjectService', ['$resource', ($resource) ->
	
	$resource '/api/projects/:id/:action/',
		id: '@id'
		action: '@action'
	,
		update:
			method: "PATCH"
]