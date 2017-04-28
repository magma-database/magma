fixtures
thousandLevelDeepFixture

	^ fixture
		at: #thousandLevelDeepFixture
		ifAbsentPut:
			[ | rootOfDeepObject |
			rootOfDeepObject := Array new: 1.
			(1 to: 1000)
				inject: rootOfDeepObject
				into:
					[ : prior : x |
					prior at: 1 put: (Array new: 1) ].
			rootOfDeepObject ]