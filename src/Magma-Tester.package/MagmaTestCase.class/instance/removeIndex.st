test major functions
removeIndex

	| mc |
	clientSession abort.
	mc := clientSession root at: 'testMajorFunctions'.
	clientSession commit: [ mc removeIndexNamed: #yourself ]