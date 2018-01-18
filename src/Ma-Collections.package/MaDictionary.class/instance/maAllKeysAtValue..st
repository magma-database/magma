accessing
maAllKeysAtValue: anObject

	| aCollection |
	aCollection := OrderedCollection new.
	self keysAndValuesDo: [ :key :value | value = anObject ifTrue: [ aCollection add: key ] ].
	^aCollection
