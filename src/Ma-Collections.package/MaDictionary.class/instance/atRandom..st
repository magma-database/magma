private
atRandom: aGenerator
	"Its ugly slow, not recommended to use."
	| ind i |
	self emptyCheck.
	ind := aGenerator nextInt: array size.
	i := 1.
	self associationsDo: [:b |  (i=ind) ifTrue: [^b]. i := i +1].

	self errorEmptyCollection.