debugging
showNodeList
	"Write the entire list of nodes to the transcript.
	 It's not a good idea to do this for large tables."

	| seg depth nx |
	seg := buckets.
	(nil = seg) ifTrue: [depth := 0] ifFalse: [depth := 1 + seg depth].
	Transcript cr; show: '---------- SOLHashTable height='; show: depth; show: ' size='; show: self size; cr.
	nx := 0.
	self allNodesDo:
	    [ :node |
		(node dummy) ifTrue:
		    ["Show the dummy node, no value."
			Transcript show: nx; show: ' hash='; show: ((self hashKey: (node key)) printPaddedWith: $0 to: 8 base: 16);
			             show: ' rvrs='; show: (node key printPaddedWith: $0 to: 8 base: 16); show: ' dummy, [', (self pathForDummy: node), ']';
			             cr]
		ifFalse:
		    ["Show a regular node."
			Transcript show: nx; show: ' hash='; show: ((self hashKey: (node key)) printPaddedWith: $0 to: 8 base: 16);
			             show: ' rvrs='; show: (node key printPaddedWith: $0 to: 8 base: 16); show: ' -> ';
			             show: node value printString;
			             cr].
		nx := nx + 1]