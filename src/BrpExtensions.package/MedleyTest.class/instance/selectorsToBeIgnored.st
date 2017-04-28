Coverage
selectorsToBeIgnored

	^ super selectorsToBeIgnored 
		, #(#setCollections:)	"private or trivial"
		, #(#, #size #do: #new:) "special"