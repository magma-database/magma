private
sampling: count in: aMagmaCollectionReader do: oneArgBlock

	| increment |
	increment := (aMagmaCollectionReader size / 2 / count) asInteger max: 1.
	1 
		to: aMagmaCollectionReader size // 2
		by: increment
		do:
			[ : x |
			oneArgBlock value: (aMagmaCollectionReader at: x) ]