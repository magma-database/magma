serializing
serializeAddedUsing: aMaObjectSerializer

	| added |
	self hasAdditions ifFalse: [ ^self ].
	(added := self added) keysAndValuesDo: 
		[ : eachIndex : eachObject |
		added
			at: eachIndex
			put: (aMaObjectSerializer oidFor: eachObject) ]