magma-collections
collectionManagerFor: oidInteger

	^ self
		collectionManagerFor: oidInteger
		ifAbsent:
			[ MagmaSoftwareError signal:
				'MagmaCollection ' , oidInteger printString ,
					' not found.  MaObjectRepository>>collectionManagerFor:' ]