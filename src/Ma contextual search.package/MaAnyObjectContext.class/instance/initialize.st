initialize-release
initialize
	super initialize.
"	traversalStrategy := MaObjectGraphTraversalStrategy
				traverseWhen: 
						[:path :parent :index | 
						path last maOriginalClass isPointers and: [(self isGlobal: path last) not]];
				valueWhen: [:path :parent :index | true]"