test major functions
removeSomeEntriesInClient2Including: reversedString 
	"Remove reversedString, as well as 20 additional entries using two different methods."
	| stringsRemoved reader localCollection priorReaderSize root |
	root := clientSession refresh root.
	localCollection := localRoot at: 'testMajorFunctions'.
	"First, remove reversedString."
	stringsRemoved := OrderedCollection new.
	reader := (root at: 'testMajorFunctions') where: 
		[ : rdr | 
		rdr 
			read: #yourself
			at: reversedString ].
	clientSession abort.
	self should: 
		[ (reader asArray: 10) allSatisfy: 
			[ : eachString | 
			(eachString 
				copyFrom: 1
				to: (reader sortIndex meaningfulCharacters min: eachString size)) = (reversedString 
					copyFrom: 1
					to: (reader sortIndex meaningfulCharacters min: reversedString size)) ] ].
	priorReaderSize := reader size.
	stringsRemoved add: reader first.
	localCollection remove: reader first.
	clientSession commit: [ (root at: 'testMajorFunctions') remove: reader first ].
	self should: [ reader refresh size = (priorReaderSize - 1) ].
	reader := (root at: 'testMajorFunctions') read: #yourself.

	"Remove 20 random entries, committing each time."
	self 
		sampling: 20
		in: localCollection copy
		do: 
			[ : objectToRemove | 
			stringsRemoved add: objectToRemove.
			clientSession commit: [ (root at: 'testMajorFunctions') remove: objectToRemove ].
			localCollection remove: objectToRemove ].

	"Remove another 20 with a single commit."
	clientSession commit: 
		[ self 
			sampling: 20
			in: localCollection copy
			do: 
				[ : objectToRemove | 
				stringsRemoved add: objectToRemove.
				(root at: 'testMajorFunctions') remove: objectToRemove.
				localCollection remove: objectToRemove ] ].
	^ stringsRemoved