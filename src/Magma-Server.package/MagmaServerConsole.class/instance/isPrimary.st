high-availability
isPrimary
	^ self node primaryLocation 
		ifNil: [ false ]
		ifNotNilDo: [ : loc | loc = self thisLocation ]