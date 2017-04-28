validating
validateCanAdd: anAssociation 
	anAssociation maIsAssociation ifFalse: [ MagmaUserError signal: 'When using #add: with a Dictionary, it must be an Association.' ].
	(equivalenceAttributes allSatisfy:
		[ : each | anAssociation key respondsTo: each ]) ifFalse: [ MagmaUserError signal: anAssociation printString , ' cannot be added to ' , self printString , ' because its key does not respond to all of the indexed attributes.' ].
	(self canIndex: anAssociation key) ifFalse: [ MagmaUserError signal: anAssociation printString , ' cannot be added to ' , self printString , ' because its key does not support all' , ' of the indexable attributes.' ]