*ma base additions
whyNeeded: anotherPackage 
	| answer |
	answer := OrderedCollection new.
	anotherPackage externalUsers do: 
		[ : each | 
		each key maPackageInfo ifNotNilDo: [ : pi | pi = self ifTrue: [ answer add: each ] ] ].
	anotherPackage externalSubclasses do: 
		[ : each | 
		each maPackageInfo ifNotNilDo: [ : pi | pi = self ifTrue: [ answer add: each ] ] ].
	^ answer