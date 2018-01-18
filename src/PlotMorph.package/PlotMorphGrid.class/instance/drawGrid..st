accessing
drawGrid: aBoolean 
	drawGrid := aBoolean.
	aBoolean ifFalse:
		[ self
			 trimXlabelsTo: 0 ;
			 trimYlabelsTo: 0 ]