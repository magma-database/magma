private
convertToMagmaArray
	| oldPointers |
	oldPointers := pointers.
	pointers := MagmaArray new
		 pageSize: 1 ;
		 yourself.
	oldPointers withIndexDo:
		[ : each : x | pointers
			at: x
			put: each ]