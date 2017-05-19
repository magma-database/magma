enumerating
do: aBlock
	emptyValue ifNotNil: aBlock.
	root ifNotNil: [ root do: aBlock ]