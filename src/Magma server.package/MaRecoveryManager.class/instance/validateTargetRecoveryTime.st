private
validateTargetRecoveryTime
	targetRecoveryTime ifNotNil: 
		[ targetRecoveryTime class name = DateAndTime ifFalse: 
			[ MagmaUserError signal: 'targetRecoveryTime should be a kind of DateAndTime.' ] ]