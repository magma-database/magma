as yet unclassified
validateNextOid
	(MaOidCalculator isOidForNewObject: nextOid) ifFalse: 
		[ MagmaUserError signal: 'Magma cannot add more than 4-million new objects at once.' ]