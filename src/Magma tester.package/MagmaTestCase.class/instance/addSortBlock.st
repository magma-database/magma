test blocks
addSortBlock

	clientSession commit: [ clientSession root at: 'testBlocks' put: self sortBlock ].
	"to be sure it survives a refresh-attempt"
	clientSession commit: [ ]