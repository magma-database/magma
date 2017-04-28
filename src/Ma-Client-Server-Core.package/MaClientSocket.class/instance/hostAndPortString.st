private
hostAndPortString
	^ String streamContents: [ : stream | location maPrintAbbreviatedOn: stream ]