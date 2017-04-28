serializing
serializeAddedUsing: aMaObjectSerializer 
	| added newAdded |
	self hasAdditions ifFalse: [ ^ self ].
	added := self added.
	newAdded := added maOriginalClass new.
	added keysAndValuesDo: 
		[ : eachObject : eachHashIndexValues | 
		newAdded 
			at: (aMaObjectSerializer oidFor: eachObject)
			put: eachHashIndexValues ].
	self added: newAdded