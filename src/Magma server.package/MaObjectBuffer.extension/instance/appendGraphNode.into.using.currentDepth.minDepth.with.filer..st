*magma server
appendGraphNode: oid into: aMaSerializedGraphBuffer using: aMaReadStrategy currentDepth: anInteger minDepth: minDepth with: alreadyAppendedSet filer: aMaObjectFiler

	| buffer |

	(alreadyAppendedSet includes: oid) ifTrue: [ ^self ].
	alreadyAppendedSet add: oid.
	buffer := aMaObjectFiler
		appendObject: oid
		into: aMaSerializedGraphBuffer.
	buffer
		appendGraphUsing: aMaReadStrategy
		into: aMaSerializedGraphBuffer
		currentDepth: anInteger + 1
		minDepth: minDepth
		with: alreadyAppendedSet
		filer: aMaObjectFiler