*ma-core
maMaxMemory
	"If the special argument to the vm, -memory, was provided, use number following it.  Else 450MB."
	| foundMemoryArg |
	foundMemoryArg := false.
	self optionsDo: 
		[ : each | 
		(#('-memory' '-mmap') includes: each)
			ifTrue: [ foundMemoryArg := true ]
			ifFalse: 
				[ foundMemoryArg ifTrue: 
					[ | arg |
					arg := each.
					(arg isEmptyOrNil or: [ arg size < 2 ]) ifFalse: 
						[ | requestedMemory |
						requestedMemory := (arg 
							copyFrom: 1
							to: arg size - 1) asNumber.
						requestedMemory > 0 ifTrue: 
							[ arg last = $k 
								ifTrue: [ ^ 1000 * requestedMemory ]
								ifFalse: [ arg last = $m ifTrue: [ ^ 1000000 * requestedMemory ] ] ] ] ] ] ].
	^ self defaultMaxMemory