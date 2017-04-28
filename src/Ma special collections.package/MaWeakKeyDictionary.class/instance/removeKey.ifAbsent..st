as yet unclassified
removeKey: key ifAbsent: aBlock 
	"Remove key (and its associated value) from the receiver. If key is not in 
	the receiver, answer the result of evaluating aBlock. Otherwise, answer 
	the value externally named by key."
	| index bucket next |
	key ifNil: [ ^ aBlock value ].
	index := self keyHash: key.
	bucket := array at: index.
	bucket ifNil: [ ^ aBlock value ].
	bucket key = key ifTrue: [ 
		tally := tally -1. 
		array at: index put: bucket next. 
		self checkForUnderflow.
		^ bucket value ].
	[(next := bucket next) notNil ] whileTrue: [
		next key = key ifTrue: [ 
		tally := tally - 1. 
		bucket next: next next. 
		self checkForUnderflow.
		^ next value ].
		bucket := next.
	].
	^ aBlock value