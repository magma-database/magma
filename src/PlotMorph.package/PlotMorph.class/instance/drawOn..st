drawing
drawOn: aCanvas 
	super drawOn: aCanvas.
	crosshairStyle = #off ifFalse: [ self drawCrosshairOn: aCanvas ].
	leftSelectedX
		ifNil:
			[ lastHandPosition ifNotNil:
				[ lensStyle = #off ifFalse:
					[ (self scaledPointsAtScreenPosition: lastHandPosition) do:
						[ : eachPlotPoint | eachPlotPoint
							drawEmphasizedOn: aCanvas
							plot: self
							offset: self topLeft.
						lensStyle = #labelled ifTrue:
							[ | string pos | string := (self formattedY: eachPlotPoint y).
							pos := eachPlotPoint scaledPoint + self topLeft + (4@(-6)).
							aCanvas
								fillRectangle: (pos rect: (pos x + (self font widthOfString: string))@(pos y + (self font heightOf: $|))) color: (Color black alpha: 0.5) ;
								drawString: string
								at: pos
								font: self font
								color: eachPlotPoint color ] ] ] ] ]
		ifNotNil:
			[ self selectionVertices ifNotEmpty:
				[ : vertices | aCanvas
					drawPolygon: vertices asArray
					color: (Color yellow alpha: 0.5)
					borderWidth: 0
					borderColor: Color yellow ] ]