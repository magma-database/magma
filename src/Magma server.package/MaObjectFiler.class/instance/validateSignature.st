actions
validateSignature
	self signature = MaObjectRepository recognitionSignature ifFalse: 
		[ MagmaUserError signal: 'This does not appear to be a Magma database.' ]