initialize
initializePreMadeRecords
	preMadeRecords := { 
		(MaBeginApplyRecord new).
		(MaBeforeImageRecord new).
		(MaFileGrowthRecord new).
		(MaNewFileRecord new).
		(MaEndApplyRecord new).
		(MaCommitLogRecord new)
	 }