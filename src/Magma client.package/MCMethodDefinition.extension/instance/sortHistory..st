*magma client
sortHistory: anOrderedCollection
	"Classes do not have a timestamp, so just answer them in the order added to the library (which, generally, will be in chronological order)."
	^ anOrderedCollection sort: [ : a : b | a dateAndTime > b dateAndTime ]