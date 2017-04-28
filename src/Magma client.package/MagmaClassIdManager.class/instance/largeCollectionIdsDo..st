special-case
largeCollectionIdsDo: aBlock 
	largeCollectionIds ifNil: 
		[ largeCollectionIds := OrderedCollection new.
		self class largeCollectionClasses do: 
			[ : each | | id |
			(self includesIdForClass: each) 
				ifTrue: [ largeCollectionIds add: (self idForClass: each) ] ] ].
	largeCollectionIds do: aBlock