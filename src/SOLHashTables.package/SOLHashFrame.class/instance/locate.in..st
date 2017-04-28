private
locate: startKey in: aNode
	"search down linked list of SOLHashNodes starting with (aNode next) for a node that matches srchKey and srchVal.
	 Return true if found and set  prev,curr,next to point to the 3 nodes in sequence in the list with curr being the found node.
	 Return false if not found and set prev,curr to point to the 2 nodes in sequence in the list between which the <srchKey,srchVal>
	 would have been if they were present (i.e. the insertion point if the search values are to be inserted).
	
	 This method needs to be fairly efficient, as it is called for *every* operation on the hash table."
	| currKey |
	self set: aNode.
	[nil = curr] whileFalse:
	    ["examine the current node"
		currKey := curr key.
		(currKey = startKey) 
			ifTrue: [^true]
			ifFalse:
			    [ "unequal keys, quit searching if we're past the insertion point"
				currKey > startKey ifTrue: [^false]].
		"not found yet, move the frame down the list."
		self advance].
	^false