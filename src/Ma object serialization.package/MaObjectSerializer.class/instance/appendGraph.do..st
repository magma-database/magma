private
appendGraph: anObject do: oneArgBlock 
	"Answer a MaSerializedObjectBuffer containing anObject and all objects it can reach, serialized into aByteArray."
	self beBusy.
	anObject
		maGraphDo:
			[ : path : parent : index | (path last
				maShouldAppendWithPath: path
				parent: parent
				index: index) ifTrue:
				[ self append: path last realObjectIfMutatingProxy.
				oneArgBlock value: path last realObjectIfMutatingProxy ] ]
		using: self traversalStrategy.
	self beBored.
	^ self graphBuffer trimByteArray