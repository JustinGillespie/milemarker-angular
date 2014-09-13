
App.directive 'field', ['UtilService', (util) -> 
	restrict: 'E'
	replace: true
	scope: true
	templateUrl: 'directives/field.html'

	link: (scope,element,attrs) ->
		
		scope.model = attrs.model.split('.')[0]
		scope.name  = attrs.model.split('.')[1]
		scope.type  = attrs.type or 'text'
		scope.label = attrs.label or util.humanize(scope.name)
		
		scope.validate =  if !attrs.validate then true else false

		# cleanup

		element.removeAttr('type')
		element.removeAttr('model')
		element.removeAttr('label')
		element.removeAttr('validate')
]