enumerating
depthFirstDo: oneArgBlock 
	"Value oneArgBlock with the path of objects in the receiver from each main parent in the order of depthFirst."
	self 
		depthFirstDo: oneArgBlock
		at: nil