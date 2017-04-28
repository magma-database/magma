sort
descending: aBoolean 
	self isSorted ifFalse: [ MagmaUserError signal: 'not sorted' ].
	reversed := aBoolean