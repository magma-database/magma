enumerate
historysDo: aBlock 
	super historysDo: aBlock.
	{ 
		clientSideConnectionTimeHistory.
		refreshAllTimeHistory.
		clientSideMcPageReadsTimeHistory.
		clientSideProxyMaterializationTimeHistory.
		clientSideCommitTimeHistory.
		objectsReadPerSecond.
		objectBytesReadPerSecond.
		refreshViewHistory
	 } do: aBlock