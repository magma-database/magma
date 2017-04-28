*magma-client-debugging
infoFor: oidInteger

	| obj |
	obj :=
		self
			objectWithOid: oidInteger
			ifNone:
				[ ^(self isOidForNewObject: oidInteger)
					ifTrue: [ 'new object' ]
					ifFalse: [ 'index position: ', (self indexPositionForOid: oidInteger) printString ] ].
	^'(' , obj printString , ')'