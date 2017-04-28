actions
graphFrom: oid do: aBlock
	"Value aBlock against every buffer in the receivers file."
	| readStrategy shouldClose |
	shouldClose := false.
	objectCount := 0.
	repositoryController ifNil: [ shouldClose := true. self open ].
	readStrategy := MaBasicReadStrategy minimumDepth: 0.
	MagmaNotification signal: 'Beginning traversal of ', oid printString, ' of ', directory pathName.
	graphBuffer := MaSerializedGraphBuffer new: 1000.
	[ self initializeOidsVisited.
	self
		graphFrom: oid
		do: aBlock
		using: readStrategy ]

		ensure:
			[ shouldClose ifTrue: [ self close ].
			self deleteOidsVisited ].
	MagmaNotification signal: 'Traversal of ', oid printString, ' of ', directory pathName, ' complete.'