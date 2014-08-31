
App.controller 'UsersCtrl', ['$scope', '$filter', '$state', 'UserService', ($scope, $filter, $state, User) ->

	$scope.selected = null
	$scope.users = User.query -> sortUsers('first_name')

	# Add User
	
	$scope.addUser = () ->
		if $scope.user
			User.save { user: $scope.user }, (successResponse) ->
				$scope.users.push(successResponse)
				$scope.user = {}
				sortUsers('first_name')
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