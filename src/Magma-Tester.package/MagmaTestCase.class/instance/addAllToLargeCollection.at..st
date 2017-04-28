client
addAllToLargeCollection: aCollection at: aString 
	| root |
	self 
		addAllToLocalCollection: aCollection
		at: aString.
	root := clientSession refresh root.
	clientSession commit: 
		[ aCollection do: 
			[ : each | 
			(root 
				at: aString
				ifAbsentPut: [ MagmaCollection new ]) add: each ] ].
	^ clientSession oidFor: (root at: aString)