private
prepareForScan
	"A scan is about to begin.  Ensure you're ready to do it by initializing any resources and setting the position of the scan back to the beginning."

	subcontexts do: [ : each | each prepareForScan ]