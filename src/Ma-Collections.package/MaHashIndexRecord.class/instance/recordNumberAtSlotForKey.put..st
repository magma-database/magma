building
recordNumberAtSlotForKey: keyInteger put: recordNumberInteger

	self
		recordNumberAtByteArrayIndex: (self highestByteArrayIndexFor: keyInteger)
		put: recordNumberInteger
