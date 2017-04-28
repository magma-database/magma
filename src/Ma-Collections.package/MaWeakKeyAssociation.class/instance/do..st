as yet unclassified
do: aBlock 
	| k |
	k := self key.
	k ifNotNil: [ aBlock value: self ].
	next ifNotNil: [ next do: aBlock ]