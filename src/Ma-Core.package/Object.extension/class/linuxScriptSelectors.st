*ma-core
linuxScriptSelectors
	| selectors |
	selectors := Set new.
	self class withAllSuperclassesDo:
		[ : each | selectors
			 addAll: (each methodsInCategory: 'linux-scripts') ;
			 addAll: (each methodsInCategory: '*ma-core-linux-scripts') ].
	^ selectors