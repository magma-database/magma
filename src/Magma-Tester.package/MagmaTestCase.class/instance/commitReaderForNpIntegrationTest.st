test non-persistent integration
commitReaderForNpIntegrationTest
	| mc reader |
	mc := self newIndexedMagmaCollection.
	reader := mc where: 
		[ : rdr | 
		rdr 
			read: #key
			from: 'c' "first in reader = charlie denise"
			to: 'oz' "last in reader = nancy oprah" ].
	reader pageSize: 2.	"test with pagesize smaller than sample-range."
	clientSession commit: 
		[ clientSession root 
			at: 'testNpIntegrationForReaders'
			put: reader ]