labels
yLabelAt: labelNumber 
	[ yLabels size < labelNumber ] whileTrue:
		[ plot addMorph:
			(yLabels add:
				((StringMorph
					contents: String empty
					font: plot font)
					 color: plot labelColor ;
					 yourself)) ].
	^ yLabels at: labelNumber