high-availability
isSecondary
	^ self restoreMode "and: 
		[ self node notNil and: [ self node secondaryLocations includes: self thisLocation ] ]"