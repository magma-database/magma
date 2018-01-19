high-availability
isPrimary
	^ self node primaryLocation 
		ifNil: [ false ]
		ifNotNil: [ : loc | loc = self thisLocation ]