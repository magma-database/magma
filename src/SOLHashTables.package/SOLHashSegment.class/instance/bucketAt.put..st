accessing
bucketAt: bucketNum put: anObject
	"Set the pointer array at the index corresponding to bucktNum to anObject and return anObject."
	| index |
	index := 1+(bucketNum bitAnd: (owner segMask)).
	[ pointers size < index ] whileTrue: [ pointers add: nil ].
	pointers at: index put: anObject.
	^anObject