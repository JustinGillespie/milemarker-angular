
App.controller 'ProfileCtrl', ['$scope', '$upload', 'UserService', ($scope, $upload, User) ->

	$scope.user = User.get { id: 0, action: 'edit' }, (u) -> # Success

	$scope.updateUserProfile = () ->
		User.update { id: 0, user: $scope.user }, (successResponse) ->
			console.log(successResponse)


	# PATCH request needs to be made
	# Check form names

	$scope.onFileSelect = ($files) ->
		if $files and $files.length > 0
			console.log "TEST"
			$scope.upload = $upload.upload(
				url: "api/users/profile"
				method: "PATCH"
				file: $files
				fileFormDataName: 'user[image]'
			).progress((evt) ->
				console.log "percent: " + parseInt(100.0 * evt.loaded / evt.total)
				return
			).success((data, status, headers, config) ->
				$scope.user.image = data.image
				return
			)
		return



]