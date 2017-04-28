private
removeFromChildren: anObject 
	"There is no removeIdentical:, so I just did it this way.."
	(children at: (self parentOf: anObject)) removeAllSuchThat: [ : each | each == anObject ]