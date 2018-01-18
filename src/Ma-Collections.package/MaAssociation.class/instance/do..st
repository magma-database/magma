as yet unclassified
do: aBlock
	aBlock value: self.
	next ifNotNil: [ next do: aBlock ]