framework
buildSuite
	| suite |
	suite := super buildSuite.
	suite tests do: [ : each | each suite: suite ].
	^ suite