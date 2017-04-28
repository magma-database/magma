enumerating
maDetect: aBlock ifFound: foundBlock ifNone: exceptionBlock 
	"foundBlock takes one argument, the found object."
"This implementation copied directly from Collection.  For compatibility with the Ma base additions methods too!"
	self 
		do: [ :element | (aBlock value: element) ifTrue: [ ^foundBlock value: element ] ].
	^exceptionBlock value
