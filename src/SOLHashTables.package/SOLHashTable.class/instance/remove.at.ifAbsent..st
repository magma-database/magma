accessing
remove: anObject at: hashKey ifAbsent: aBlock 
	"Remove any object equivalent to anObject  which is presumed to exist at  hashKey.  Answer the removed object if found, nil if not."
	self
		at: hashKey
		do:
			[ : each | each value = anObject ifTrue:
				[ numElements := numElements - 1.
				^ frame detach value ] ].
	^ aBlock value