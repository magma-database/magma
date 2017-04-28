private actions
keySizes: keySizesArray withRecordSizes: recordSizesArray run: selectorSymbol

	keySizesArray do:
		[ : eachKeySize |
		recordSizesArray do:
			[ : eachRecordSize |
			{ self 
				newInMemoryHashIndexWithKeySize: eachKeySize
				recordSize: eachRecordSize.
			self
				newHashIndexWithKeySize: eachKeySize
				recordSize: eachRecordSize. }

				do:
					[ : eachIndex |
					index := eachIndex.
					self
						setUp ;
						run: selectorSymbol keySize: eachKeySize recordSize: eachRecordSize ;
						tearDown ] ] ]