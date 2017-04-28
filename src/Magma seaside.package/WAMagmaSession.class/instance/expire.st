as yet unclassified
expire

	super expire.
	magmaSession ifNotNil: [ magmaSession disconnect. magmaSession := nil ]