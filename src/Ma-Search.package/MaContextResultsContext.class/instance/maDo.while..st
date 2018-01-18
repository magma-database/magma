enumeration
maDo: aBlock while: conditionBlock

	conditionBlock value ifFalse: [ ^ self ].
	self do:
		[ : each |
		aBlock value: each.
		conditionBlock value ifFalse: [ ^ self ] ]