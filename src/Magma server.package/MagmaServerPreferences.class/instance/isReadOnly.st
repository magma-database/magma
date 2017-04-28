security
isReadOnly

	^ self 
		valueOfAttribute: #isReadOnly
		ifAbsent: [ false ]