private
collect: aBlock into: aMaTree 
	"Since some objects may share a parent, we use the map to make sure we only value each parent just once, so an identical version of that object is kept."
	| map |
	map := IdentityDictionary new.
	self withParentsDo: 
		[ : eachChild : eachParent | 
		eachParent isNil 
			ifTrue: 
				[ aMaTree add:
					(map 
						at: eachChild
						ifAbsentPut: [ aBlock value: eachChild ]) ]
			ifFalse: 
				[ aMaTree 
					add: 
						(map 
							at: eachChild
							ifAbsentPut: [ aBlock value: eachChild ])
					asChildOf: 
						(map 
							at: eachParent
							ifAbsentPut: [ aBlock value: eachParent ]) ] ].
	^ aMaTree