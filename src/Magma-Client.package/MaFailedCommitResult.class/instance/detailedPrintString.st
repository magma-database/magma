printing
detailedPrintString
	^ String streamContents: [ : stream | self printDetailsOn: stream ]