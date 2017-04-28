private
writeBasicAttributesOf: anObject to: aStream 
	self indentInto: aStream.
	(self rowSpecificationFor: anObject) 
		write: anObject
		to: aStream.
	(self rowSpecificationFor: anObject) spacing timesRepeat: [ aStream cr ]