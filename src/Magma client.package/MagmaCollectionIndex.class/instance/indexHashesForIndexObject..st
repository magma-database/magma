private
indexHashesForIndexObject: anObject 
	"Answer a collection of Integers which are the MaHashIndex locations at which anObject will be indexed."
	^ (anObject isCollection and: [ anObject maOriginalClass isPointers ]) 
		ifTrue: [ anObject collect: [ : each | self indexHashForIndexObject: each ] ]
		ifFalse: [ Array with: (self indexHashForIndexObject: anObject) ]