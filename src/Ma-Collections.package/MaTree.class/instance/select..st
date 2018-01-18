enumerating
select: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument.  Answer a new Set, only those elements for which aBlock evaluates to true."
	| newCollection |
	newCollection := Set new.
	self do: [ : each | (aBlock value: each) ifTrue: [ newCollection add: each ] ].
	^ newCollection