private-querys tests
whereAndSelectBlockPairs
	"Answer a collection of two-element Arrays.  The first-element of each Array is the where block, the second is the corresponding select block.  These are used to verify MagmaCollection(Readers) against the Smalltalk collections."
	^ { 
		(Array 
			with: 
				[ : reader | 
				(reader 
					read: #first
					from: 3999
					to: 4999) & (reader 
						read: #second
						from: '3/1/2006' asDate
						to: '4/1/2015' asDate) ]
			with: 
				[ : each | 
				(each first 
					between: 3999
					and: 4999) & (each second 
						between: '3/1/2006' asDate
						and: '4/1/2015' asDate) ]).

		"disjunction, > one-page of results"
		(Array 
			with: 
				[ : reader | 
				(reader 
					read: #first
					from: 3999
					to: 4999) | (reader 
						read: #second
						from: '3/1/2006' asDate
						to: '4/1/2015' asDate) ]
			with: 
				[ : each | 
				(each first 
					between: 3999
					and: 4999) | (each second 
						between: '3/1/2006' asDate
						and: '4/1/2015' asDate) ]).

		"0 results"
		(Array 
			with: [ : reader | reader read: #first at: 3005 ]
			with: [ : each | each = 3005 ]).
		"complex (MaExpression composition), with keywords"
		(Array 
			with: 
				[ : reader | 
				(reader 
					read: #third
					from: 'ma'
					to: 'p') | ((reader 
						read: #first
						from: 3999
						to: 4999) | (reader 
							read: #second
							from: '3/1/2006' asDate
							to: '4/1/2015' asDate)) ]
			with: 
				[ : each | 
				(each third anySatisfy: 
					[ : any | 
					"sigh, must match keyword index strippage of out-off-range characters.."
					(any asUppercase select: [ : e | e asciiValue between: 33 and: 96])
						between: 'MA'
						and: 'P' ]) | ((each first 
						between: 3999
						and: 4999) | (each second 
							between: '3/1/2006' asDate
							and: '4/1/2015' asDate)) ])
	 }