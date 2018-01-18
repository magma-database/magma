weak keys
weakKeysTestFor: aClass
	| d |
	d := aClass new.

	d at: 'x' copy put: 'yyy'.
	d at: 'y' put: #zzz.
	Smalltalk garbageCollect.
	self assert:  (d includesKey: 'x') not .
	self assert:  (d at: 'y') = #zzz .
	self assert:  (d includesKey: nil ) not .
	self assert:  d size = 2 .

	d finalizeValues.
	self assert: d size = 1 .
	self assert: (d at: 'y') = #zzz.

	self assert:  (d at: nil put: 'kkk') = 'kkk' .
	self assert:  (d includesKey: nil ) not .