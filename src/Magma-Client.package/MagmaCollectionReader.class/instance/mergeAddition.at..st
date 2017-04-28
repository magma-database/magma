private
mergeAddition: anObject at: hashKey 
	"Fixup my segments by acknowledging that anObject exists in this reader at positions hashKeys.  If anObject is in the range of the active page (i.e., my 'segment'), then add it to its objects collection."
	| sortNeeded |
	sortNeeded := false.
	self 
		merge: 
			[ : containingSegment | 
			containingSegment == segment ifTrue: 
				[ sortNeeded := true.
				segment addObject: hashKey->anObject ] ]
		at: hashKey
		advance: 1.
	^ sortNeeded