tests
testAll
	"Test a variety of keySize and recordSize combinations.  For each pair, run only as far as it takes to get two-deep into duplicates for all originating from one entry in the root record, chosen at random."

	| testCount |
	testCount := 0.
	#(16 24 32 40 56 64 96 128 160 192 256) "keySizes" do:
		[ : keySize |
		#(2 4 8 16 32 64 128) "recordSizes" do:
			[ : recordSize |  | startRecord  |
			"make test run-time reasonable by skipping enough levels to only test the bottom 100000 records or so."
			startRecord := 
				self
					zoomedRecord: keySize 
					recordSize: recordSize 
					childSpace: 10000.
			self notify: 'testing keySize: ', keySize printString, ' recordSize: ', recordSize printString, ', total key span: ', (startRecord highKey - startRecord lowKey) printString.
			self 
				verifyRecord: startRecord					
				do:
					[ : record : eachBax |
					record == startRecord
						ifTrue:
							[ self notify:
								(String streamContents:
									[ : stream |
									stream
										tab; maPrint: 'x:' ;
										maPrint: (record slotIndexForBax: eachBax) ;
										maPrint: ' (~' ;
										maPrint: testCount ;
										maPrint: ' records tested)' ]) ].
					testCount := testCount + 1 ] ] ]