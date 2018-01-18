accessing
advance: anInteger 
	"Advance the progress bar by anInteger units.  This should be put at the end of a loop of client processing work to support a graceful pause and cancel operations."
	progressor advance: anInteger.
	self
		 changed ;
		 waitForResume