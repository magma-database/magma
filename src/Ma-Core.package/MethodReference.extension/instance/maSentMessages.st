*ma-core
maSentMessages
	"Answer a Collection of MethodReferences possibly called by this method."
	^ self maSentSelectors 
		inject: OrderedCollection new
		into: 
			[ : oc : each | 
			oc
				addAll: (self systemNavigation allImplementorsOf: each) ;
				yourself ]