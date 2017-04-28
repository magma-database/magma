private
numberOfUncommittedInRange
	"This is used to modify the startingAt: of a page-access.  We slide the page left as many in-range as have been inserted prior to my current first key in the page so we can know whether those uncommitted keys should be merged into the resulting segment.  After sliding over, those uncommitted keys will either be part of the *middle* of the segment or not.  If they are still left of it then we must not merge them (unless the startIndex is 1, in which case we know we are at the beginning and so we can merge them).  Otherwise, if they are left of it but the startIndex is >1, we must not merge them (trim them) because the next-lower key on disk may still be higher than them."
	| count indexPosition |
	count := 0.
	indexPosition := collection indexes indexOf: (collection indexNamed: expression attribute) .
	collection changes additionsDo:
		[ : eachObject : eachHashes |
		count := count + 
			((eachHashes at: indexPosition) count: 
				[ : each | each between: expression lowKey and: expression highKey ]) ].
	^ count