bucket iterations
maFindKey: aKey ifAbsent: aBlock
	"find an association with given key,
	or free association, found during scanning, or nil"
	| nxt |	
	nxt := self.
	[ nxt notNil ] whileTrue: [
		nxt finList ifNotNil: [ (nxt compareKey: aKey) ifTrue: [ ^ nxt ]].
		nxt := nxt next
	].
	^ aBlock value