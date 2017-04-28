create
new
	^ super new
		equivalenceAttributes: #(#hash32 ) ;
		addIndex: self indexOnHash ;
		yourself