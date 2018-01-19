*ma-core
whyNeeded: anotherPackage 
	| answer |
	answer := OrderedCollection new.
	anotherPackage externalUsers do: 
		[ : each | 
		each key packageInfo ifNotNil: [ : pi | pi = self ifTrue: [ answer add: each ] ] ].
	anotherPackage externalSubclasses do: 
		[ : each | 
		each packageInfo ifNotNil: [ : pi | pi = self ifTrue: [ answer add: each ] ] ].
	^ answer