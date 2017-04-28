plot
plot
	(Smalltalk hasClassNamed: #PlotMorph) ifFalse: 
		[ MaEnvironmentError signal: 'PlotMorph must be loaded to perform this function' ].
	^ self plotOn: (Smalltalk classNamed: #PlotMorph) new