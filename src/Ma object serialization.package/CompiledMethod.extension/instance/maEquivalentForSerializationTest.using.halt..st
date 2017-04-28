*ma object serialization
maEquivalentForSerializationTest: method using: alreadyComparedDictionary halt: shouldHalt 
	| numLits |
	"Answer whether the receiver implements the same code as the 
	argument, method."
	(method isKindOf: CompiledMethod) ifFalse: [^false].
	self size = method size ifFalse: [^false].
	self header = method header ifFalse: [^false].
	self initialPC to: self endPC do:
		[:i | (self at: i) = (method at: i) ifFalse: [^false]].
	(numLits := self numLiterals) ~= method numLiterals ifTrue: [^false].
	"``Dont bother checking FFI and named primitives''
	 (#(117 120) includes: self primitive) ifTrue: [^ true]."
	1 to: numLits do:
		[:i| | lit1 lit2 |
		lit1 := self literalAt: i.
		lit2 := method literalAt: i.
		(lit1 == lit2 or: [lit1 literalEqual: lit2]) ifFalse:
			[(i = 1 and: [#(117 120) includes: self primitive])
				ifTrue:
					[lit1 isArray
						ifTrue:
							[(lit2 isArray and: [lit1 allButLast = lit2 allButLast])
								ifFalse: [^false]]
						ifFalse: "ExternalLibraryFunction"
							[(lit1 analogousCodeTo: lit2)
								ifFalse: [^false]]]
				ifFalse:
					[i = (numLits - 1)
						ifTrue: "properties"
							[(self properties analogousCodeTo: method properties)
								ifFalse: [^false]]
						ifFalse: [^lit1 maEquivalentForSerializationTest: lit2 using: alreadyComparedDictionary halt: shouldHalt  ]]]].
	^true