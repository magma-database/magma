bucket iterations
do: aBlock
	finList ifNotNil: [ aBlock value: self ].
	next ifNotNil: [ next do: aBlock ]