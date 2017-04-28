private
newCommitPackageFor: aMaTransaction 
	"It is possible to that we will serialize up to three times.  If we add a new LargeCollection that also adds instances of a new class, the first serialization will detect the new LargeCollection, the second notices the new classes, the third gets everything right.."
	| commitPackage mustReserialize |
	commitPackage := aMaTransaction changedObjects.
	mustReserialize := commitPackage serializeObjectsUsing: self.
	^ mustReserialize
		ifTrue:
			[ self
				 prepareReadStrategy ;
				 newCommitPackageFor: aMaTransaction ]
		ifFalse: [ commitPackage ]