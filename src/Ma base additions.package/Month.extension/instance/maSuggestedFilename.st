*ma base additions
maSuggestedFilename
	"Often, it is useful for month filenames to be sortable, therefore override the standard maSuggestedFilename which would otherwise answer, 'July', 'August', etc."
	^ String streamContents: [ : stream | self maPrintAbbreviatedOn: stream ]