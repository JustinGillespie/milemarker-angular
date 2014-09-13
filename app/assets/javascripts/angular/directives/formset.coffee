
App.directive 'formset', () -> 
	restrict: 'E'
	transclude: true
	replace: true
	template: '<form ng-transclude novalidate></form>'