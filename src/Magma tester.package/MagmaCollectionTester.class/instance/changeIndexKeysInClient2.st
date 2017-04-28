test major functions
changeIndexKeysInClient2
	| stringsChanged reader |
	stringsChanged := OrderedCollection new.
	self notify: 'in changeIndexKeysInClient2'.
	reader := (clientSession refresh root at: 'testMajorFunctions') where: 
		[ : rdr | 
		rdr 
			read: #yourself
			from: '0'
			to: 'zzzzzzzzzzzzzzzzzzzzzzz' ].
	self 
		sampling: 10
		in: reader
		do: 
			[ : eachString | 
			clientSession
				noteOldKeysFor: eachString ;
				commit: [ self reverseString: eachString ].
			stringsChanged add: eachString ].
	^ stringsChanged