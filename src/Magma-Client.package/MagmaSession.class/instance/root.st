accessing
root
	"Answer the root of the domain."
	^ self anchor root in:
		[ : root | immutabilityStrategy ifNil: [ self immutabilityStrategy: root class immutabilityStrategy ].
		root ]