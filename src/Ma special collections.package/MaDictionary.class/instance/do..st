enumerating
do: aBlock
	self associationsDo: [:assoc | aBlock value: assoc value]