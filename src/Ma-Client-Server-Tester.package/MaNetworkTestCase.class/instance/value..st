server
value: aMacsClientRequest 
	| result |
	result := aMacsClientRequest processFor: self.
	^ result == self ifFalse: [ result ]