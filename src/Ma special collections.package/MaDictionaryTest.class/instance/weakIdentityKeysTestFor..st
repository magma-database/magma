weak keys
weakIdentityKeysTestFor: aClass
	| d k1 k2 |
	d := aClass new.

	k1 := 'x' copy.
	k2 := k1 copy.

	d at: k1 put: 1.
	d at: k2 put: 2.

	self assert:  (d at: k1) == 1 .
	self assert:  (d at: k2) == 2 .

	d at: k1 put: k2.
	k1 := nil.
	k2 := nil.
	Smalltalk garbageCollect.
	self assert:  d size = 2 .
	self assert:  (d includesKey: nil) not.
	self assert: ( d values includes: 2).
	self assert: ( d values includes: 1) not.
	d primFinalizeValues.
	self assert: d size = 1 .
	Smalltalk garbageCollect.
	d primFinalizeValues.
	self assert:  d size = 0 .