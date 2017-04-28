private
highChar
	^ highChar ifNil: 
		[ self bePunctuated.
		highChar ]