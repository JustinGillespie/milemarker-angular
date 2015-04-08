
App.controller 'ProjectsCtrl', ['$scope', '$filter', '$state', 'ProjectService', ($scope, $filter, $state, Project) ->

	$scope.selected = null
	$scope.projects = Project.query -> # success

	# Add Project

	$scope.addProject = (project) ->
		if project
			Project.save { project: project }, (successResponse) ->
				$scope.projects.push(successResponse)
				project = {}
			, (errorResponse) ->
				angular.forEach errorResponse.data.errors, (value, key) -> alert value

	# Remove Project
	
	$scope.removeProject = (idx) ->
		p = $scope.projects[idx]
		Project.delete { id: p.id }, (response) -> $scope.projects.splice(idx, 1)

	# Show Project	

	$scope.showProject = (project_id) ->
		$scope.selected = null

		Project.get { id: project_id }, (project) ->
			$scope.selected = project
		, (errorResponse) -> $state.go('projects')
]