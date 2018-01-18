private
postIndependentCopy
self maMarked: 'delete'.
	objects := objects copy.
	oids := oids copy.
	self resetNextOid