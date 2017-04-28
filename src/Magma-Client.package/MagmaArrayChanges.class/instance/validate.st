testing
validate
	self additionsDo: 
		[ : index : eachObject | 
		index > 0 ifFalse: 
			[ MagmaUserError signal: 'Cannot add to a MagmaArray at position ' , index asString ] ]