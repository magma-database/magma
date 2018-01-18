access
bpMapIndex
	"Answer the index into my BufferPositionMaps array that has my buffer position map.  It is the 4 high-order bits of my controlFields."
	^ self controlFields bitShift: -4