test non-persistent integration
testNonPersistentReader
	| mc reader |
	mc := self newIndexedMagmaCollection.
	reader := mc where: 
		[ : rdr | 
		rdr 
			read: #key
			from: 'c'
			to: 'oz' ].
	reader pageSize: 2.	"test with pagesize smaller than sample-range."
	self verifyReaderForNpIntegrationTest: reader