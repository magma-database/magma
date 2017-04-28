accessing
where: aBlock 
	| newReader |
	newReader := self collection where: aBlock.
	newReader expression: newReader expression & self expression.
	^ newReader