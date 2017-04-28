test MagmaHashTable
populateHashTable
	| hashTable |
	hashTable := clientSession root at: #testMagmaHashTable.
	self hashTableKeys do:
		[ : each | hashTable add: each -> each printString ]