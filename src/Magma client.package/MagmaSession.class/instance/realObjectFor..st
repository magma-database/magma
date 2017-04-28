private
realObjectFor: oid 
	^ guard critical:
		[ | result answer readTime |
		readTime := Time millisecondsToRun:
			[ result := self read: oid.
			answer := self materializeObject: result byteArray ].
		self statistics clientSideProxyMaterializationTimeHistory addValue: readTime.
		readTime > 0 ifTrue:
			[ "I don't like capturing this because it requires an enumeration of the buffers, which could be slowing things down.  Only uncomment if necessary."
			"self statistics objectsReadPerSecond addValue: serializer graphBuffer objectCount * 1000 // readTime."
			self statistics objectBytesReadPerSecond addValue: serializer graphBuffer bufferSize * 1000 // readTime ].
		answer ]