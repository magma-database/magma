private
loadFromIndex: indexInteger pageSize: pageSizeInteger 
	"we can simply integrate the non-persistents all into one dedicated page at the beginning?"
	(self segmentContaining: indexInteger) ifNotNilDo: 
		[ : desiredSegment | 
		"if swapping to a different segment, save memory by clipping its objects."
		(segment notNil and: [ segment ~= desiredSegment ]) ifTrue: [ segment initializeObjects ].
		segment := desiredSegment.
		collection isNewCollection ifFalse: 
			[ self mergeChanges.
			"If merging changes caused segments to shift enough where indexInteger is no longer part of the originally-retrieved segment, then re-retrieve it given that we now know which segment will contain it."
			(self isFiltered and: [ segment notNil and: [ (segment includesIndex: indexInteger) not ] ]) 
				ifTrue: 
					[ self 
						loadFromIndex: indexInteger
						pageSize: pageSizeInteger ]
				ifFalse: [ self stronglyReferencePage ] ] ]