access
removeKey: key ifAbsent: aBlock 
	"Remove key (and its associated value) from the receiver. If key is not in 
	the receiver, answer the result of evaluating aBlock. Otherwise, answer 
	the value externally named by key."
	| index bucket next |
	index := self keyHash: key.
	bucket := self bucketAt: index.
	bucket ifNil: [ ^ aBlock value ].
	bucket key = key ifTrue: [ |nxt|
		tally := tally -1. 
		array at: index put: (nxt:=bucket next).
		nxt ifNotNil: [ collisions := collisions-1 ].
		^ bucket value ].
	[(next := bucket next) notNil ] whileTrue: [
		next key = key ifTrue: [ 
		tally := tally - 1. 
		bucket next: next next. 
		collisions := collisions-1.
		^ next value ].
		bucket := next.
	].
	^ aBlock value