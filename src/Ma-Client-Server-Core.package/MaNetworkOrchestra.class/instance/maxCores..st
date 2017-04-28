core-management
maxCores: anInteger 
	"Limit the number of simultaneously launched images to anInteger.  An unlimited number of players may be added to the orchestra, but only the specified number will be running at a time.  Remaining players are launched as the initial ones exit.
	This parameter can be changed even after the Orchestra is already running."
	guard critical:
		[ cores := cores
			ifNil: [ Array new: anInteger ]
			ifNotNil:
				[ anInteger > cores size
					ifTrue: [ cores , (Array new: anInteger - cores size) ]
					ifFalse:
						[ anInteger < cores size
							ifTrue:
								[ cores
									copyFrom: 1
									to: anInteger ]
							ifFalse: [ cores ] ] ] ]