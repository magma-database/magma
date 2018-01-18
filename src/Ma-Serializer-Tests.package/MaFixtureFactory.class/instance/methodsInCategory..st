private accessing
methodsInCategory: aString 
	^ MaBehaviorFinder new
		addClass: self class ;
		selectMethodsInCategory: aString ;
		methods