as yet unclassified
finalizeValues
	"This can be expensive, only do it if it has been a while."
	self isTimeToClean ifTrue: 
		[ self primFinalizeValues.
		self resetLastClean ]