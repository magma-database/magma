*ma base additions
maMatchesElementsOf: anotherCollection
	"Answer whether the receiver points to equivalent objects as
	anotherCollection and in the same order."

	self == anotherCollection ifTrue: [ ^ true ].
	self size = anotherCollection size ifFalse: [ ^false ].
	self
		with: anotherCollection
		do: [ :eachInSelf :eachInOther | eachInSelf = eachInOther ifFalse: [ ^false ] ].
	^true
