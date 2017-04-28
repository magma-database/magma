testing
determineIfSupported
	"Answer whether this image can support auto-cleaning weak dictionary's.  This requires Igor's finalization enhancement produced in Q1/2010."
	| weakFinalizationListClass weakFinalizerItem list item |
	weakFinalizationListClass := Smalltalk classNamed: #WeakFinalizationList.
	weakFinalizerItem := Smalltalk classNamed: #WeakFinalizerItem.
	weakFinalizationListClass ifNil: [ ^ false ].
	weakFinalizerItem ifNil: [ ^ false ].
	list := weakFinalizationListClass new.
	item := (Smalltalk classNamed: #WeakFinalizerItem) new
		list: list
		object: Object new
		executor: nil.
	list first isNil ifFalse: [ ^ false ].
	item object notNil ifFalse: [ ^ false ].
	Smalltalk garbageCollect.
	item object isNil ifFalse: [ ^ false ].
	list first == item ifFalse: [ ^ false ].
	list first next == nil ifFalse: [ ^ false ].
	^ true