initialize-release
initializeAtDepth: newDepth owner: anSOLHashTable
	"Set up a segment with an empty array of pointers in a tree of segments.
	 Depth is measured from the leaves of the tree, starting at 0.
	 Pointers in segments at depth 0 point to SOLHashNodes, at other depths the pointers point to segments of depth-1"

	depth := newDepth.
	owner := anSOLHashTable.
	pointers := owner newPointersCollection