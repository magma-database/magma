accessing
lastKnownSize
	| didLoad |
	didLoad := false.
	[ segments isEmpty or: [ segments last atEnd not ] ] whileTrue: 
		[ self getNextSegmentAndLoadIf: [ : nextSeg | false ].
		didLoad := true ].
	didLoad ifTrue: [ collection isNewCollection ifFalse: [ self mergeChanges ] ].
	^ segments last lastKnownSize