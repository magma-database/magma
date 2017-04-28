high-availability
isHighlyAvailable
	"Answer whether I am pointed to a secondary server for this repository which will be used automatically as necessary."
	^ primaryLink ~= secondaryLink