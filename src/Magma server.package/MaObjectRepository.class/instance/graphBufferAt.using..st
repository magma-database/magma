accessing
graphBufferAt: oidInteger using: aMaReadStrategy
	"Answers a MaSerializedGraphBuffer."

	| answer rootBuffer |
	answer := MaSerializedGraphBuffer new: 400.
	rootBuffer := 
		filer
			appendObject: oidInteger
			into: answer.
	rootBuffer
		appendGraphUsing: aMaReadStrategy
		into: answer
		currentDepth: 1
		minDepth: aMaReadStrategy minimumDepth
		with: Set new
		filer: filer.
	^ answer