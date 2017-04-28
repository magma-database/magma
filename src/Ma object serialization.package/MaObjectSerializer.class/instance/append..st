private
append: anObject
	"Append only anObject to the receiver.  However, in the case where anObject is stored via a storage-object (see #maAsStorageObject), the entire graph of the storage object must be stored."

	| storageObject |
	storageObject := anObject maAsStorageObject.
	anObject maWantsPreSerialization ifTrue: [ self preSerialize: storageObject ].
	storageObject ~~ anObject
		ifTrue:
			[ "This is a storage object, so traverse it deeply into an inner serialized graph ByteArray."
			storageObject := (self copyForStorageObject serializeGraph: storageObject) trimmedByteArray ].
	self graphBuffer increaseBufferSizeBy:
		(self
			bufferFor: anObject
			storageObject: storageObject
			startingAt: self graphBuffer bufferSize)
				physicalSize.
	"Since the need is so scarce anyway, if you order pre-serialization, you get post too."
	anObject maWantsPreSerialization ifTrue: [ self postSerialize: storageObject ]