accessing
current
	^ current ifNil:
		[ self current: self new.
		current ]