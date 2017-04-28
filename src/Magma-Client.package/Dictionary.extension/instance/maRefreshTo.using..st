*magma-client
maRefreshTo: aMaVariableObjectBuffer using: aMagmaSession
	"The linkedOids in aMaVariableObjectBuffer are in key->value pairs."
	| save transformationBlock |
	save := self copy.  "prevent GC of my elements until I get repopulated."
	save size. "prevent compiler from optimizing out."
	self removeAll.
	"Unlike Set, in case this transformation block would possibly return a Proxy, which if for the key would be immediately materialized, if it was for the value, it wouldn't need to be."
	transformationBlock := [ :oid | aMagmaSession serializer objectWithOid: oid ].
	1
		to: aMaVariableObjectBuffer objectInstSize
		by: 2
		do:
			[ :eachKeyIndex | | eachKey eachValue |
			eachKey := aMaVariableObjectBuffer maInstVarAt: eachKeyIndex.
			eachValue := aMaVariableObjectBuffer maInstVarAt: eachKeyIndex + 1.
			self
				at: (transformationBlock value: eachKey)
				put: (transformationBlock value: eachValue) ]