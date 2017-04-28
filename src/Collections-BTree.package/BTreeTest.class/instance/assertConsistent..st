as yet unclassified
assertConsistent: aBTree
	| depths root |
	root := aBTree root.
	
 " http://www.cs.umbc.edu/~woodcock/cmsc341/btree/defn.html

A B-Tree of order m is a search tree, where the data 
  (or pointers to it) is stored at the leaves, such that:

1) the root is either a leaf (as well--i.e. the tree is 
     a single node) or has between 2 and m children"
	
	self assert: (root isLeaf or: [root values size between: 2 and: aBTree order]).
	
"  2) all other (non-root) nodes have at least m/2 children,
     but no more than m children"

	root allChildrenDo: [:ea | self assert: (ea values size between: (aBTree order // 2) and: aBTree order)]. 

"  3) all leaves are at the same depth"

	depths := Set new.
	root withAllChildrenDo: [:ea | ea isLeaf ifTrue: [depths add: ea depth]].
	self assert: depths size = 1.