private
physicalSizeFor: storageObject using: bpMapClassOrNil 
	| headerSize |
	headerSize := bpMapClassOrNil
		ifNil: [ self headerSize ]
		ifNotNil: [ self calculateHeaderSizeUsing: bpMapClassOrNil ].
	^ headerSize + (self physicalDataSizeNeededFor: storageObject)