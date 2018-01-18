accessing
color: aColor 
	super color: aColor.
	grid updateLabelColors.
	xLabel
		 color: self labelColor twiceLighter twiceLighter ;
		 backgroundColor: aColor twiceLighter lighter.
	yLabel
		 color: self labelColor twiceLighter twiceLighter ;
		 backgroundColor: aColor twiceLighter lighter