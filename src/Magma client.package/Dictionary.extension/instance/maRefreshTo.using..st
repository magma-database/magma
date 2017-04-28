*magma client
maRefreshTo: aMaVariableObjectBuffer using: aMagmaSession
	"The linkedOids in aMaVariableObjectBuffer are in key->value pairs."
	| save transformationBlock |
	save := self copy.  "prevent GC of my elements until I get repopulated."
	self removeAll.
	transformationBlock := [ :oid | aMagmaSession serializer objectWithOid: oid ].
	1
		to: aMaVariableObjectBuffer objectInstSize
		by: 2
		do:
			[ :eachKeyIndex | | eachKey eachValue |
			eachKey := aMaVariableObjectBuffer maInstVarAt: eachKeyIndex.
			eachValue := aMaVariableObjectBuffer maInstVarAt: eachKeyIndex + 1.
			self
				at: (transformationBlock value: eachKey) realObjectIfMutatingProxy
				put: (transformationBlock value: eachValue) ]