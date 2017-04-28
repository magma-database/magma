private
deleteFrom: fileIndex 
	"Delete the particular index of my file numbered fileIndex.  This is used when truncating."
	fileIndex
		to: fileStreams size
		do: [ : n | FileDirectory deleteFilePath: (self nameFor: n) ].
	fileStreams := fileStreams
		copyFrom: 1
		to: fileIndex - 1