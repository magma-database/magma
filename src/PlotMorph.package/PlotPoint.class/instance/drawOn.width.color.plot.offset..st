drawing
drawOn: aCanvas width: possiblyOverriddenWidth color: possiblyOverriddenColor plot: aPlotMorph offset: offset
	aCanvas
		fillOval: (scaledPoint - possiblyOverriddenWidth + offset rect: scaledPoint + possiblyOverriddenWidth + offset)
		color: possiblyOverriddenColor