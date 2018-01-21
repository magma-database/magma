ma-core
maMethodHierarchy
	"Answer an OrderedCollection of methods in my class-hierarchy with the same selector as mine."
	| superclasses answer |
	answer := OrderedCollection new.
	superclasses := self actualClass allSuperclasses reverse.
	superclasses do: 
		[ : each | 
		(each includesSelector: self selector) ifTrue: [ answer add: (each >> self selector) maMethodReference ] ].
	self actualClass 
		allSubclassesWithLevelDo: 
			[ : eachClass : level | 
			(eachClass includesSelector: self selector) ifTrue: [ answer add: (eachClass >> self selector) methodReference ] ]
		startingLevel: 0.
	^ answer