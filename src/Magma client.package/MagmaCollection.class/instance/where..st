accessing
where: aBlock 
	| reader |
	reader := self newReader.
	aBlock value: reader.
	^ reader normalize