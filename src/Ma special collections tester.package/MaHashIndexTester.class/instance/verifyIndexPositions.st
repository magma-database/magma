private tests
verifyIndexPositions

	| allValues |

	allValues := self allValues.
	(self index
		upTo: allValues size
		keysAndValuesFromIndex: 1) last
			maConsistsOf: allValues