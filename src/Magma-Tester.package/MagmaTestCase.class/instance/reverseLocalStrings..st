test major functions
reverseLocalStrings: aCollection
	"aCollection of strings that are already reversed, need to replace their normal counterparts in my local collection."

	aCollection do:
		[ :e |
		| reversee |
		(localRoot at: 'testMajorFunctions')
			remove: e reverse;
			add: e ]