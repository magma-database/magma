initialize-release
initializeKeywords
	super initializeKeywords.
	subcontexts do: [ : each | each initializeKeywords ]