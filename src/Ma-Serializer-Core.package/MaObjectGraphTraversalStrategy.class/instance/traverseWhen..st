building
traverseWhen: threeArgBlock
	"The default traversal behavior is to traverse everything.  threeArgBlock
	may be specified to restrict the default traversal (stepping into an objects
	instance variables).  The first argument is an OrderedCollection of the
	path of objects that lead to the current node, the second is the parent
	of the current node (and second to last in the path), the last is the integer
	index of the instVar of the current node."

	traverseWhenBlock := threeArgBlock
