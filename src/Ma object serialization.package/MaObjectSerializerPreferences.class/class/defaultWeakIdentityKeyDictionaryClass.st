special collections
defaultWeakIdentityKeyDictionaryClass
	^ "MaAutoWeakDictionary supportsAutoCleaning
		ifTrue: [ MaAutoWeakIdentityKeyDictionary ]
		ifFalse: [ MaWeakIdentityKeyDictionary ]"

"Do not use AutoDictionary's for now, my initial tests show they do not collect properly..?"

MaWeakIdentityKeyDictionary