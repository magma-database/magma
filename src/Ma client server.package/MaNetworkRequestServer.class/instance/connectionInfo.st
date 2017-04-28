private
connectionInfo

	^Array
		with: self getNextId
		with: self protocolByteArray