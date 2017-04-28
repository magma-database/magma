debugging
buffersMissingFromWholeWhere: conditionBlock do: twoArgBlock 
	"Value twoArgBlock with an Association whose value is a buffer which references an oid for which there is no buffer and whose key is the oid which is unreferenced."
	| oids |
	oids := PluggableSet integerSet.
	self buffersDo:
		[ : each | oids add: each oid ].
	self buffersDo:
		[ : eachBuffer | eachBuffer isPointers ifTrue:
			[ eachBuffer oids do:
				[ : eachOid | ((MaOidCalculator isOidForOptimizedObject: eachOid) not and:
					[ (oids includes: eachOid) not and: [ conditionBlock value: eachOid ] ]) ifTrue:
					[ twoArgBlock
						value: eachOid
						value: eachBuffer ] ] ] ]