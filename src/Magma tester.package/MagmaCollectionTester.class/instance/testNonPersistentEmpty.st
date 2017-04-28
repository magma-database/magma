test querys - non-persistent empty
testNonPersistentEmpty
	| mc oc |
	mc := self newMc.
	oc := OrderedCollection new.
	self 
		verifyMc: mc
		against: oc