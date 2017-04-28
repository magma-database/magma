api
do: aBlock snapshotAs: imageName andQuit: shouldQuit 
	self do: aBlock.
	imageName
		ifNil:
			[ shouldQuit ifTrue:
				[ Smalltalk
					snapshot: false
					andQuit: shouldQuit ] ]
		ifNotNil:
			[ | fixedName |
			fixedName := (imageName endsWith: '.image')
				ifTrue: [ imageName ]
				ifFalse: [ imageName , '.image' ].
			(FileDirectory default fullNameFor: fixedName) = Smalltalk imageName
				ifTrue:
					[ Smalltalk
						snapshot: true
						andQuit: shouldQuit ]
				ifFalse:
					[ Smalltalk maSaveAs: imageName.
					"Avoid instant-quit when relaunching by resaving."
					shouldQuit ifTrue:
						[ Smalltalk
							snapshot: true
							andQuit: shouldQuit ] ] ]