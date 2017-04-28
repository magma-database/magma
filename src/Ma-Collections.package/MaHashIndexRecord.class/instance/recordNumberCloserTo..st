accessing
recordNumberCloserTo: keyInteger

	^self recordNumberAtByteArrayIndex: (self highestByteArrayIndexFor: keyInteger)
