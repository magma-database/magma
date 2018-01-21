i/o
storeDataOn: aDataStream
	"Besides just storing, get me inserted into references, so structures will know about class DiskProxy."

	super storeDataOn: aDataStream.
	aDataStream references at: self put: #none.
		"just so instVarInfo: will find it and put it into structures"