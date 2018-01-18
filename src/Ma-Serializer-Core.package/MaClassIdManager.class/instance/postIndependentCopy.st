private
postIndependentCopy
self maMarked: 'delete'.
	classesById := classesById copy.
	idsByClass := idsByClass copy.
	classDefinitionsById := classDefinitionsById copy.
	inImageDefinitions := inImageDefinitions copy