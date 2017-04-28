accessing
primitiveAttributes
	"Answer a Dictionary of the primitiveAttributes of my filer (with special logic for exploding the single #booleanFlags attribute to all of its logical boolean attributes we really care about)."
	| answer |
	answer := Dictionary new.
	filer primitiveAttributeAddressesMap keysDo: 
		[ : key | 
		key isSymbol ifTrue: 
			[ | desiredKeys |
			desiredKeys := key = #booleanFlags 
				ifTrue: 
					[ {  #restoreMode  } ]
				ifFalse: 
					[ {  key  } ].
			desiredKeys do: 
				[ : eachDesiredKey | 
				answer 
					at: eachDesiredKey
					put: (filer perform: eachDesiredKey) ] ] ].
	^ answer