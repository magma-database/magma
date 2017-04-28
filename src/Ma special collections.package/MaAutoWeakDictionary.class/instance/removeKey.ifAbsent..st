accessing
removeKey: key ifAbsent: aBlock 
	"Remove key (and its associated value) from the receiver. If key is not in 
	the receiver, answer the result of evaluating aBlock. Otherwise, answer 
	the value externally named by key."
	| bucket val |
	
	bucket := (array at: (self keyHash: key)) maFindKey: key ifAbsent: [ ^ aBlock value ].
	"we're not deleting the association, just clearing it out"
	val := bucket value.
	bucket clear.
	tally := tally - 1. 
	self checkForUnderflow.
	^ val
