
App.controller 'UsersCtrl', ['$scope', '$filter', '$state', 'UserService', ($scope, $filter, $state, User) ->

	$scope.selected = null
	$scope.users = User.query -> sortUsers('first_name')

	# Add User
	
	$scope.addUser = (user) ->
		if user
			User.save { user: user }, (successResponse) ->
				$scope.users.push(successResponse)
				sortUsers('first_name')
				user = {}
			, (errorResponse) ->
				angular.forEach errorResponse.data.errors, (value, key) -> alert value

	# Remove User
	
	$scope.removeUser = (idx) ->
		u = $scope.users[idx]
		User.delete { id: u.id }, (response) -> $scope.users.splice(idx, 1)

	# Show User	

	$scope.showUser = (user_id) ->
		$scope.selected = null

		User.get { id: user_id }, (user) ->
			$scope.selected = user
		, (errorResponse) -> 
			$state.go('team')


	# Sort
	
	sortUsers = (sortby) ->
		$scope.users = $filter('orderBy')($scope.users, sortby, false)

]