bucket iterations
maFindKey: aKey ifAbsent: aBlock ifFree: aBlockFree
	"find an association with given key,
	or free association, found during scanning, or nil"
	| nxt free |	
	free := nil.
	nxt := self.
	[ nxt notNil ] whileTrue: [
		nxt finList ifNil: [ free := nxt ] ifNotNil: [
			(nxt compareKey: aKey) ifTrue: [ ^ nxt ]
			].
		nxt := nxt next
	].
	^ free ifNil: aBlock ifNotNil: [ aBlockFree value: free ]