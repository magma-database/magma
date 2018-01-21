rm
stringSamples

	| allCharactersString |

	allCharactersString := (0 to: 255) asByteArray asString.
	^Array
		with: String new
		with: 'hello'
		with: allCharactersString
