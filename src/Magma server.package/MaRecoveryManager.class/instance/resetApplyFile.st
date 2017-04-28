file
resetApplyFile
	"Done with a recovery, now we should truncate the applyFile so future sessions have no chance to encounter the data think recovery operations are needed."
	applyFile
		truncate ;
		close ;
		open