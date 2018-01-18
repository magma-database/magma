tests
testAddAll
	
	| dict1 dict2 |
	dict1 := self newDict.
	dict1 at: #a put:1 ; at: #b put: 2. 
	dict2 := self newDict.
	dict2 at: #a put: 3 ; at: #c put: 4.
	dict1 addAll: dict2.
	self assert: (dict1 at: #a) = 3.
	self assert: (dict1 at: #b) = 2.
	self assert: (dict1 at: #c) = 4.