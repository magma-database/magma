test Set
verifyTestSet
	"Sets and Dictionary's are supposed to read one-level deep no matter what."
	| holder |
	holder := (clientSession abort root at: 'testSet') anyOne.
	self 
		should: [ holder species = StringHolder ] ;
		should: [ holder contents maIsMutatingProxy ] ;
		should: [ holder contents = 'proxied string' ]