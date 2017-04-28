special collections
defaultWeakValueDictionaryClass
	^ MaAutoWeakDictionary supportsAutoCleaning
		ifTrue: [ MaAutoIdentityKeyWeakValueDictionary ]
		ifFalse: [ MaWeakValueDictionary ]