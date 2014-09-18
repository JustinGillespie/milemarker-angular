
App.directive 'imgcrop', ['UtilService', (util) -> 
	restrict: 'E'
	replace: true
	templateUrl: 'directives/imgcrop.html'
	scope:
		target: '@'

	link: (scope,element,attrs) ->
		element.find('img').bind 'load', () ->
			element.width $(this).width()
			element.height $(this).height()

]