test blocks
addSortBlock

	clientSession commit: [ clientSession root at: #testSortBlock put: self sortBlock ].
	"to be sure it survives a refresh-attempt"
	clientSession commit: [ ]