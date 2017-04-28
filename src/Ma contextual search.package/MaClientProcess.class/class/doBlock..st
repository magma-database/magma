create
doBlock: aBlock

	^self new
		doBlock: aBlock;
		postInitialize;
		yourself