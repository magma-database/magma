test non-persistent integration
verifyReaderForNpIntegrationTest: aMagmaCollectionReader
	| toBeRemoved |

"Here are what the Reader contents.  The indented are the ones added afterward and now integrated.
	1 capper
2 charlie denise
	3 a b connie
4 charlie denise
5 tom dick harry
	6 millie dora
7 edward frank
8 edward frank
9 larry greg
10 tom dick harry
11 jack karen
	12 jackie kennedy
13 jack karen
	14 jackie kennedy
15 larry greg
	16 millie dora
17 nancy ozzie
	18 zebra oolong"

	"First, add some out of the range."
	aMagmaCollectionReader collection
		add: #('abba' 'baab')->Object new ;
		add: #('yappo' 'zulu')->Object new.
	self should: [ aMagmaCollectionReader collection size = 15 ].

	"Original sizes should be intact."
	self should: [ aMagmaCollectionReader size = 11 ].
	self should: [ (aMagmaCollectionReader at: 1) key = #('charlie' 'denise') ].
	self should: [ (aMagmaCollectionReader at: 2) key = #('charlie' 'denise') ].
	self should: [ (aMagmaCollectionReader at: 10) key = #('larry' 'greg') ].
	self should: [ (aMagmaCollectionReader at: 11) key = #('nancy' 'ozzie') ].

	"Now add some within the aMagmaCollectionReaders selected range."
	aMagmaCollectionReader collection
		add: #('a' 'b' 'connie')->Object new ;  "connie is the in-range keyword here"
		add: #('millie' 'dora')->Object new ;
		add: #('jackie' 'kennedy')->Object new.

	"All three of the above should now be seamlessly merged in the aMagmaCollectionReader."
	self should: [ (aMagmaCollectionReader at: 1) key = #('charlie' 'denise') ].
	"'connie' is the qualifying key here, not a and b."
	self should: [ (aMagmaCollectionReader at: 2) key = #('a' 'b' 'connie') ].
	self should: [ (aMagmaCollectionReader at: 3) key = #('charlie' 'denise') ].
	self should: [ (toBeRemoved := aMagmaCollectionReader at: 4) key = #('tom' 'dick' 'harry') ].
	self should: [ (aMagmaCollectionReader at: 5) key = #('millie' 'dora') ].
	self should: [ (aMagmaCollectionReader at: 6) key = #('edward' 'frank') ].
	self should: [ (aMagmaCollectionReader at: 7) key = #('edward' 'frank') ].
	self should: [ (aMagmaCollectionReader at: 8) key = #('larry' 'greg') ].
	self should: [ (aMagmaCollectionReader at: 9) key = #('tom' 'dick' 'harry') ].
	self should: [ (aMagmaCollectionReader at: 10) key = #('jack' 'karen') ].
	self should: [ (aMagmaCollectionReader at: 11) key = #('jackie' 'kennedy') ].
	self should: [ (aMagmaCollectionReader at: 12) key = #('jack' 'karen') ].
	self should: [ (aMagmaCollectionReader at: 13) key = #('jackie' 'kennedy') ].
	self should: [ (aMagmaCollectionReader at: 14) key = #('larry' 'greg') ].
	self should: [ (aMagmaCollectionReader at: 15) key = #('millie' 'dora') ].
	self should: [ (aMagmaCollectionReader at: 16) key = #('nancy' 'ozzie') ].
	
	"Now add to before the first persistent and see if it can correctly interleave."
	aMagmaCollectionReader collection add: #('capper')->Object new.  "<- within the range, but before charlie."
	self should: [ aMagmaCollectionReader size = 17 ].
	self should: [ (aMagmaCollectionReader at: 1) key = #('capper') ].

	"Now add to after the last persistent and see if it can correctly interleave."
	aMagmaCollectionReader collection add: #('zebra' 'oolong')->Object new.  "<- oolong within the range, but after nancy."
	self should: [ aMagmaCollectionReader size = 18 ].
	self should: [ (aMagmaCollectionReader at: 18) key = #('zebra' 'oolong') ].

	"Now lets remove from what would be prior to our current page."
	aMagmaCollectionReader collection remove: toBeRemoved.
	self should: [ aMagmaCollectionReader collection size = 19 ].
	self should: [ aMagmaCollectionReader size = 16 ].
	self should: [ (aMagmaCollectionReader at: 3) key = #('a' 'b' 'connie') ].
	self should: [ (aMagmaCollectionReader at: 5) key = #('millie' 'dora') ].
	self should: [ (aMagmaCollectionReader at: 11) key = #('jack' 'karen') ].
	self should: [ (aMagmaCollectionReader at: 16) key = #('zebra' 'oolong') ]