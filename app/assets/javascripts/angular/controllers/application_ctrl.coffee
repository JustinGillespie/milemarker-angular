
# Main Application Controller

App.controller 'ApplicationCtrl', ['$scope', '$window', 'UserService', ($scope, $window, User) ->	
	User.getList().then (users) -> $scope.users = users
]
