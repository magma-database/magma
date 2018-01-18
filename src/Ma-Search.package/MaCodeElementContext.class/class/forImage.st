as yet unclassified
forImage

	^ MaCompositeContext new
		name: 'Code-elements in this image' ;
"		addContext: self forPackages ;  "
		addContext: self forClasses ;
		addContext: self forMethods ;
		yourself