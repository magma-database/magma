private
newReducedReaderOn: attribute makeDistinct: aBoolean 
	"Create a new MagmaCollection and install it on the server without going through the normal transaction process.  This is nothing more than a transient object that happens to require server support."
	| newMc index |
	index := self indexNamed: attribute.
	newMc := MagmaCollection new.
	newMc addIndex: index.
	collection isNewCollection 
		ifTrue: 
			[ aBoolean 
				ifTrue: [ self asSet do: [ : each | newMc add: each ] ]
				ifFalse: [ self do: [ : each | newMc add: each ] ] ]
		ifFalse: 
			[ collection 
				load: newMc
				from: self
				makeDistinct: aBoolean ].
	^ newMc read: attribute