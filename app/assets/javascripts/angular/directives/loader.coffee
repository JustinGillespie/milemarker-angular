
App.directive 'loader', ($http) ->
	restrict: 'A'
	template: '<i class="fa fa-circle-o-notch faa-spin animated"></i> Loading...'
	
	link: (scope, elm, attrs) ->
		
		scope.isLoading = -> $http.pendingRequests.length > 0
		
		scope.$watch scope.isLoading, (v) -> 
			scope.loading = v # bubbles up to application controller
			if v then elm.show() else elm.hide()