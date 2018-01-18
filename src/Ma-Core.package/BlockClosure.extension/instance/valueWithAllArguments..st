*ma-core
valueWithAllArguments: anArray 
	"Same as valueWithPossibleArgs: except for a one-arg block, which is sure to pass all of anArray rather than just the first of its arguments.  This is used to allow a large, variable number of arguments to be passed."
	^numArgs = 0
		ifTrue: [self value]
		ifFalse:
			[self valueWithPossibleArgs:
				(numArgs = anArray size
					ifTrue: [anArray]
					ifFalse:
						[numArgs > anArray size
							ifTrue: [anArray, (Array new: numArgs - anArray size)]
							ifFalse:
								[numArgs = 1
									ifTrue: [Array with: anArray]
									ifFalse: [anArray copyFrom: 1 to: numArgs]]])]