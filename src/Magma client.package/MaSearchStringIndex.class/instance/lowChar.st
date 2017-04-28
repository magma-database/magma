private
lowChar
	^ lowChar ifNil: 
		[ self bePunctuated.
		lowChar ]