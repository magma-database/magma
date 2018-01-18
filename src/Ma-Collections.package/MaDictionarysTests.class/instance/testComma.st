tests
testComma
	
	| dict1 dict2 dict3 |
	dict1 := self newDict.
	dict1 at: #a put:1 ; at: #b put: 2. 
	dict2 := self newDict.
	dict2 at: #a put: 3 ; at: #c put: 4.
	dict3 := dict1, dict2.
	self assert: (dict3 at: #a) = 3.
	self assert: (dict3 at: #b) = 2.
	self assert: (dict3 at: #c) = 4.