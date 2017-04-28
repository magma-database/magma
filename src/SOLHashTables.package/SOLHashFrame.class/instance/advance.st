private
advance
	prev := curr.
	curr := next.
	next := next ifNotNil: [ next next ]