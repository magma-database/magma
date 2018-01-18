serializing
fileOut: anObject toFileNamed: fileName in: aFileDirectory 
	"Write anObject to a file named fileName in aFileDirectory."
	^ aFileDirectory 
		maFileNamed: fileName
		do: 
			[ : stream | 
			stream
				binary ;
				position: 0.
			self 
				object: anObject
				toStream: stream ]