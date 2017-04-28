private
forceWrite: anObject 
	"This is somewhat of a hacking method to enable us to write objects needed
	for the repository to operate (i.e., commit transactions) during initial creation."
	| commitPackage answer |
	commitPackage := MaCommitPackage new.
	anObject maIsLargeCollection ifTrue: [ commitPackage addLargeCollectionChanges: anObject changes ].
	session serializer 
		serializeGraph: anObject
		do: [ : eachObject | commitPackage addObject: eachObject ].
	"Prime the serializer."
	session begin.
	commitPackage copy serializeObjectsUsing: session.
	commitPackage serializeObjectsUsing: session.
	answer := self forceWritePackage: commitPackage.
	session 
		refreshViewUsing: answer
		includingLocal: false.
	^ answer