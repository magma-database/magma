accessing
indexOfBpMap: bpMapClass 
	"Answer the 0-based index"
	^ (BufferPositionMaps indexOf: bpMapClass) - 1