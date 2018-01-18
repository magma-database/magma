*ma-core
differencesWith: anObject using: comparisonOperator 
	| differences c1 c2 |
	differences := OrderedCollection new.
	self == anObject ifTrue: [ ^ differences ].
	c1 := self maOriginalClass.
	c2 := anObject maOriginalClass.
	c1 instSpec = c2 instSpec ifFalse:
		[ differences add:
			'class' ->
				(Array
					with: c1
					with: c2) ].
	(c1 isBytes and: [ self ~= anObject ]) ifTrue:
		[ differences add:
			'byte-content' ->
				(Array
					with: self
					with: anObject) ].
	(c1 isWords and:
		[ c1 isPointers not and: [ self ~= anObject ] ]) ifTrue:
		[ differences add:
			'word-content' ->
				(Array
					with: self
					with: anObject) ].
	(c1 allInstVarNames intersection: c2 allInstVarNames) do:
		[ : each | | my his | ((my := (self instVarNamed: each) yourself)
			perform: comparisonOperator
			with: (his := (anObject instVarNamed: each) yourself)) ifFalse:
			[ differences add:
				each ->
					(Array
						with: my
						with: his) ] ].
	(c1 allInstVarNames difference: c2 allInstVarNames) do:
		[ : each | differences add:
			each ->
				(Array
					with: (self instVarNamed: each) yourself
					with: 'no inst var named ' , each) ].
	(c2 allInstVarNames difference: c1 allInstVarNames) do:
		[ : each | differences add:
			each ->
				(Array
					with: 'no inst var named ' , each
					with: (anObject instVarNamed: each) yourself) ].
	1
		to: (self basicSize max: anObject basicSize)
		do:
			[ : index | index > self basicSize
				ifTrue:
					[ differences add:
						index ->
							(Array
								with: 'no reference at index ' , index asString
								with: (anObject basicAt: index) yourself) ]
				ifFalse:
					[ index > anObject basicSize
						ifTrue:
							[ differences add:
								index ->
									(Array
										with: (anObject basicAt: index) yourself
										with: 'no reference at index ' , index asString) ]
						ifFalse:
							[ ((self basicAt: index) yourself
								perform: comparisonOperator
								with: (anObject basicAt: index) yourself) ifFalse:
								[ differences add:
									index ->
										(Array
											with: (self basicAt: index) yourself
											with: (anObject basicAt: index) yourself) ] ] ] ].
	^ differences