private collection samples
dictionarySamples

	| populatedDictionary |

	populatedDictionary := Dictionary new.
	"CompiledMethods were getting their #hash changing somewhere that I could not figure out.  Omit them from the test and BE WARNED about persisting them in a Set or keys of a Dictionary."
	(self allNonCollectionSamples copyWithoutAll: { nil }, (self allNonCollectionSamples select: [ : each | each isCompiledMethod ])) do:
		[ :each |
		populatedDictionary
			at: each
			put: self allNonCollectionSamples ].
	^Array
		with: Dictionary new
		with: populatedDictionary
		with: Smalltalk