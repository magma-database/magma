test major functions
changeIndexKeysInClient1
	| reader changedKeys |
	reader := (clientSession refresh root at: 'testMajorFunctions') where: 
		[ : rdr | 
		rdr 
			read: #yourself
			from: '0'
			to: 'zzzzzzzzzzzzzzzzzzz' ].
	changedKeys := OrderedCollection new.
	self notify: 'in changeIndexKeysInClient1'.
	self 
		sampling: 20
		in: reader
		do: 
			[ : eachKey | 
			changedKeys add: eachKey.
			self reverseString: ((localRoot at: 'testMajorFunctions') detect: [ : each | each = eachKey ]).
			clientSession
				noteOldKeysFor: eachKey ;
				commit: [ self reverseString: eachKey ] ].
	^ changedKeys