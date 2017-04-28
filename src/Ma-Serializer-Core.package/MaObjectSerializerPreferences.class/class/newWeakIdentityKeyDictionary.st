special collections
newWeakIdentityKeyDictionary
	| dict |
	dict := self weakIdentityKeyDictionaryClass new.
	"There is a precendent for using a standard (strong) IdentityKeyDictionary, therefore check that it can #finalizeValues."
"Don't register with WeakArray.  It might be possible for the finalization process to be finalizing at the same time access is occurring (although, since that runs at a higher-priority, it shouldn't).
	However, it seems really don't need this since we clean-up from MagmaSession>>#refreshViewUsing:includingLocal: anyway."
"	(dict respondsTo: #finalizeValues) ifTrue: [ WeakArray addWeakDependent: dict ]."
	^ dict