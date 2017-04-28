bucket iterations
maFindKey: aKey 
	"find an association with given key,
	- answer nil, if key not found
	- answer free association if key not found and there is a free association found in list
	- if key found, answer it "
	| nxt free |	
	free := nil.
	nxt := self.
	[ nxt notNil ] whileTrue: [
		nxt isFree ifTrue: [ free := nxt ] ifFalse: [
			(nxt compareKey: aKey) ifTrue: [ ^ nxt ]
			].
		free ifNil: [ nxt := nxt next ] ifNotNil: [ nxt := nxt skipFree ].
	].
	^ free