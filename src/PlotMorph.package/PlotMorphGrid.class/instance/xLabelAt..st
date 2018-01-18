labels
xLabelAt: labelNumber 
	[ xLabels size < labelNumber ] whileTrue:
		[ plot addMorph:
			(xLabels add:
				((StringMorph
					contents: String empty
					font: plot font)
					 color: plot labelColor ;
					 yourself)) ].
	^ xLabels at: labelNumber