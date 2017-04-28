access
textStreamDo: oneArgBlock 
	"Value oneArgBlock with a textStream that will then replace my 'text' contents."
	| modifiedTextStream |
	modifiedTextStream := oneArgBlock value: self textStream.
	self text: modifiedTextStream contents