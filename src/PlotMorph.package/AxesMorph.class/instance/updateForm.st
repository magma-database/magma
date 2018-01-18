drawing
updateForm
	title ifNotNil:
		[ title
			 position: self topLeft + ((self width - title width / 2) rounded @ 0) + (0 @ self borderWidth) ]