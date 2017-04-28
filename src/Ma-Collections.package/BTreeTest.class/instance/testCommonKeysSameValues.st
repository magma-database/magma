as yet unclassified
testCommonKeysSameValues
	| large small expectedResults results |
	large := BTree new.
	1 to: 1000 by: 2 do: [:i | large at: i put: i].
	small := BTree new.
	2 to: 2000 by: 11 do: [:i | small at: i put: i].
	
	expectedResults := ((-9 to: 1000 by: 22) allButFirst collect: [:i | Array with: i with: i with: i]) asOrderedCollection.
	
	results := OrderedCollection new.
	large commonKeysWith: small keysAndValuesDo:
		[:k :v1 :v2 |
		results add: (Array with: k with: v1 with: v2)].
	self assert: results = expectedResults.
	
	results := OrderedCollection new.
	small commonKeysWith: large keysAndValuesDo:
		[:k :v1 :v2 |
		results add: (Array with: k with: v2 with: v1)].
	self assert: results = expectedResults