*ma-core
maAbbreviatedString
	"This is intended to support two possible string representations for any object
	instead of just one.  The normal one and this abbreivated one.  The normal one provides type-information, the abbreviation provides the identifier.  An abbreviated
	provides a brevity that proves useful when looking at collections or
	other 'container' type objects.

	Suggested usage is to omit the objects type (e.g. class name) for printing abbreviated,
	but include it for standard printOn:"

	^ String streamContents: [ : stream | self maPrintAbbreviatedOn: stream ]