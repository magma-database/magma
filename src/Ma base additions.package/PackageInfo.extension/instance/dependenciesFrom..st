*ma base additions
dependenciesFrom: anotherPackage 
	| answer |
	answer := OrderedCollection new.
	self externalUsers do: 
		[ : each | 
		each key maPackageInfo ifNotNilDo: [ : pi | pi = anotherPackage ifTrue: [ answer add: each ] ] ].
	self externalSubclasses do: 
		[ : each | 
		each maPackageInfo ifNotNilDo: [ : pi | pi = anotherPackage ifTrue: [ answer add: each ] ] ].
	^ answer