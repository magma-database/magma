create
newTraverseForSerialization
	^ self new traverseWhen:
		[ : path : parent : indexInteger | path last
			maShouldTraverseWithPath: path
			parent: parent
			index: indexInteger ]