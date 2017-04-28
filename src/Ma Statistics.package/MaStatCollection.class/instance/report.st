reporting
report
	"Print a report of all my stats."
	^ String streamContents: [ : stream | self printReportTo: stream ]